package com.flash.human.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flash.common.core.utils.MapstructUtils;
import com.flash.common.core.utils.StringUtils;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.human.domain.DhOverlay;
import com.flash.human.domain.bo.DhOverlayBo;
import com.flash.human.domain.vo.DhOverlayVo;
import com.flash.human.mapper.DhOverlayMapper;
import com.flash.human.service.IDhOverlayService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 贴图Service业务层处理
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class DhOverlayServiceImpl implements IDhOverlayService {

    private final DhOverlayMapper baseMapper;

    /**
     * 查询贴图
     *
     * @param id 主键
     * @return 贴图
     */
    @Override
    public DhOverlayVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询贴图列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 贴图分页列表
     */
    @Override
    public TableDataInfo<DhOverlayVo> queryPageList(DhOverlayBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<DhOverlay> lqw = buildQueryWrapper(bo);
        Page<DhOverlayVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的贴图列表
     *
     * @param bo 查询条件
     * @return 贴图列表
     */
    @Override
    public List<DhOverlayVo> queryList(DhOverlayBo bo) {
        LambdaQueryWrapper<DhOverlay> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<DhOverlay> buildQueryWrapper(DhOverlayBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<DhOverlay> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(DhOverlay::getId);
        lqw.eq(bo.getDeptId() != null, DhOverlay::getDeptId, bo.getDeptId());
        lqw.eq(bo.getUserId() != null, DhOverlay::getUserId, bo.getUserId());
        lqw.like(StringUtils.isNotBlank(bo.getName()), DhOverlay::getName, bo.getName());
        lqw.eq(bo.getTagType() != null, DhOverlay::getTagType, bo.getTagType());
        lqw.eq(StringUtils.isNotBlank(bo.getUrl()), DhOverlay::getUrl, bo.getUrl());
        lqw.eq(bo.getOrderNum() != null, DhOverlay::getOrderNum, bo.getOrderNum());
        return lqw;
    }

    /**
     * 新增贴图
     *
     * @param bo 贴图
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(DhOverlayBo bo) {
        DhOverlay add = MapstructUtils.convert(bo, DhOverlay.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改贴图
     *
     * @param bo 贴图
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(DhOverlayBo bo) {
        DhOverlay update = MapstructUtils.convert(bo, DhOverlay.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(DhOverlay entity) {
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除贴图信息
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
