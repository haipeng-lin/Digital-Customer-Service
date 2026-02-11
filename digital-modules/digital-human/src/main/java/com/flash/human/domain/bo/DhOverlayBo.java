package com.flash.human.domain.bo;

import com.flash.common.core.validate.AddGroup;
import com.flash.common.core.validate.EditGroup;
import com.flash.common.mybatis.core.domain.BaseEntity;
import com.flash.human.domain.DhOverlay;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 贴图业务对象 dh_overlay
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = DhOverlay.class, reverseConvertGenerate = false)
public class DhOverlayBo extends BaseEntity {

    /**
     * ID
     */
    @NotNull(message = "ID不能为空", groups = {EditGroup.class})
    private Long id;

    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 用户ID
     */
    @NotNull(message = "用户ID不能为空", groups = {AddGroup.class, EditGroup.class})
    private Long userId;

    /**
     * 贴图名称
     */
    private String name;

    /**
     * 标签类型（0-官方 1-推荐 2-个人）
     */
    private String tagType;

    /**
     * 贴图Url
     */
    @NotBlank(message = "贴图Url不能为空", groups = {AddGroup.class, EditGroup.class})
    private String url;

    /**
     * 排序
     */
    private Long orderNum;


}
