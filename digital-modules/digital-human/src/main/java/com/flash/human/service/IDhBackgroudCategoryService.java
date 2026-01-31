package com.flash.human.service;

import com.flash.human.domain.vo.DhBackgroudCategoryVo;
import com.flash.human.domain.bo.DhBackgroudCategoryBo;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 背景分类Service接口
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
public interface IDhBackgroudCategoryService {

    /**
     * 查询背景分类
     *
     * @param id 主键
     * @return 背景分类
     */
    DhBackgroudCategoryVo queryById(Long id);

    /**
     * 分页查询背景分类列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 背景分类分页列表
     */
    TableDataInfo<DhBackgroudCategoryVo> queryPageList(DhBackgroudCategoryBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的背景分类列表
     *
     * @param bo 查询条件
     * @return 背景分类列表
     */
    List<DhBackgroudCategoryVo> queryList(DhBackgroudCategoryBo bo);

    /**
     * 新增背景分类
     *
     * @param bo 背景分类
     * @return 是否新增成功
     */
    Boolean insertByBo(DhBackgroudCategoryBo bo);

    /**
     * 修改背景分类
     *
     * @param bo 背景分类
     * @return 是否修改成功
     */
    Boolean updateByBo(DhBackgroudCategoryBo bo);

    /**
     * 校验并批量删除背景分类信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
