package com.flash.human.domain;

import com.flash.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 对话消息对象 dh_chat_message
 *
 * @author haipeng-lin
 * @date 2026-02-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("dh_chat_message")
public class DhChatMessage extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 会话ID
     */
    private Long sessionId;

    /**
     * 角色（user、agent）
     */
    private String role;

    /**
     * 内容
     */
    private String content;

    /**
     * 模型名称
     */
    private String modelName;

    /**
     * 输入Token
     */
    private Long promptToken;

    /**
     * 输出Token
     */
    private Long completionToken;

    /**
     * 耗时（毫秒）
     */
    private Long latencyMs;

    /**
     * 状态（0-成功 1-失败）
     */
    private String status;

    /**
     * 评价（0-未评价 1-赞 2-踩）
     */
    private String feedback;


}
