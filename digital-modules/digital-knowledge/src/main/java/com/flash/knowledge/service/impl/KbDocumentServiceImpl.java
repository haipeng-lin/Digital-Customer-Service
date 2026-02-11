package com.flash.knowledge.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flash.common.core.exception.ServiceException;
import com.flash.common.core.utils.MapstructUtils;
import com.flash.common.core.utils.StringUtils;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.knowledge.domain.KbDocument;
import com.flash.knowledge.domain.bo.KbDocumentBo;
import com.flash.knowledge.domain.vo.KbDocumentVo;
import com.flash.knowledge.mapper.KbDocumentMapper;
import com.flash.knowledge.service.IKbDocumentService;
import dev.langchain4j.data.document.Document;
import dev.langchain4j.data.document.splitter.DocumentByParagraphSplitter;
import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.store.embedding.EmbeddingStoreIngestor;
import dev.langchain4j.store.embedding.filter.MetadataFilterBuilder;
import dev.langchain4j.store.embedding.pgvector.PgVectorEmbeddingStore;
import jakarta.annotation.Resource;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 知识库文档Service业务层处理
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class KbDocumentServiceImpl implements IKbDocumentService {

    private final KbDocumentMapper baseMapper;

    @Resource
    private EmbeddingModel embeddingModel;

    @Resource
    private PgVectorEmbeddingStore pgVectorEmbeddingStore;

    /**
     * 查询知识库文档
     *
     * @param id 主键
     * @return 知识库文档
     */
    @Override
    public KbDocumentVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询知识库文档列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 知识库文档分页列表
     */
    @Override
    public TableDataInfo<KbDocumentVo> queryPageList(KbDocumentBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<KbDocument> lqw = buildQueryWrapper(bo);
        Page<KbDocumentVo> result = baseMapper.selectQueryPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的知识库文档列表
     *
     * @param bo 查询条件
     * @return 知识库文档列表
     */
    @Override
    public List<KbDocumentVo> queryList(KbDocumentBo bo) {
        LambdaQueryWrapper<KbDocument> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<KbDocument> buildQueryWrapper(KbDocumentBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<KbDocument> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(KbDocument::getId);
        lqw.eq(bo.getKbCategoryId() != null, KbDocument::getKbCategoryId, bo.getKbCategoryId());
        lqw.eq(StringUtils.isNotBlank(bo.getTitle()), KbDocument::getTitle, bo.getTitle());
        lqw.eq(StringUtils.isNotBlank(bo.getTag()), KbDocument::getTag, bo.getTag());
        lqw.eq(StringUtils.isNotBlank(bo.getContent()), KbDocument::getContent, bo.getContent());
        return lqw;
    }

    /**
     * 新增知识库文档
     *
     * @param bo 知识库文档
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(KbDocumentBo bo) {
        KbDocument add = MapstructUtils.convert(bo, KbDocument.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }

        // 第二步：使用 LangChain4j 将文本转化为 Document 对象
        Document document = Document.from(bo.getContent());
        document.metadata().put("doc_id", add.getId()).put("title", add.getTitle());
        // 关键：在元数据中记录原始文档 ID，方便后续关联或删除
        // 2、文档分割器：将每个文档按每段进行分割，最大 1000 字符，每次重叠最多 200 个字符
        DocumentByParagraphSplitter paragraphSplitter = new DocumentByParagraphSplitter(1000, 200);
        // 3、自定义文档加载器
        EmbeddingStoreIngestor ingestor = EmbeddingStoreIngestor.builder()
            .documentSplitter(paragraphSplitter)

            // 使用向量模型
            .embeddingModel(embeddingModel)
            // 指定 PgVector 向量存储
            .embeddingStore(pgVectorEmbeddingStore)
            .build();

        ingestor.ingest(document);

        return flag;
    }

    /**
     * 修改知识库文档
     *
     * @param bo 知识库文档
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(KbDocumentBo bo) {
        KbDocument update = MapstructUtils.convert(bo, KbDocument.class);
        validEntityBeforeSave(update);
        // 1. 更新关系型数据库
        boolean flag = baseMapper.updateById(update) > 0;

        if (flag) {
            // 2. 清理向量库中的旧知识
            // 注意：这里必须保证存储时的 key ("doc_id") 和类型与此处一致
            pgVectorEmbeddingStore.removeAll(
                MetadataFilterBuilder.metadataKey("doc_id").isEqualTo(update.getId())
            );

            // 3. 重新向量化新内容并入库
            Document document = Document.from(update.getContent());
            // 依然使用 put 保持元数据关联
            document.metadata().put("doc_id", update.getId()).put("title", update.getTitle());

            // 使用和你 insertByBo 相同的配置
            DocumentByParagraphSplitter paragraphSplitter = new DocumentByParagraphSplitter(1000, 200);

            EmbeddingStoreIngestor ingestor = EmbeddingStoreIngestor.builder()
                .documentSplitter(paragraphSplitter)
                .embeddingModel(embeddingModel)
                .embeddingStore(pgVectorEmbeddingStore)
                .build();

            // 执行重新入库
            ingestor.ingest(document);
        }
        return flag;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(KbDocument entity){
        LambdaQueryWrapper<KbDocument> lqw = Wrappers.lambdaQuery();
        lqw.eq(KbDocument::getKbCategoryId, entity.getKbCategoryId());
        lqw.eq(KbDocument::getTitle, entity.getTitle());
        KbDocument kbDocument = baseMapper.selectOne(lqw);
        if (kbDocument != null && !Objects.equals(entity.getId(), kbDocument.getId())) {
            throw new ServiceException("该分类下已存在该标题的文档");
        }
    }

    /**
     * 校验并批量删除知识库文档信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteByIds(ids) > 0;
    }

    @Override
    public int updateStatus(Long id, String status) {
        return baseMapper.update(null,
            new LambdaUpdateWrapper<KbDocument>()
                .set(KbDocument::getStatus, status)
                .eq(KbDocument::getId, id));
    }
}
