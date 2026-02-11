package com.flash.human.domain.bo;

import com.flash.common.core.validate.EditGroup;
import com.flash.common.mybatis.core.domain.BaseEntity;
import com.flash.human.domain.DhChatSession;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 对话会话业务对象 dh_chat_session
 *
 * @author haipeng-lin
 * @date 2026-02-09
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = DhChatSession.class, reverseConvertGenerate = false)
public class DhChatSessionBo extends BaseEntity {

    /**
     * ID
     */
    @NotNull(message = "ID不能为空", groups = { EditGroup.class })
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
