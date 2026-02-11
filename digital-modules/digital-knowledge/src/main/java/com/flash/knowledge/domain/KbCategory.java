package com.flash.knowledge.domain;

import com.flash.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 知识库分类对象 dig_kb_category
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("kb_category")
public class KbCategory extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id")
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
     * 状态（0-启用 1-禁用）
     */
    private String status;


}
