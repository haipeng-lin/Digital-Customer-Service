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
import com.flash.human.domain.vo.DhBackgroudCategoryVo;
import com.flash.human.domain.bo.DhBackgroudCategoryBo;
import com.flash.human.service.IDhBackgroudCategoryService;
import com.flash.common.mybatis.core.page.TableDataInfo;

/**
 * 背景分类
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/human/backgroudCategory")
public class DhBackgroudCategoryController extends BaseController {

    private final IDhBackgroudCategoryService dhBackgroudCategoryService;

    /**
     * 查询背景分类列表
     */
    @SaCheckPermission("human:backgroudCategory:list")
    @GetMapping("/list")
    public TableDataInfo<DhBackgroudCategoryVo> list(DhBackgroudCategoryBo bo, PageQuery pageQuery) {
        return dhBackgroudCategoryService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出背景分类列表
     */
    @SaCheckPermission("human:backgroudCategory:export")
    @Log(title = "背景分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(DhBackgroudCategoryBo bo, HttpServletResponse response) {
        List<DhBackgroudCategoryVo> list = dhBackgroudCategoryService.queryList(bo);
        ExcelUtil.exportExcel(list, "背景分类", DhBackgroudCategoryVo.class, response);
    }

    /**
     * 获取背景分类详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("human:backgroudCategory:query")
    @GetMapping("/{id}")
    public R<DhBackgroudCategoryVo> getInfo(@NotNull(message = "主键不能为空")
                                            @PathVariable Long id) {
        return R.ok(dhBackgroudCategoryService.queryById(id));
    }

    /**
     * 新增背景分类
     */
    @SaCheckPermission("human:backgroudCategory:add")
    @Log(title = "背景分类", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody DhBackgroudCategoryBo bo) {
        return toAjax(dhBackgroudCategoryService.insertByBo(bo));
    }

    /**
     * 修改背景分类
     */
    @SaCheckPermission("human:backgroudCategory:edit")
    @Log(title = "背景分类", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody DhBackgroudCategoryBo bo) {
        return toAjax(dhBackgroudCategoryService.updateByBo(bo));
    }

    /**
     * 删除背景分类
     *
     * @param ids 主键串
     */
    @SaCheckPermission("human:backgroudCategory:remove")
    @Log(title = "背景分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(dhBackgroudCategoryService.deleteWithValidByIds(List.of(ids), true));
    }
}
