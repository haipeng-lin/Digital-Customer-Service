package com.flash.human.service;

import com.flash.human.domain.vo.DhOverlayVo;
import com.flash.human.domain.bo.DhOverlayBo;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 贴图Service接口
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
public interface IDhOverlayService {

    /**
     * 查询贴图
     *
     * @param id 主键
     * @return 贴图
     */
    DhOverlayVo queryById(Long id);

    /**
     * 分页查询贴图列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 贴图分页列表
     */
    TableDataInfo<DhOverlayVo> queryPageList(DhOverlayBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的贴图列表
     *
     * @param bo 查询条件
     * @return 贴图列表
     */
    List<DhOverlayVo> queryList(DhOverlayBo bo);

    /**
     * 新增贴图
     *
     * @param bo 贴图
     * @return 是否新增成功
     */
    Boolean insertByBo(DhOverlayBo bo);

    /**
     * 修改贴图
     *
     * @param bo 贴图
     * @return 是否修改成功
     */
    Boolean updateByBo(DhOverlayBo bo);

    /**
     * 校验并批量删除贴图信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
