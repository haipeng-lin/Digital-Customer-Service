package com.flash.human.domain;

import com.flash.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 对话会话对象 dh_chat_session
 *
 * @author haipeng-lin
 * @date 2026-02-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("dh_chat_session")
public class DhChatSession extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 标题
     */
    private String title;

    /**
     * 来源渠道（0-网页 1-APP 2-小程序）
     */
    private String channel;

    /**
     * 状态（0-AI 1-人工 2-已结束）
     */
    private String status;


}
