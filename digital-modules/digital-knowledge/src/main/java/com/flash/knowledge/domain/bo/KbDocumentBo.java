package com.flash.knowledge.domain.bo;

import com.flash.common.core.validate.EditGroup;
import com.flash.common.mybatis.core.domain.BaseEntity;
import com.flash.knowledge.domain.KbDocument;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 知识库文档业务对象 dig_kb_document
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = KbDocument.class, reverseConvertGenerate = false)
public class KbDocumentBo extends BaseEntity {

    /**
     * id
     */
    @NotNull(message = "id不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 知识库分类id
     */
    private Long kbCategoryId;

    /**
     * 标题
     */
    private String title;

    /**
     * 标签
     */
    private String tag;

    /**
     * 内容
     */
    private String content;

    /**
     * 状态（0-可用 1-禁用）
     */
    private String status;


}
