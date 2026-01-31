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
import com.flash.human.domain.bo.DhBackgroudBo;
import com.flash.human.domain.vo.DhBackgroudVo;
import com.flash.human.service.IDhBackgroudService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 背景
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/human/backgroud")
public class DhBackgroudController extends BaseController {

    private final IDhBackgroudService dhBackgroudService;

    /**
     * 查询背景列表
     */
    @SaCheckPermission("human:backgroud:list")
    @GetMapping("/list")
    public TableDataInfo<DhBackgroudVo> list(DhBackgroudBo bo, PageQuery pageQuery) {
        return dhBackgroudService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出背景列表
     */
    @SaCheckPermission("human:backgroud:export")
    @Log(title = "背景", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(DhBackgroudBo bo, HttpServletResponse response) {
        List<DhBackgroudVo> list = dhBackgroudService.queryList(bo);
        ExcelUtil.exportExcel(list, "背景", DhBackgroudVo.class, response);
    }

    /**
     * 获取背景详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("human:backgroud:query")
    @GetMapping("/{id}")
    public R<DhBackgroudVo> getInfo(@NotNull(message = "主键不能为空")
                                    @PathVariable Long id) {
        return R.ok(dhBackgroudService.queryById(id));
    }

    /**
     * 新增背景
     */
    @SaCheckPermission("human:backgroud:add")
    @Log(title = "背景", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody DhBackgroudBo bo) {
        return toAjax(dhBackgroudService.insertByBo(bo));
    }

    /**
     * 修改背景
     */
    @SaCheckPermission("human:backgroud:edit")
    @Log(title = "背景", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody DhBackgroudBo bo) {
        return toAjax(dhBackgroudService.updateByBo(bo));
    }

    /**
     * 删除背景
     *
     * @param ids 主键串
     */
    @SaCheckPermission("human:backgroud:remove")
    @Log(title = "背景", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(dhBackgroudService.deleteWithValidByIds(List.of(ids), true));
    }
}
