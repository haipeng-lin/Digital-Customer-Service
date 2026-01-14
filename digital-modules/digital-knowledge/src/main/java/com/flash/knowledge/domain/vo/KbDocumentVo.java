package com.flash.knowledge.domain.vo;

import cn.idev.excel.annotation.ExcelIgnoreUnannotated;
import cn.idev.excel.annotation.ExcelProperty;
import com.flash.common.excel.annotation.ExcelDictFormat;
import com.flash.common.excel.convert.ExcelDictConvert;
import com.flash.knowledge.domain.KbDocument;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;


/**
 * 知识库文档视图对象 dig_kb_document
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = KbDocument.class)
public class KbDocumentVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @ExcelProperty(value = "id")
    private Long id;

    /**
     * 知识库分类id
     */
    @ExcelProperty(value = "知识库分类id")
    private Long kbCategoryId;

    /**
     * 标题
     */
    @ExcelProperty(value = "标题")
    private String title;

    /**
     * 标签
     */
    @ExcelProperty(value = "标签")
    private String tag;

    /**
     * 内容
     */
    @ExcelProperty(value = "内容")
    private String content;

    /**
     * 是否可用（1-是 0否）
     */
    @ExcelProperty(value = "是否可用", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_enable")
    private String isEnable;

    /**
     * 创建人
     */
    @ExcelProperty(value = "创建人")
    private String createBy;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private Date createTime;

}
