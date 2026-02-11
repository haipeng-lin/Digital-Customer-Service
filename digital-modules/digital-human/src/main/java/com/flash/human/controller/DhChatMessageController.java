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
import com.flash.human.domain.vo.DhChatMessageVo;
import com.flash.human.domain.bo.DhChatMessageBo;
import com.flash.human.service.IDhChatMessageService;
import com.flash.common.mybatis.core.page.TableDataInfo;

/**
 * 对话消息
 *
 * @author haipeng-lin
 * @date 2026-02-09
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/human/chatMessage")
public class DhChatMessageController extends BaseController {

    private final IDhChatMessageService dhChatMessageService;

    /**
     * 查询对话消息列表
     */
    @SaCheckPermission("human:chatMessage:list")
    @GetMapping("/list")
    public TableDataInfo<DhChatMessageVo> list(DhChatMessageBo bo, PageQuery pageQuery) {
        return dhChatMessageService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出对话消息列表
     */
    @SaCheckPermission("human:chatMessage:export")
    @Log(title = "对话消息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(DhChatMessageBo bo, HttpServletResponse response) {
        List<DhChatMessageVo> list = dhChatMessageService.queryList(bo);
        ExcelUtil.exportExcel(list, "对话消息", DhChatMessageVo.class, response);
    }

    /**
     * 获取对话消息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("human:chatMessage:query")
    @GetMapping("/{id}")
    public R<DhChatMessageVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(dhChatMessageService.queryById(id));
    }

    /**
     * 新增对话消息
     */
    @SaCheckPermission("human:chatMessage:add")
    @Log(title = "对话消息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody DhChatMessageBo bo) {
        return toAjax(dhChatMessageService.insertByBo(bo));
    }

    /**
     * 修改对话消息
     */
    @SaCheckPermission("human:chatMessage:edit")
    @Log(title = "对话消息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody DhChatMessageBo bo) {
        return toAjax(dhChatMessageService.updateByBo(bo));
    }

    /**
     * 删除对话消息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("human:chatMessage:remove")
    @Log(title = "对话消息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(dhChatMessageService.deleteWithValidByIds(List.of(ids), true));
    }
}
