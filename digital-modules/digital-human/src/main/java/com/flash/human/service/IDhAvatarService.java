package com.flash.human.service;

import com.flash.human.domain.vo.DhAvatarVo;
import com.flash.human.domain.bo.DhAvatarBo;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 形象Service接口
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
public interface IDhAvatarService {

    /**
     * 查询形象
     *
     * @param id 主键
     * @return 形象
     */
    DhAvatarVo queryById(Long id);

    /**
     * 分页查询形象列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 形象分页列表
     */
    TableDataInfo<DhAvatarVo> queryPageList(DhAvatarBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的形象列表
     *
     * @param bo 查询条件
     * @return 形象列表
     */
    List<DhAvatarVo> queryList(DhAvatarBo bo);

    /**
     * 新增形象
     *
     * @param bo 形象
     * @return 是否新增成功
     */
    Boolean insertByBo(DhAvatarBo bo);

    /**
     * 修改形象
     *
     * @param bo 形象
     * @return 是否修改成功
     */
    Boolean updateByBo(DhAvatarBo bo);

    /**
     * 校验并批量删除形象信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
