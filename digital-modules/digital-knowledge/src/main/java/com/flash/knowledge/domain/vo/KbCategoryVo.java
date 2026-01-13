package com.flash.knowledge.domain.vo;

import cn.idev.excel.annotation.ExcelIgnoreUnannotated;
import cn.idev.excel.annotation.ExcelProperty;
import com.flash.common.excel.annotation.ExcelDictFormat;
import com.flash.common.excel.convert.ExcelDictConvert;
import com.flash.knowledge.domain.KbCategory;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;



/**
 * 知识库分类视图对象 dig_kb_category
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = KbCategory.class)
public class KbCategoryVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @ExcelProperty(value = "id")
    private Long id;

    /**
     * 分类名称
     */
    @ExcelProperty(value = "分类名称")
    private String name;

    /**
     * 排序
     */
    @ExcelProperty(value = "排序")
    private Long orderNum;

    /**
     * 是否可用（1-是 0-否）
     */
    @ExcelProperty(value = "是否可用", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_enable")
    private Long isEnable;


}
