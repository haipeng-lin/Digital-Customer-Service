package com.flash.human.domain.bo;

import com.flash.human.domain.DhBackgroundCategory;
import com.flash.common.mybatis.core.domain.BaseEntity;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * 背景分类业务对象 dh_background_category
 *
 * @author haipeng-lin
 * @date 2026-02-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = DhBackgroundCategory.class, reverseConvertGenerate = false)
public class DhBackgroundCategoryBo extends BaseEntity {

    /**
     * ID
     */
    @NotNull(message = "ID不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 分类名称（会议室、演播厅、自然风光）
     */
    @NotBlank(message = "分类名称（会议室、演播厅、自然风光）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 状态（1-可用 2-禁用）
     */
    private Long status;

    /**
     * 备注
     */
    private String remark;

    /**
     * 排序
     */
    private Long orderNum;


}
