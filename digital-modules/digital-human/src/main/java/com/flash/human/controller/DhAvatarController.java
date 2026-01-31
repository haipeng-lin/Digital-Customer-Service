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
import com.flash.human.domain.bo.DhAvatarBo;
import com.flash.human.domain.vo.DhAvatarVo;
import com.flash.human.service.IDhAvatarService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 形象
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/human/avatar")
public class DhAvatarController extends BaseController {

    private final IDhAvatarService dhAvatarService;

    /**
     * 查询形象列表
     */
    @SaCheckPermission("human:avatar:list")
    @GetMapping("/list")
    public TableDataInfo<DhAvatarVo> list(DhAvatarBo bo, PageQuery pageQuery) {
        return dhAvatarService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出形象列表
     */
    @SaCheckPermission("human:avatar:export")
    @Log(title = "形象", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(DhAvatarBo bo, HttpServletResponse response) {
        List<DhAvatarVo> list = dhAvatarService.queryList(bo);
        ExcelUtil.exportExcel(list, "形象", DhAvatarVo.class, response);
    }

    /**
     * 获取形象详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("human:avatar:query")
    @GetMapping("/{id}")
    public R<DhAvatarVo> getInfo(@NotNull(message = "主键不能为空")
                                 @PathVariable Long id) {
        return R.ok(dhAvatarService.queryById(id));
    }

    /**
     * 新增形象
     */
    @SaCheckPermission("human:avatar:add")
    @Log(title = "形象", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody DhAvatarBo bo) {
        return toAjax(dhAvatarService.insertByBo(bo));
    }

    /**
     * 修改形象
     */
    @SaCheckPermission("human:avatar:edit")
    @Log(title = "形象", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody DhAvatarBo bo) {
        return toAjax(dhAvatarService.updateByBo(bo));
    }

    /**
     * 删除形象
     *
     * @param ids 主键串
     */
    @SaCheckPermission("human:avatar:remove")
    @Log(title = "形象", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(dhAvatarService.deleteWithValidByIds(List.of(ids), true));
    }
}
