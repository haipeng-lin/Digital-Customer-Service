package com.flash.human.service;

import com.flash.human.domain.vo.DhAvatarCategoryVo;
import com.flash.human.domain.bo.DhAvatarCategoryBo;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 形象分类Service接口
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
public interface IDhAvatarCategoryService {

    /**
     * 查询形象分类
     *
     * @param id 主键
     * @return 形象分类
     */
    DhAvatarCategoryVo queryById(Long id);

    /**
     * 分页查询形象分类列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 形象分类分页列表
     */
    TableDataInfo<DhAvatarCategoryVo> queryPageList(DhAvatarCategoryBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的形象分类列表
     *
     * @param bo 查询条件
     * @return 形象分类列表
     */
    List<DhAvatarCategoryVo> queryList(DhAvatarCategoryBo bo);

    /**
     * 新增形象分类
     *
     * @param bo 形象分类
     * @return 是否新增成功
     */
    Boolean insertByBo(DhAvatarCategoryBo bo);

    /**
     * 修改形象分类
     *
     * @param bo 形象分类
     * @return 是否修改成功
     */
    Boolean updateByBo(DhAvatarCategoryBo bo);

    /**
     * 校验并批量删除形象分类信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
