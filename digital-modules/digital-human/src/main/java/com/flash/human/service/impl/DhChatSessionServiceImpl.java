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
import com.flash.human.domain.bo.DhChatSessionBo;
import com.flash.human.domain.vo.DhChatSessionVo;
import com.flash.human.domain.DhChatSession;
import com.flash.human.mapper.DhChatSessionMapper;
import com.flash.human.service.IDhChatSessionService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 对话会话Service业务层处理
 *
 * @author haipeng-lin
 * @date 2026-02-09
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class DhChatSessionServiceImpl implements IDhChatSessionService {

    private final DhChatSessionMapper baseMapper;

    /**
     * 查询对话会话
     *
     * @param id 主键
     * @return 对话会话
     */
    @Override
    public DhChatSessionVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询对话会话列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 对话会话分页列表
     */
    @Override
    public TableDataInfo<DhChatSessionVo> queryPageList(DhChatSessionBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<DhChatSession> lqw = buildQueryWrapper(bo);
        Page<DhChatSessionVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的对话会话列表
     *
     * @param bo 查询条件
     * @return 对话会话列表
     */
    @Override
    public List<DhChatSessionVo> queryList(DhChatSessionBo bo) {
        LambdaQueryWrapper<DhChatSession> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<DhChatSession> buildQueryWrapper(DhChatSessionBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<DhChatSession> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(DhChatSession::getId);
        lqw.eq(bo.getUserId() != null, DhChatSession::getUserId, bo.getUserId());
        lqw.eq(StringUtils.isNotBlank(bo.getTitle()), DhChatSession::getTitle, bo.getTitle());
        lqw.eq(StringUtils.isNotBlank(bo.getChannel()), DhChatSession::getChannel, bo.getChannel());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), DhChatSession::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增对话会话
     *
     * @param bo 对话会话
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(DhChatSessionBo bo) {
        DhChatSession add = MapstructUtils.convert(bo, DhChatSession.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改对话会话
     *
     * @param bo 对话会话
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(DhChatSessionBo bo) {
        DhChatSession update = MapstructUtils.convert(bo, DhChatSession.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(DhChatSession entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除对话会话信息
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
