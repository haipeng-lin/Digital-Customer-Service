package com.flash.human.domain.vo;

import com.flash.common.translation.annotation.Translation;
import com.flash.common.translation.constant.TransConstant;
import com.flash.human.domain.DhBackground;
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
 * 背景视图对象 dh_background
 *
 * @author haipeng-lin
 * @date 2026-02-06
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = DhBackground.class)
public class DhBackgroundVo implements Serializable {

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
    private Long backgroundCategory;

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
     * 状态（0-可用 1-禁用）
     */
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-可用,2=-禁用")
    private Integer status;

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

    /**
     * 创建人
     */
    @ExcelProperty(value = "创建人")
    private Long createBy;

    /**
     * 创建人名称
     */
    @Translation(type = TransConstant.USER_ID_TO_NAME, mapper = "createBy")
    private String createByName;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private Date createTime;

}
