package com.flash.human.domain.vo;

import com.flash.common.translation.annotation.Translation;
import com.flash.common.translation.constant.TransConstant;
import com.flash.human.domain.DhChatSession;
import cn.idev.excel.annotation.ExcelIgnoreUnannotated;
import cn.idev.excel.annotation.ExcelProperty;
import com.flash.common.excel.annotation.ExcelDictFormat;
import com.flash.common.excel.convert.ExcelDictConvert;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;



/**
 * 对话会话视图对象 dh_chat_session
 *
 * @author haipeng-lin
 * @date 2026-02-09
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = DhChatSession.class)
public class DhChatSessionVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @ExcelProperty(value = "ID")
    private Long id;

    /**
     * 用户ID
     */
    @ExcelProperty(value = "用户ID")
    private Long userId;

    /**
     * 标题
     */
    @ExcelProperty(value = "标题")
    private String title;

    /**
     * 来源渠道（0-网页 1-APP 2-小程序）
     */
    @ExcelProperty(value = "来源渠道", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=-网页,1=-APP,2=-小程序")
    private String channel;

    /**
     * 状态（0-AI 1-人工 2-已结束）
     */
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=-AI,1=-人工,2=-已结束")
    private String status;

    /**
     * 创建人名称
     */
    @Translation(type = TransConstant.USER_ID_TO_NAME, mapper = "userId")
    private String username;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private Date createTime;


}
