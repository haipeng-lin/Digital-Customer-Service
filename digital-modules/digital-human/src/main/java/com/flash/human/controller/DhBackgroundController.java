package com.flash.human.controller;

import java.util.List;

import com.flash.human.domain.bo.DhBackgroundCategoryBo;
import lombok.RequiredArgsConstructor;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import com.flash.common.idempotent.annotation.RepeatSubmit;
import com.flash.common.log.annotation.Log;
import com.flash.common.web.core.BaseController;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.core.domain.R;
import com.flash.common.core.validate.AddGroup;
import com.flash.common.core.validate.EditGroup;
import com.flash.common.log.enums.BusinessType;
import com.flash.common.excel.utils.ExcelUtil;
import com.flash.human.domain.vo.DhBackgroundVo;
import com.flash.human.domain.bo.DhBackgroundBo;
import com.flash.human.service.IDhBackgroundService;
import com.flash.common.mybatis.core.page.TableDataInfo;

/**
 * 背景
 *
 * @author haipeng-lin
 * @date 2026-02-06
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/human/background")
public class DhBackgroundController extends BaseController {

    private final IDhBackgroundService dhBackgroundService;

    /**
     * 修改状态
     */
    @SaCheckPermission("human:background:edit")
    @Log(title = "背景", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping("/changeStatus")
    public R<Void> changeStatus(@RequestBody DhBackgroundBo background) {
        return toAjax(dhBackgroundService.updateStatus(background.getId(), background.getStatus()));
    }

    /**
     * 查询背景列表
     */
    @SaCheckPermission("human:background:list")
    @GetMapping("/list")
    public TableDataInfo<DhBackgroundVo> list(DhBackgroundBo bo, PageQuery pageQuery) {
        return dhBackgroundService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出背景列表
     */
    @SaCheckPermission("human:background:export")
    @Log(title = "背景", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(DhBackgroundBo bo, HttpServletResponse response) {
        List<DhBackgroundVo> list = dhBackgroundService.queryList(bo);
        ExcelUtil.exportExcel(list, "背景", DhBackgroundVo.class, response);
    }

    /**
     * 获取背景详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("human:background:query")
    @GetMapping("/{id}")
    public R<DhBackgroundVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(dhBackgroundService.queryById(id));
    }

    /**
     * 新增背景
     */
    @SaCheckPermission("human:background:add")
    @Log(title = "背景", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody DhBackgroundBo bo) {
        return toAjax(dhBackgroundService.insertByBo(bo));
    }

    /**
     * 修改背景
     */
    @SaCheckPermission("human:background:edit")
    @Log(title = "背景", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody DhBackgroundBo bo) {
        return toAjax(dhBackgroundService.updateByBo(bo));
    }

    /**
     * 删除背景
     *
     * @param ids 主键串
     */
    @SaCheckPermission("human:background:remove")
    @Log(title = "背景", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(dhBackgroundService.deleteWithValidByIds(List.of(ids), true));
    }
}
