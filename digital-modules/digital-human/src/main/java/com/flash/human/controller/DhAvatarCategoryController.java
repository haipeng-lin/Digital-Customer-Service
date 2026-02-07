package com.flash.human.controller;

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
import com.flash.human.domain.bo.DhAvatarCategoryBo;
import com.flash.human.domain.vo.DhAvatarCategoryVo;
import com.flash.human.service.IDhAvatarCategoryService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 形象分类
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/human/avatarCategory")
public class DhAvatarCategoryController extends BaseController {

    private final IDhAvatarCategoryService dhAvatarCategoryService;

    /**
     * 修改状态
     */
    @SaCheckPermission("human:avatarCategory:edit")
    @Log(title = "知识库分类", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping("/changeStatus")
    public R<Void> changeStatus(@RequestBody DhAvatarCategoryBo avatarCategory) {
        return toAjax(dhAvatarCategoryService.updateStatus(avatarCategory.getId(), avatarCategory.getStatus()));
    }

    /**
     * 查询形象分类列表
     */
    @SaCheckPermission("human:avatarCategory:list")
    @GetMapping("/list")
    public TableDataInfo<DhAvatarCategoryVo> list(DhAvatarCategoryBo bo, PageQuery pageQuery) {
        return dhAvatarCategoryService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出形象分类列表
     */
    @SaCheckPermission("human:avatarCategory:export")
    @Log(title = "形象分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(DhAvatarCategoryBo bo, HttpServletResponse response) {
        List<DhAvatarCategoryVo> list = dhAvatarCategoryService.queryList(bo);
        ExcelUtil.exportExcel(list, "形象分类", DhAvatarCategoryVo.class, response);
    }

    /**
     * 获取形象分类详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("human:avatarCategory:query")
    @GetMapping("/{id}")
    public R<DhAvatarCategoryVo> getInfo(@NotNull(message = "主键不能为空")
                                         @PathVariable("id") Long id) {
        return R.ok(dhAvatarCategoryService.queryById(id));
    }

    /**
     * 新增形象分类
     */
    @SaCheckPermission("human:avatarCategory:add")
    @Log(title = "形象分类", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody DhAvatarCategoryBo bo) {
        return toAjax(dhAvatarCategoryService.insertByBo(bo));
    }

    /**
     * 修改形象分类
     */
    @SaCheckPermission("human:avatarCategory:edit")
    @Log(title = "形象分类", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody DhAvatarCategoryBo bo) {
        return toAjax(dhAvatarCategoryService.updateByBo(bo));
    }

    /**
     * 删除形象分类
     *
     * @param ids 主键串
     */
    @SaCheckPermission("human:avatarCategory:remove")
    @Log(title = "形象分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable("ids") Long[] ids) {
        return toAjax(dhAvatarCategoryService.deleteWithValidByIds(List.of(ids), true));
    }
}
