package com.flash.knowledge.service;

import com.flash.knowledge.domain.vo.KbCategoryVo;
import com.flash.knowledge.domain.bo.KbCategoryBo;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 知识库分类Service接口
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
public interface IKbCategoryService {

    /**
     * 查询知识库分类
     *
     * @param id 主键
     * @return 知识库分类
     */
    KbCategoryVo queryById(Long id);

    /**
     * 分页查询知识库分类列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 知识库分类分页列表
     */
    TableDataInfo<KbCategoryVo> queryPageList(KbCategoryBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的知识库分类列表
     *
     * @param bo 查询条件
     * @return 知识库分类列表
     */
    List<KbCategoryVo> queryList(KbCategoryBo bo);

    /**
     * 新增知识库分类
     *
     * @param bo 知识库分类
     * @return 是否新增成功
     */
    Boolean insertByBo(KbCategoryBo bo);

    /**
     * 修改知识库分类
     *
     * @param bo 知识库分类
     * @return 是否修改成功
     */
    Boolean updateByBo(KbCategoryBo bo);

    /**
     * 校验并批量删除知识库分类信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
