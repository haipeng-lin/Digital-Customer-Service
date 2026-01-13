package com.flash.knowledge.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flash.common.core.utils.MapstructUtils;
import com.flash.common.core.utils.StringUtils;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.knowledge.domain.KbDocument;
import com.flash.knowledge.domain.bo.KbDocumentBo;
import com.flash.knowledge.domain.vo.KbDocumentVo;
import com.flash.knowledge.mapper.KbDocumentMapper;
import com.flash.knowledge.service.IKbDocumentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

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
        Page<KbDocumentVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
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
        lqw.eq(StringUtils.isNotBlank(bo.getIsEnable()), KbDocument::getIsEnable, bo.getIsEnable());
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
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(KbDocument entity){
        //TODO 做一些数据校验,如唯一约束
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
}
