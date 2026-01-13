package com.flash.generator.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.flash.common.mybatis.core.mapper.BaseMapperPlus;
import com.flash.generator.domain.GenTableColumn;

/**
 * 业务字段 数据层
 *
 * @author haipeng-lin
 */
@InterceptorIgnore(dataPermission = "true", tenantLine = "true")
public interface GenTableColumnMapper extends BaseMapperPlus<GenTableColumn, GenTableColumn> {

}
