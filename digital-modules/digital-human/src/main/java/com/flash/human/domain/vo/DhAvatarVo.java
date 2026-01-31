package com.flash.human.domain.vo;

import cn.idev.excel.annotation.ExcelIgnoreUnannotated;
import cn.idev.excel.annotation.ExcelProperty;
import com.flash.common.excel.annotation.ExcelDictFormat;
import com.flash.common.excel.convert.ExcelDictConvert;
import com.flash.human.domain.DhAvatar;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;


/**
 * 形象视图对象 dh_avatar
 *
 * @author haipeng-lin
 * @date 2026-01-31
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = DhAvatar.class)
public class DhAvatarVo implements Serializable {

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
     * 形象名称
     */
    @ExcelProperty(value = "形象名称")
    private String name;

    /**
     * 形象类型（1-2D 2-3D）
     */
    @ExcelProperty(value = "形象类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-2D,2=-3D")
    private Long avatarType;

    /**
     * 标签类型（1-官方 2-推荐 3-个人）
     */
    @ExcelProperty(value = "标签类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-官方,2=-推荐,3=-个人")
    private Long tagType;

    /**
     * 缩略图地址
     */
    @ExcelProperty(value = "缩略图地址")
    private String thumbnailUrl;

    /**
     * 模型文件路径
     */
    @ExcelProperty(value = "模型文件路径")
    private String modelPath;

    /**
     * 状态（1-可用 2-禁用）
     */
    @ExcelProperty(value = "状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "1=-可用,2=-禁用")
    private Long status;


}
