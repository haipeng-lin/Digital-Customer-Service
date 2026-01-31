package com.flash.human.service;

import com.flash.human.domain.vo.DhBackgroudVo;
import com.flash.human.domain.bo.DhBackgroudBo;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 背景Service接口
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
public interface IDhBackgroudService {

    /**
     * 查询背景
     *
     * @param id 主键
     * @return 背景
     */
    DhBackgroudVo queryById(Long id);

    /**
     * 分页查询背景列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 背景分页列表
     */
    TableDataInfo<DhBackgroudVo> queryPageList(DhBackgroudBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的背景列表
     *
     * @param bo 查询条件
     * @return 背景列表
     */
    List<DhBackgroudVo> queryList(DhBackgroudBo bo);

    /**
     * 新增背景
     *
     * @param bo 背景
     * @return 是否新增成功
     */
    Boolean insertByBo(DhBackgroudBo bo);

    /**
     * 修改背景
     *
     * @param bo 背景
     * @return 是否修改成功
     */
    Boolean updateByBo(DhBackgroudBo bo);

    /**
     * 校验并批量删除背景信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
