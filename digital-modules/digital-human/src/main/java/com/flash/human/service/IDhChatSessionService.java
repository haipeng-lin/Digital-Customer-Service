package com.flash.human.service;

import com.flash.human.domain.vo.DhChatSessionVo;
import com.flash.human.domain.bo.DhChatSessionBo;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 对话会话Service接口
 *
 * @author haipeng-lin
 * @date 2026-02-09
 */
public interface IDhChatSessionService {

    /**
     * 查询对话会话
     *
     * @param id 主键
     * @return 对话会话
     */
    DhChatSessionVo queryById(Long id);

    /**
     * 分页查询对话会话列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 对话会话分页列表
     */
    TableDataInfo<DhChatSessionVo> queryPageList(DhChatSessionBo bo, PageQuery pageQuery);

    /**
     * 查询符合条件的对话会话列表
     *
     * @param bo 查询条件
     * @return 对话会话列表
     */
    List<DhChatSessionVo> queryList(DhChatSessionBo bo);

    /**
     * 新增对话会话
     *
     * @param bo 对话会话
     * @return 是否新增成功
     */
    Boolean insertByBo(DhChatSessionBo bo);

    /**
     * 修改对话会话
     *
     * @param bo 对话会话
     * @return 是否修改成功
     */
    Boolean updateByBo(DhChatSessionBo bo);

    /**
     * 校验并批量删除对话会话信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
