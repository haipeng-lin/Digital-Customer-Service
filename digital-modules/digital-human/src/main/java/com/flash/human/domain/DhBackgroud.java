package com.flash.human.domain;

import com.flash.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 背景对象 dh_backgroud
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("dh_backgroud")
public class DhBackgroud extends TenantEntity {

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
     * 分类ID
     */
    private Long backgroudCategory;

    /**
     * 背景名称
     */
    private String name;

    /**
     * 标签类型（1-官方 2-推荐 3-个人）
     */
    private Long tagType;

    /**
     * 背景Url
     */
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
