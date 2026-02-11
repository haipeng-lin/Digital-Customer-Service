package com.flash.human.service.impl;

import com.flash.common.core.utils.MapstructUtils;
import com.flash.common.core.utils.StringUtils;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.flash.human.domain.bo.DhChatMessageBo;
import com.flash.human.domain.vo.DhChatMessageVo;
import com.flash.human.domain.DhChatMessage;
import com.flash.human.mapper.DhChatMessageMapper;
import com.flash.human.service.IDhChatMessageService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 对话消息Service业务层处理
 *
 * @author haipeng-lin
 * @date 2026-02-09
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class DhChatMessageServiceImpl implements IDhChatMessageService {

    private final DhChatMessageMapper baseMapper;

    /**
     * 查询对话消息
     *
     * @param id 主键
     * @return 对话消息
     */
    @Override
    public DhChatMessageVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询对话消息列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 对话消息分页列表
     */
    @Override
    public TableDataInfo<DhChatMessageVo> queryPageList(DhChatMessageBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<DhChatMessage> lqw = buildQueryWrapper(bo);
        Page<DhChatMessageVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的对话消息列表
     *
     * @param bo 查询条件
     * @return 对话消息列表
     */
    @Override
    public List<DhChatMessageVo> queryList(DhChatMessageBo bo) {
        LambdaQueryWrapper<DhChatMessage> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<DhChatMessage> buildQueryWrapper(DhChatMessageBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<DhChatMessage> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(DhChatMessage::getId);
        lqw.eq(bo.getSessionId() != null, DhChatMessage::getSessionId, bo.getSessionId());
        lqw.eq(StringUtils.isNotBlank(bo.getRole()), DhChatMessage::getRole, bo.getRole());
        lqw.eq(StringUtils.isNotBlank(bo.getContent()), DhChatMessage::getContent, bo.getContent());
        lqw.like(StringUtils.isNotBlank(bo.getModelName()), DhChatMessage::getModelName, bo.getModelName());
        lqw.eq(bo.getPromptToken() != null, DhChatMessage::getPromptToken, bo.getPromptToken());
        lqw.eq(bo.getCompletionToken() != null, DhChatMessage::getCompletionToken, bo.getCompletionToken());
        lqw.eq(bo.getLatencyMs() != null, DhChatMessage::getLatencyMs, bo.getLatencyMs());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), DhChatMessage::getStatus, bo.getStatus());
        lqw.eq(StringUtils.isNotBlank(bo.getFeedback()), DhChatMessage::getFeedback, bo.getFeedback());
        return lqw;
    }

    /**
     * 新增对话消息
     *
     * @param bo 对话消息
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(DhChatMessageBo bo) {
        DhChatMessage add = MapstructUtils.convert(bo, DhChatMessage.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改对话消息
     *
     * @param bo 对话消息
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(DhChatMessageBo bo) {
        DhChatMessage update = MapstructUtils.convert(bo, DhChatMessage.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(DhChatMessage entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除对话消息信息
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
