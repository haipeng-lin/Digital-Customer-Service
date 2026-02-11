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
     * 形象名称
     */
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
