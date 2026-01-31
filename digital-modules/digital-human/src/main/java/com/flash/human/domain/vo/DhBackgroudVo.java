package com.flash.human.domain.vo;

import cn.idev.excel.annotation.ExcelIgnoreUnannotated;
import cn.idev.excel.annotation.ExcelProperty;
import com.flash.common.excel.annotation.ExcelDictFormat;
import com.flash.common.excel.convert.ExcelDictConvert;
import com.flash.human.domain.DhBackgroud;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;


/**
 * 背景视图对象 dh_backgroud
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = DhBackgroud.class)
public class DhBackgroudVo implements Serializable {

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
     * 用户ID
     */
    @ExcelProperty(value = "用户ID")
    private Long userId;

    /**
     * 分类ID
     */
    @ExcelProperty(value = "分类ID")
    private Long backgroudCategory;

    /**
     * 背景名称
     */
    @ExcelProperty(value = "背景名称")
    private String name;

    /**
     * 标签类型（1-官方 2-推荐 3-个人）
     */
    @ExcelProperty(value = "标签类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-官方,2=-推荐,3=-个人")
    private Long tagType;

    /**
     * 背景Url
     */
    @ExcelProperty(value = "背景Url")
    private String url;

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
