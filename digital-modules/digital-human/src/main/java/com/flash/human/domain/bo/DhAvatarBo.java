package com.flash.human.domain.bo;

import com.flash.common.core.validate.AddGroup;
import com.flash.common.core.validate.EditGroup;
import com.flash.common.mybatis.core.domain.BaseEntity;
import com.flash.human.domain.DhAvatar;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 形象业务对象 dh_avatar
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = DhAvatar.class, reverseConvertGenerate = false)
public class DhAvatarBo extends BaseEntity {

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
     * 形象名称
     */
    @NotBlank(message = "形象名称不能为空", groups = {AddGroup.class, EditGroup.class})
    private String name;

    /**
     * 形象类型（0-2D 1-3D）
     */
    private String avatarType;

    /**
     * 标签类型（0-官方 1-推荐 2-个人）
     */
    private String tagType;

    /**
     * 缩略图地址
     */
    private String thumbnailUrl;

    /**
     * 模型文件路径
     */
    private String modelPath;

    /**
     * 状态（0-启用 1-禁用）
     */
    private String status;


}
