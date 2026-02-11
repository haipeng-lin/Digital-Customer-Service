package com.flash.human.service;

import com.flash.common.core.validate.EditGroup;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.human.domain.bo.DhBackgroundBo;
import com.flash.human.domain.vo.DhBackgroundVo;
import jakarta.validation.constraints.NotNull;

import java.util.Collection;
import java.util.List;

/**
 * 背景Service接口
 *
 * @author haipeng-lin
 * @date 2026-02-06
 */
public interface IDhBackgroundService {

    /**
     * 查询背景
     *
     * @param id 主键
     * @return 背景
     */
    DhBackgroundVo queryById(Long id);

    /**
     * 分页查询背景列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 背景分页列表
     */
    TableDataInfo<DhBackgroundVo> queryPageList(DhBackgroundBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的背景列表
     *
     * @param bo 查询条件
     * @return 背景列表
     */
    List<DhBackgroundVo> queryList(DhBackgroundBo bo);

    /**
     * 新增背景
     *
     * @param bo 背景
     * @return 是否新增成功
     */
    Boolean insertByBo(DhBackgroundBo bo);

    /**
     * 修改背景
     *
     * @param bo 背景
     * @return 是否修改成功
     */
    Boolean updateByBo(DhBackgroundBo bo);

    /**
     * 校验并批量删除背景信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 修改状态
     *
     * @param id id
     * @param status 状态
     * @return 结果
     */
    int updateStatus(Long id, String status);
}
