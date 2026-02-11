package com.flash.human.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flash.common.core.utils.MapstructUtils;
import com.flash.common.core.utils.StringUtils;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.human.domain.DhBackgroundCategory;
import com.flash.human.domain.bo.DhBackgroundCategoryBo;
import com.flash.human.domain.vo.DhBackgroundCategoryVo;
import com.flash.human.mapper.DhBackgroundCategoryMapper;
import com.flash.human.service.IDhBackgroundCategoryService;
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
 * @date 2026-02-06
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class DhBackgroundCategoryServiceImpl implements IDhBackgroundCategoryService {

    private final DhBackgroundCategoryMapper baseMapper;

    /**
     * 查询背景分类
     *
     * @param id 主键
     * @return 背景分类
     */
    @Override
    public DhBackgroundCategoryVo queryById(Long id) {
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
    public TableDataInfo<DhBackgroundCategoryVo> queryPageList(DhBackgroundCategoryBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<DhBackgroundCategory> lqw = buildQueryWrapper(bo);
        Page<DhBackgroundCategoryVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的背景分类列表
     *
     * @param bo 查询条件
     * @return 背景分类列表
     */
    @Override
    public List<DhBackgroundCategoryVo> queryList(DhBackgroundCategoryBo bo) {
        LambdaQueryWrapper<DhBackgroundCategory> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<DhBackgroundCategory> buildQueryWrapper(DhBackgroundCategoryBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<DhBackgroundCategory> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(DhBackgroundCategory::getId);
        lqw.like(StringUtils.isNotBlank(bo.getName()), DhBackgroundCategory::getName, bo.getName());
        lqw.eq(bo.getStatus() != null, DhBackgroundCategory::getStatus, bo.getStatus());
        lqw.eq(bo.getOrderNum() != null, DhBackgroundCategory::getOrderNum, bo.getOrderNum());
        return lqw;
    }

    /**
     * 新增背景分类
     *
     * @param bo 背景分类
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(DhBackgroundCategoryBo bo) {
        DhBackgroundCategory add = MapstructUtils.convert(bo, DhBackgroundCategory.class);
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
    public Boolean updateByBo(DhBackgroundCategoryBo bo) {
        DhBackgroundCategory update = MapstructUtils.convert(bo, DhBackgroundCategory.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(DhBackgroundCategory entity) {
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

    @Override
    public int updateStatus(Long id, String status) {
        return baseMapper.update(null,
            new LambdaUpdateWrapper<DhBackgroundCategory>()
                .set(DhBackgroundCategory::getStatus, status)
                .eq(DhBackgroundCategory::getId, id));
    }
}
