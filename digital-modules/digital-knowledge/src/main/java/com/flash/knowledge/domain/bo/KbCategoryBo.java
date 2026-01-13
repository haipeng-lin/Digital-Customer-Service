package com.flash.knowledge.domain.bo;

import com.flash.common.core.validate.EditGroup;
import com.flash.common.mybatis.core.domain.BaseEntity;
import com.flash.knowledge.domain.KbCategory;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 知识库分类业务对象 dig_kb_category
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = KbCategory.class, reverseConvertGenerate = false)
public class KbCategoryBo extends BaseEntity {

    /**
     * id
     */
    @NotNull(message = "id不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 分类名称
     */
    private String name;

    /**
     * 排序
     */
    private Long orderNum;

    /**
     * 是否可用（1-是 0-否）
     */
    private Long isEnable;


}
