package com.flash.knowledge.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.flash.common.core.domain.R;
import com.flash.common.core.validate.AddGroup;
import com.flash.common.core.validate.EditGroup;
import com.flash.common.excel.utils.ExcelUtil;
import com.flash.common.idempotent.annotation.RepeatSubmit;
import com.flash.common.log.annotation.Log;
import com.flash.common.log.enums.BusinessType;
import com.flash.common.mybatis.core.page.PageQuery;
import com.flash.common.mybatis.core.page.TableDataInfo;
import com.flash.common.web.core.BaseController;
import com.flash.knowledge.domain.bo.KbCategoryBo;
import com.flash.knowledge.domain.vo.KbCategoryVo;
import com.flash.knowledge.service.IKbCategoryService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 知识库分类
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/knowledge/kbCategory")
public class KbCategoryController extends BaseController {

    private final IKbCategoryService kbCategoryService;

    /**
     * 查询知识库分类列表
     */
    @SaCheckPermission("knowledge:kbCategory:list")
    @GetMapping("/list")
    public TableDataInfo<KbCategoryVo> list(KbCategoryBo bo, PageQuery pageQuery) {
        return kbCategoryService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出知识库分类列表
     */
    @SaCheckPermission("knowledge:kbCategory:export")
    @Log(title = "知识库分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(KbCategoryBo bo, HttpServletResponse response) {
        List<KbCategoryVo> list = kbCategoryService.queryList(bo);
        ExcelUtil.exportExcel(list, "知识库分类", KbCategoryVo.class, response);
    }

    /**
     * 获取知识库分类详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("knowledge:kbCategory:query")
    @GetMapping("/{id}")
    public R<KbCategoryVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(kbCategoryService.queryById(id));
    }

    /**
     * 新增知识库分类
     */
    @SaCheckPermission("knowledge:kbCategory:add")
    @Log(title = "知识库分类", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody KbCategoryBo bo) {
        return toAjax(kbCategoryService.insertByBo(bo));
    }

    /**
     * 修改知识库分类
     */
    @SaCheckPermission("knowledge:kbCategory:edit")
    @Log(title = "知识库分类", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody KbCategoryBo bo) {
        return toAjax(kbCategoryService.updateByBo(bo));
    }

    /**
     * 删除知识库分类
     *
     * @param ids 主键串
     */
    @SaCheckPermission("knowledge:kbCategory:remove")
    @Log(title = "知识库分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(kbCategoryService.deleteWithValidByIds(List.of(ids), true));
    }
}
