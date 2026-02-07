package com.flash.knowledge.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flash.common.core.exception.ServiceException;
import com.flash.common.core.utils.MapstructUtils;
import com.flash.common.core.utils.StringUtils;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.knowledge.domain.KbCategory;
import com.flash.knowledge.domain.bo.KbCategoryBo;
import com.flash.knowledge.domain.vo.KbCategoryVo;
import com.flash.knowledge.mapper.KbCategoryMapper;
import com.flash.knowledge.service.IKbCategoryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 知识库分类Service业务层处理
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class KbCategoryServiceImpl implements IKbCategoryService {

    private final KbCategoryMapper baseMapper;

    /**
     * 查询知识库分类
     *
     * @param id 主键
     * @return 知识库分类
     */
    @Override
    public KbCategoryVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询知识库分类列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 知识库分类分页列表
     */
    @Override
    public TableDataInfo<KbCategoryVo> queryPageList(KbCategoryBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<KbCategory> lqw = buildQueryWrapper(bo);
        Page<KbCategoryVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的知识库分类列表
     *
     * @param bo 查询条件
     * @return 知识库分类列表
     */
    @Override
    public List<KbCategoryVo> queryList(KbCategoryBo bo) {
        LambdaQueryWrapper<KbCategory> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<KbCategory> buildQueryWrapper(KbCategoryBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<KbCategory> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getName()), KbCategory::getName, bo.getName());
        lqw.eq(bo.getOrderNum() != null, KbCategory::getOrderNum, bo.getOrderNum());
        lqw.eq(bo.getStatus() != null, KbCategory::getStatus, bo.getStatus());
        lqw.orderByAsc(KbCategory::getOrderNum);
        return lqw;
    }

    /**
     * 新增知识库分类
     *
     * @param bo 知识库分类
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(KbCategoryBo bo) {
        KbCategory add = MapstructUtils.convert(bo, KbCategory.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改知识库分类
     *
     * @param bo 知识库分类
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(KbCategoryBo bo) {
        KbCategory update = MapstructUtils.convert(bo, KbCategory.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(KbCategory entity) {
        //TODO 做一些数据校验,如唯一约束
        LambdaQueryWrapper<KbCategory> lqw = Wrappers.lambdaQuery();
        lqw.eq(KbCategory::getName, entity.getName());
        KbCategory kbCategory = baseMapper.selectOne(lqw);
        if (kbCategory != null && !Objects.equals(entity.getId(), kbCategory.getId())) {
            throw new ServiceException("分类名称已存在");
        }
    }

    /**
     * 校验并批量删除知识库分类信息
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
            new LambdaUpdateWrapper<KbCategory>()
                .set(KbCategory::getStatus, status)
                .eq(KbCategory::getId, id));
    }
}
