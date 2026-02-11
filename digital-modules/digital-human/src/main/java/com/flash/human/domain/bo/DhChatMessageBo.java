package com.flash.human.domain.bo;

import com.flash.common.core.validate.AddGroup;
import com.flash.common.core.validate.EditGroup;
import com.flash.common.mybatis.core.domain.BaseEntity;
import com.flash.human.domain.DhChatMessage;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 对话消息业务对象 dh_chat_message
 *
 * @author haipeng-lin
 * @date 2026-02-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = DhChatMessage.class, reverseConvertGenerate = false)
public class DhChatMessageBo extends BaseEntity {

    /**
     * ID
     */
    @NotNull(message = "ID不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 会话ID
     */
    @NotNull(message = "会话ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long sessionId;

    /**
     * 角色（user、agent）
     */
    @NotBlank(message = "角色（user、agent）不能为空", groups = { AddGroup.class, EditGroup.class })
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
