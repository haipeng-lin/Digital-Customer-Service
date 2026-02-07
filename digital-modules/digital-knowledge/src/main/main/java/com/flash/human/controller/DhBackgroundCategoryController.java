package com.flash.human.controller;

import java.util.List;

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
import com.flash.human.domain.vo.DhBackgroundCategoryVo;
import com.flash.human.domain.bo.DhBackgroundCategoryBo;
import com.flash.human.service.IDhBackgroundCategoryService;
import com.flash.common.mybatis.core.page.TableDataInfo;

/**
 * 背景分类
 *
 * @author haipeng-lin
 * @date 2026-02-06
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/human/backgroundCategory")
public class DhBackgroundCategoryController extends BaseController {

    private final IDhBackgroundCategoryService dhBackgroundCategoryService;

    /**
     * 查询背景分类列表
     */
    @SaCheckPermission("human:backgroundCategory:list")
    @GetMapping("/list")
    public TableDataInfo<DhBackgroundCategoryVo> list(DhBackgroundCategoryBo bo, PageQuery pageQuery) {
        return dhBackgroundCategoryService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出背景分类列表
     */
    @SaCheckPermission("human:backgroundCategory:export")
    @Log(title = "背景分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(DhBackgroundCategoryBo bo, HttpServletResponse response) {
        List<DhBackgroundCategoryVo> list = dhBackgroundCategoryService.queryList(bo);
        ExcelUtil.exportExcel(list, "背景分类", DhBackgroundCategoryVo.class, response);
    }

    /**
     * 获取背景分类详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("human:backgroundCategory:query")
    @GetMapping("/{id}")
    public R<DhBackgroundCategoryVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(dhBackgroundCategoryService.queryById(id));
    }

    /**
     * 新增背景分类
     */
    @SaCheckPermission("human:backgroundCategory:add")
    @Log(title = "背景分类", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody DhBackgroundCategoryBo bo) {
        return toAjax(dhBackgroundCategoryService.insertByBo(bo));
    }

    /**
     * 修改背景分类
     */
    @SaCheckPermission("human:backgroundCategory:edit")
    @Log(title = "背景分类", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody DhBackgroundCategoryBo bo) {
        return toAjax(dhBackgroundCategoryService.updateByBo(bo));
    }

    /**
     * 删除背景分类
     *
     * @param ids 主键串
     */
    @SaCheckPermission("human:backgroundCategory:remove")
    @Log(title = "背景分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(dhBackgroundCategoryService.deleteWithValidByIds(List.of(ids), true));
    }
}
