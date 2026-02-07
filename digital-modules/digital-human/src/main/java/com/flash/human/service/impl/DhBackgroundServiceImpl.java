package com.flash.human.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flash.common.core.utils.MapstructUtils;
import com.flash.common.core.utils.StringUtils;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.human.domain.DhBackground;
import com.flash.human.domain.bo.DhBackgroundBo;
import com.flash.human.domain.vo.DhBackgroundVo;
import com.flash.human.mapper.DhBackgroundMapper;
import com.flash.human.service.IDhBackgroundService;
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
 * @date 2026-02-06
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class DhBackgroundServiceImpl implements IDhBackgroundService {

    private final DhBackgroundMapper baseMapper;

    /**
     * 查询背景
     *
     * @param id 主键
     * @return 背景
     */
    @Override
    public DhBackgroundVo queryById(Long id) {
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
    public TableDataInfo<DhBackgroundVo> queryPageList(DhBackgroundBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<DhBackground> lqw = buildQueryWrapper(bo);
        Page<DhBackgroundVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的背景列表
     *
     * @param bo 查询条件
     * @return 背景列表
     */
    @Override
    public List<DhBackgroundVo> queryList(DhBackgroundBo bo) {
        LambdaQueryWrapper<DhBackground> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<DhBackground> buildQueryWrapper(DhBackgroundBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<DhBackground> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(DhBackground::getId);
        lqw.eq(bo.getDeptId() != null, DhBackground::getDeptId, bo.getDeptId());
        lqw.eq(bo.getUserId() != null, DhBackground::getUserId, bo.getUserId());
        lqw.eq(bo.getBackgroundCategory() != null, DhBackground::getBackgroundCategory, bo.getBackgroundCategory());
        lqw.like(StringUtils.isNotBlank(bo.getName()), DhBackground::getName, bo.getName());
        lqw.eq(bo.getTagType() != null, DhBackground::getTagType, bo.getTagType());
        lqw.eq(StringUtils.isNotBlank(bo.getUrl()), DhBackground::getUrl, bo.getUrl());
        lqw.eq(bo.getStatus() != null, DhBackground::getStatus, bo.getStatus());
        lqw.eq(bo.getOrderNum() != null, DhBackground::getOrderNum, bo.getOrderNum());
        return lqw;
    }

    /**
     * 新增背景
     *
     * @param bo 背景
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(DhBackgroundBo bo) {
        DhBackground add = MapstructUtils.convert(bo, DhBackground.class);
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
    public Boolean updateByBo(DhBackgroundBo bo) {
        DhBackground update = MapstructUtils.convert(bo, DhBackground.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(DhBackground entity) {
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

    @Override
    public int updateStatus(Long id, Integer status) {
        return baseMapper.update(null,
            new LambdaUpdateWrapper<DhBackground>()
                .set(DhBackground::getStatus, status)
                .eq(DhBackground::getId, id));
    }
}
