package com.flash.human.domain.vo;

import cn.idev.excel.annotation.ExcelIgnoreUnannotated;
import cn.idev.excel.annotation.ExcelProperty;
import com.flash.common.excel.annotation.ExcelDictFormat;
import com.flash.common.excel.convert.ExcelDictConvert;
import com.flash.common.translation.annotation.Translation;
import com.flash.common.translation.constant.TransConstant;
import com.flash.human.domain.DhOverlay;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;


/**
 * 贴图视图对象 dh_overlay
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = DhOverlay.class)
public class DhOverlayVo implements Serializable {

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
     * 贴图名称
     */
    @ExcelProperty(value = "贴图名称")
    private String name;

    /**
     * 标签类型（1-官方 2-推荐 3-个人）
     */
    @ExcelProperty(value = "标签类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-官方,2=-推荐,3=-个人")
    private Long tagType;

    /**
     * 贴图Url
     */
    @ExcelProperty(value = "贴图Url")
    private String url;

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
