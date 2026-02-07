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
import com.flash.knowledge.domain.bo.KbDocumentBo;
import com.flash.knowledge.domain.vo.KbDocumentVo;
import com.flash.knowledge.service.IKbDocumentService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 知识库文档
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/knowledge/kbDocument")
public class KbDocumentController extends BaseController {

    private final IKbDocumentService kbDocumentService;

    /**
     * 查询知识库文档列表
     */
    @SaCheckPermission("knowledge:kbDocument:list")
    @GetMapping("/list")
    public TableDataInfo<KbDocumentVo> list(KbDocumentBo bo, PageQuery pageQuery) {
        return kbDocumentService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出知识库文档列表
     */
    @SaCheckPermission("knowledge:kbDocument:export")
    @Log(title = "知识库文档", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(KbDocumentBo bo, HttpServletResponse response) {
        List<KbDocumentVo> list = kbDocumentService.queryList(bo);
        ExcelUtil.exportExcel(list, "知识库文档", KbDocumentVo.class, response);
    }

    /**
     * 获取知识库文档详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("knowledge:kbDocument:query")
    @GetMapping("/{id}")
    public R<KbDocumentVo> getInfo(@NotNull(message = "主键不能为空")
                                   @PathVariable Long id) {
        return R.ok(kbDocumentService.queryById(id));
    }

    /**
     * 新增知识库文档
     */
    @SaCheckPermission("knowledge:kbDocument:add")
    @Log(title = "知识库文档", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody KbDocumentBo bo) {
        return toAjax(kbDocumentService.insertByBo(bo));
    }

    /**
     * 修改知识库文档
     */
    @SaCheckPermission("knowledge:kbDocument:edit")
    @Log(title = "知识库文档", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody KbDocumentBo bo) {
        return toAjax(kbDocumentService.updateByBo(bo));
    }

    /**
     * 删除知识库文档
     *
     * @param ids 主键串
     */
    @SaCheckPermission("knowledge:kbDocument:remove")
    @Log(title = "知识库文档", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(kbDocumentService.deleteWithValidByIds(List.of(ids), true));
    }

    /**
     * 修改状态
     */
    @SaCheckPermission("knowledge:kbDocument:edit")
    @Log(title = "知识库文档", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping("/changeStatus")
    public R<Void> changeStatus(@RequestBody KbDocumentBo kbDocument) {
        return toAjax(kbDocumentService.updateStatus(kbDocument.getId(), kbDocument.getStatus()));
    }
}
