package com.flash.human.domain.vo;

import com.flash.human.domain.DhChatMessage;
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
 * 对话消息视图对象 dh_chat_message
 *
 * @author haipeng-lin
 * @date 2026-02-09
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = DhChatMessage.class)
public class DhChatMessageVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @ExcelProperty(value = "ID")
    private Long id;

    /**
     * 会话ID
     */
    @ExcelProperty(value = "会话ID")
    private Long sessionId;

    /**
     * 角色（user、agent）
     */
    @ExcelProperty(value = "角色", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "u=ser、agent")
    private String role;

    /**
     * 内容
     */
    @ExcelProperty(value = "内容")
    private String content;

    /**
     * 模型名称
     */
    @ExcelProperty(value = "模型名称")
    private String modelName;

    /**
     * 输入Token
     */
    @ExcelProperty(value = "输入Token")
    private Long promptToken;

    /**
     * 输出Token
     */
    @ExcelProperty(value = "输出Token")
    private Long completionToken;

    /**
     * 耗时（毫秒）
     */
    @ExcelProperty(value = "耗时", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "毫=秒")
    private Long latencyMs;

    /**
     * 状态（0-成功 1-失败）
     */
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=-成功,1=-失败")
    private String status;

    /**
     * 评价（0-未评价 1-赞 2-踩）
     */
    @ExcelProperty(value = "评价", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=-未评价,1=-赞,2=-踩")
    private String feedback;


}
