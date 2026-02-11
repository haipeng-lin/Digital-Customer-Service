package com.flash.human.domain.vo;

import cn.idev.excel.annotation.ExcelIgnoreUnannotated;
import cn.idev.excel.annotation.ExcelProperty;
import com.flash.common.excel.annotation.ExcelDictFormat;
import com.flash.common.excel.convert.ExcelDictConvert;
import com.flash.common.translation.annotation.Translation;
import com.flash.common.translation.constant.TransConstant;
import com.flash.human.domain.DhAvatarCategory;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;


/**
 * 形象分类视图对象 dh_avatar_category
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = DhAvatarCategory.class)
public class DhAvatarCategoryVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @ExcelProperty(value = "ID")
    private Long id;

    /**
     * 分类名称
     */
    @ExcelProperty(value = "分类名称")
    private String name;

    /**
     * 状态（0-启用 1-禁用）
     */
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0-可用,1-禁用")
    private String status;

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
