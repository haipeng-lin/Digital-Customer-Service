package com.flash.human.domain.bo;

import com.flash.human.domain.DhBackground;
import com.flash.common.mybatis.core.domain.BaseEntity;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * 背景业务对象 dh_background
 *
 * @author haipeng-lin
 * @date 2026-02-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = DhBackground.class, reverseConvertGenerate = false)
public class DhBackgroundBo extends BaseEntity {

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
     * 用户ID
     */
    @NotNull(message = "用户ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long userId;

    /**
     * 分类ID
     */
    @NotNull(message = "分类ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long backgroundCategory;

    /**
     * 背景名称
     */
    @NotBlank(message = "背景名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 标签类型（1-官方 2-推荐 3-个人）
     */
    private Long tagType;

    /**
     * 背景Url
     */
    @NotBlank(message = "背景Url不能为空", groups = { AddGroup.class, EditGroup.class })
    private String url;

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
