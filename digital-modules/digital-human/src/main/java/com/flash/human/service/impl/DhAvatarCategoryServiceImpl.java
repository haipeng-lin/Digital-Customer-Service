package com.flash.human.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flash.common.core.utils.MapstructUtils;
import com.flash.common.core.utils.StringUtils;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.human.domain.DhAvatarCategory;
import com.flash.human.domain.bo.DhAvatarCategoryBo;
import com.flash.human.domain.vo.DhAvatarCategoryVo;
import com.flash.human.mapper.DhAvatarCategoryMapper;
import com.flash.human.service.IDhAvatarCategoryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 形象分类Service业务层处理
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class DhAvatarCategoryServiceImpl implements IDhAvatarCategoryService {

    private final DhAvatarCategoryMapper baseMapper;

    /**
     * 查询形象分类
     *
     * @param id 主键
     * @return 形象分类
     */
    @Override
    public DhAvatarCategoryVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询形象分类列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 形象分类分页列表
     */
    @Override
    public TableDataInfo<DhAvatarCategoryVo> queryPageList(DhAvatarCategoryBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<DhAvatarCategory> lqw = buildQueryWrapper(bo);
        Page<DhAvatarCategoryVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的形象分类列表
     *
     * @param bo 查询条件
     * @return 形象分类列表
     */
    @Override
    public List<DhAvatarCategoryVo> queryList(DhAvatarCategoryBo bo) {
        LambdaQueryWrapper<DhAvatarCategory> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<DhAvatarCategory> buildQueryWrapper(DhAvatarCategoryBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<DhAvatarCategory> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(DhAvatarCategory::getId);
        lqw.eq(bo.getDeptId() != null, DhAvatarCategory::getDeptId, bo.getDeptId());
        lqw.like(StringUtils.isNotBlank(bo.getName()), DhAvatarCategory::getName, bo.getName());
        lqw.eq(bo.getStatus() != null, DhAvatarCategory::getStatus, bo.getStatus());
        lqw.eq(bo.getOrderNum() != null, DhAvatarCategory::getOrderNum, bo.getOrderNum());
        return lqw;
    }

    /**
     * 新增形象分类
     *
     * @param bo 形象分类
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(DhAvatarCategoryBo bo) {
        DhAvatarCategory add = MapstructUtils.convert(bo, DhAvatarCategory.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改形象分类
     *
     * @param bo 形象分类
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(DhAvatarCategoryBo bo) {
        DhAvatarCategory update = MapstructUtils.convert(bo, DhAvatarCategory.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(DhAvatarCategory entity) {
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除形象分类信息
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
