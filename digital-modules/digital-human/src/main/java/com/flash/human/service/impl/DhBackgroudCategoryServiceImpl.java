package com.flash.human.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flash.common.core.utils.MapstructUtils;
import com.flash.common.core.utils.StringUtils;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.human.domain.DhBackgroudCategory;
import com.flash.human.domain.bo.DhBackgroudCategoryBo;
import com.flash.human.domain.vo.DhBackgroudCategoryVo;
import com.flash.human.mapper.DhBackgroudCategoryMapper;
import com.flash.human.service.IDhBackgroudCategoryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 背景分类Service业务层处理
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class DhBackgroudCategoryServiceImpl implements IDhBackgroudCategoryService {

    private final DhBackgroudCategoryMapper baseMapper;

    /**
     * 查询背景分类
     *
     * @param id 主键
     * @return 背景分类
     */
    @Override
    public DhBackgroudCategoryVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询背景分类列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 背景分类分页列表
     */
    @Override
    public TableDataInfo<DhBackgroudCategoryVo> queryPageList(DhBackgroudCategoryBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<DhBackgroudCategory> lqw = buildQueryWrapper(bo);
        Page<DhBackgroudCategoryVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的背景分类列表
     *
     * @param bo 查询条件
     * @return 背景分类列表
     */
    @Override
    public List<DhBackgroudCategoryVo> queryList(DhBackgroudCategoryBo bo) {
        LambdaQueryWrapper<DhBackgroudCategory> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<DhBackgroudCategory> buildQueryWrapper(DhBackgroudCategoryBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<DhBackgroudCategory> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(DhBackgroudCategory::getId);
        lqw.eq(bo.getDeptId() != null, DhBackgroudCategory::getDeptId, bo.getDeptId());
        lqw.like(StringUtils.isNotBlank(bo.getName()), DhBackgroudCategory::getName, bo.getName());
        lqw.eq(bo.getStatus() != null, DhBackgroudCategory::getStatus, bo.getStatus());
        lqw.eq(bo.getOrderNum() != null, DhBackgroudCategory::getOrderNum, bo.getOrderNum());
        return lqw;
    }

    /**
     * 新增背景分类
     *
     * @param bo 背景分类
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(DhBackgroudCategoryBo bo) {
        DhBackgroudCategory add = MapstructUtils.convert(bo, DhBackgroudCategory.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改背景分类
     *
     * @param bo 背景分类
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(DhBackgroudCategoryBo bo) {
        DhBackgroudCategory update = MapstructUtils.convert(bo, DhBackgroudCategory.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(DhBackgroudCategory entity) {
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除背景分类信息
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
