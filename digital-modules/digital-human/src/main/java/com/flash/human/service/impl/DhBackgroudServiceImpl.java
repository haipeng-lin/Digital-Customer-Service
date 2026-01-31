package com.flash.human.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flash.common.core.utils.MapstructUtils;
import com.flash.common.core.utils.StringUtils;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.human.domain.DhBackgroud;
import com.flash.human.domain.bo.DhBackgroudBo;
import com.flash.human.domain.vo.DhBackgroudVo;
import com.flash.human.mapper.DhBackgroudMapper;
import com.flash.human.service.IDhBackgroudService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 背景Service业务层处理
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class DhBackgroudServiceImpl implements IDhBackgroudService {

    private final DhBackgroudMapper baseMapper;

    /**
     * 查询背景
     *
     * @param id 主键
     * @return 背景
     */
    @Override
    public DhBackgroudVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询背景列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 背景分页列表
     */
    @Override
    public TableDataInfo<DhBackgroudVo> queryPageList(DhBackgroudBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<DhBackgroud> lqw = buildQueryWrapper(bo);
        Page<DhBackgroudVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的背景列表
     *
     * @param bo 查询条件
     * @return 背景列表
     */
    @Override
    public List<DhBackgroudVo> queryList(DhBackgroudBo bo) {
        LambdaQueryWrapper<DhBackgroud> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<DhBackgroud> buildQueryWrapper(DhBackgroudBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<DhBackgroud> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(DhBackgroud::getId);
        lqw.eq(bo.getDeptId() != null, DhBackgroud::getDeptId, bo.getDeptId());
        lqw.eq(bo.getUserId() != null, DhBackgroud::getUserId, bo.getUserId());
        lqw.eq(bo.getBackgroudCategory() != null, DhBackgroud::getBackgroudCategory, bo.getBackgroudCategory());
        lqw.like(StringUtils.isNotBlank(bo.getName()), DhBackgroud::getName, bo.getName());
        lqw.eq(bo.getTagType() != null, DhBackgroud::getTagType, bo.getTagType());
        lqw.eq(StringUtils.isNotBlank(bo.getUrl()), DhBackgroud::getUrl, bo.getUrl());
        lqw.eq(bo.getStatus() != null, DhBackgroud::getStatus, bo.getStatus());
        lqw.eq(bo.getOrderNum() != null, DhBackgroud::getOrderNum, bo.getOrderNum());
        return lqw;
    }

    /**
     * 新增背景
     *
     * @param bo 背景
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(DhBackgroudBo bo) {
        DhBackgroud add = MapstructUtils.convert(bo, DhBackgroud.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改背景
     *
     * @param bo 背景
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(DhBackgroudBo bo) {
        DhBackgroud update = MapstructUtils.convert(bo, DhBackgroud.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(DhBackgroud entity) {
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除背景信息
     *
     * @param ids     待删除的主键集合
     * @param isValid 是否进行有效性校验
     * @return 是否删除成功
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteByIds(ids) > 0;
    }
}
