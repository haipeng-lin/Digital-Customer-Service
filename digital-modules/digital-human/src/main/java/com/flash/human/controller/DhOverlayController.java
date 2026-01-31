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
import com.flash.human.domain.vo.DhOverlayVo;
import com.flash.human.domain.bo.DhOverlayBo;
import com.flash.human.service.IDhOverlayService;
import com.flash.common.mybatis.core.page.TableDataInfo;

/**
 * 贴图
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/human/overlay")
public class DhOverlayController extends BaseController {

    private final IDhOverlayService dhOverlayService;

    /**
     * 查询贴图列表
     */
    @SaCheckPermission("human:overlay:list")
    @GetMapping("/list")
    public TableDataInfo<DhOverlayVo> list(DhOverlayBo bo, PageQuery pageQuery) {
        return dhOverlayService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出贴图列表
     */
    @SaCheckPermission("human:overlay:export")
    @Log(title = "贴图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(DhOverlayBo bo, HttpServletResponse response) {
        List<DhOverlayVo> list = dhOverlayService.queryList(bo);
        ExcelUtil.exportExcel(list, "贴图", DhOverlayVo.class, response);
    }

    /**
     * 获取贴图详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("human:overlay:query")
    @GetMapping("/{id}")
    public R<DhOverlayVo> getInfo(@NotNull(message = "主键不能为空")
                                  @PathVariable Long id) {
        return R.ok(dhOverlayService.queryById(id));
    }

    /**
     * 新增贴图
     */
    @SaCheckPermission("human:overlay:add")
    @Log(title = "贴图", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody DhOverlayBo bo) {
        return toAjax(dhOverlayService.insertByBo(bo));
    }

    /**
     * 修改贴图
     */
    @SaCheckPermission("human:overlay:edit")
    @Log(title = "贴图", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody DhOverlayBo bo) {
        return toAjax(dhOverlayService.updateByBo(bo));
    }

    /**
     * 删除贴图
     *
     * @param ids 主键串
     */
    @SaCheckPermission("human:overlay:remove")
    @Log(title = "贴图", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(dhOverlayService.deleteWithValidByIds(List.of(ids), true));
    }
}
