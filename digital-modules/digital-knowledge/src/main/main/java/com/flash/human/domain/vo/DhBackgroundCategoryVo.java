package com.flash.human.domain.vo;

import com.flash.human.domain.DhBackgroundCategory;
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
 * 背景分类视图对象 dh_background_category
 *
 * @author haipeng-lin
 * @date 2026-02-06
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = DhBackgroundCategory.class)
public class DhBackgroundCategoryVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @ExcelProperty(value = "ID")
    private Long id;

    /**
     * 部门ID
     */
    @ExcelProperty(value = "部门ID")
    private Long deptId;

    /**
     * 分类名称（会议室、演播厅、自然风光）
     */
    @ExcelProperty(value = "分类名称", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "会=议室、演播厅、自然风光")
    private String name;

    /**
     * 状态（1-可用 2-禁用）
     */
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-可用,2=-禁用")
    private Long status;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 排序
     */
    @ExcelProperty(value = "排序")
    private Long orderNum;


}
