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
import com.flash.human.domain.vo.DhChatSessionVo;
import com.flash.human.domain.bo.DhChatSessionBo;
import com.flash.human.service.IDhChatSessionService;
import com.flash.common.mybatis.core.page.TableDataInfo;

/**
 * 对话会话
 *
 * @author haipeng-lin
 * @date 2026-02-09
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/human/chatSession")
public class DhChatSessionController extends BaseController {

    private final IDhChatSessionService dhChatSessionService;

    /**
     * 查询对话会话列表
     */
    @SaCheckPermission("human:chatSession:list")
    @GetMapping("/list")
    public TableDataInfo<DhChatSessionVo> list(DhChatSessionBo bo, PageQuery pageQuery) {
        return dhChatSessionService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出对话会话列表
     */
    @SaCheckPermission("human:chatSession:export")
    @Log(title = "对话会话", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(DhChatSessionBo bo, HttpServletResponse response) {
        List<DhChatSessionVo> list = dhChatSessionService.queryList(bo);
        ExcelUtil.exportExcel(list, "对话会话", DhChatSessionVo.class, response);
    }

    /**
     * 获取对话会话详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("human:chatSession:query")
    @GetMapping("/{id}")
    public R<DhChatSessionVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(dhChatSessionService.queryById(id));
    }

    /**
     * 新增对话会话
     */
    @SaCheckPermission("human:chatSession:add")
    @Log(title = "对话会话", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody DhChatSessionBo bo) {
        return toAjax(dhChatSessionService.insertByBo(bo));
    }

    /**
     * 修改对话会话
     */
    @SaCheckPermission("human:chatSession:edit")
    @Log(title = "对话会话", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody DhChatSessionBo bo) {
        return toAjax(dhChatSessionService.updateByBo(bo));
    }

    /**
     * 删除对话会话
     *
     * @param ids 主键串
     */
    @SaCheckPermission("human:chatSession:remove")
    @Log(title = "对话会话", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(dhChatSessionService.deleteWithValidByIds(List.of(ids), true));
    }
}
