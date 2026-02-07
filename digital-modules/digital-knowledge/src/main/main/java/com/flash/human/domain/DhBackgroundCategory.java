package com.flash.human.domain;

import com.flash.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 背景分类对象 dh_background_category
 *
 * @author haipeng-lin
 * @date 2026-02-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("dh_background_category")
public class DhBackgroundCategory extends TenantEntity {

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
     * 分类名称（会议室、演播厅、自然风光）
     */
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
