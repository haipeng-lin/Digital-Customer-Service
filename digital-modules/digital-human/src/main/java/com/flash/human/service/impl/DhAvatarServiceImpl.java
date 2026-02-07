package com.flash.human.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flash.common.core.utils.MapstructUtils;
import com.flash.common.core.utils.StringUtils;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.human.domain.DhAvatar;
import com.flash.human.domain.bo.DhAvatarBo;
import com.flash.human.domain.vo.DhAvatarVo;
import com.flash.human.mapper.DhAvatarMapper;
import com.flash.human.service.IDhAvatarService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 形象Service业务层处理
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class DhAvatarServiceImpl implements IDhAvatarService {

    private final DhAvatarMapper baseMapper;

    /**
     * 查询形象
     *
     * @param id 主键
     * @return 形象
     */
    @Override
    public DhAvatarVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 分页查询形象列表
     *
     * @param bo        查询条件
     * @param pageQuery 分页参数
     * @return 形象分页列表
     */
    @Override
    public TableDataInfo<DhAvatarVo> queryPageList(DhAvatarBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<DhAvatar> lqw = buildQueryWrapper(bo);
        Page<DhAvatarVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询符合条件的形象列表
     *
     * @param bo 查询条件
     * @return 形象列表
     */
    @Override
    public List<DhAvatarVo> queryList(DhAvatarBo bo) {
        LambdaQueryWrapper<DhAvatar> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<DhAvatar> buildQueryWrapper(DhAvatarBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<DhAvatar> lqw = Wrappers.lambdaQuery();
        lqw.orderByAsc(DhAvatar::getId);
        lqw.eq(bo.getDeptId() != null, DhAvatar::getDeptId, bo.getDeptId());
        lqw.eq(bo.getUserId() != null, DhAvatar::getUserId, bo.getUserId());
        lqw.like(StringUtils.isNotBlank(bo.getName()), DhAvatar::getName, bo.getName());
        lqw.eq(bo.getAvatarType() != null, DhAvatar::getAvatarType, bo.getAvatarType());
        lqw.eq(bo.getTagType() != null, DhAvatar::getTagType, bo.getTagType());
        lqw.eq(StringUtils.isNotBlank(bo.getThumbnailUrl()), DhAvatar::getThumbnailUrl, bo.getThumbnailUrl());
        lqw.eq(StringUtils.isNotBlank(bo.getModelPath()), DhAvatar::getModelPath, bo.getModelPath());
        lqw.eq(bo.getStatus() != null, DhAvatar::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增形象
     *
     * @param bo 形象
     * @return 是否新增成功
     */
    @Override
    public Boolean insertByBo(DhAvatarBo bo) {
        DhAvatar add = MapstructUtils.convert(bo, DhAvatar.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改形象
     *
     * @param bo 形象
     * @return 是否修改成功
     */
    @Override
    public Boolean updateByBo(DhAvatarBo bo) {
        DhAvatar update = MapstructUtils.convert(bo, DhAvatar.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(DhAvatar entity) {
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 校验并批量删除形象信息
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
            new LambdaUpdateWrapper<DhAvatar>()
                .set(DhAvatar::getStatus, status)
                .eq(DhAvatar::getId, id));
    }
}
