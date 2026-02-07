package com.flash.human.domain;

import com.flash.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 形象对象 dh_avatar
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("dh_avatar")
public class DhAvatar extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 部门ID
     */
    private Long deptId;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 形象名称
     */
    private String name;

    /**
     * 形象类型（1-2D 2-3D）
     */
    private Long avatarType;

    /**
     * 标签类型（1-官方 2-推荐 3-个人）
     */
    private Long tagType;

    /**
     * 缩略图地址
     */
    private String thumbnailUrl;

    /**
     * 模型文件路径
     */
    private String modelPath;

    /**
     * 状态（0-可用 1-禁用）
     */
    private Integer status;


}
