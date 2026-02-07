package com.flash.knowledge.service;

import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.knowledge.domain.bo.KbDocumentBo;
import com.flash.knowledge.domain.vo.KbDocumentVo;

import java.util.Collection;
import java.util.List;

/**
 * 知识库文档Service接口
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
public interface IKbDocumentService {

    /**
     * 查询知识库文档
     *
     * @param id 主键
     * @return 知识库文档
     */
    KbDocumentVo queryById(Long id);

    /**
     * 分页查询知识库文档列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 知识库文档分页列表
     */
    TableDataInfo<KbDocumentVo> queryPageList(KbDocumentBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的知识库文档列表
     *
     * @param bo 查询条件
     * @return 知识库文档列表
     */
    List<KbDocumentVo> queryList(KbDocumentBo bo);

    /**
     * 新增知识库文档
     *
     * @param bo 知识库文档
     * @return 是否新增成功
     */
    Boolean insertByBo(KbDocumentBo bo);

    /**
     * 修改知识库文档
     *
     * @param bo 知识库文档
     * @return 是否修改成功
     */
    Boolean updateByBo(KbDocumentBo bo);

    /**
     * 校验并批量删除知识库文档信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 修改状态
     *
     * @param id     id
     * @param status 状态
     * @return 结果
     */
    int updateStatus(Long id, String status);
}
