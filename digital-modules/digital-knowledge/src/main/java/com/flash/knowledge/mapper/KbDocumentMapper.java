package com.flash.knowledge.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.flash.common.mybatis.core.mapper.BaseMapperPlus;
import com.flash.knowledge.domain.KbDocument;
import com.flash.knowledge.domain.vo.KbDocumentVo;
import org.apache.ibatis.annotations.Param;

/**
 * 知识库文档Mapper接口
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
public interface KbDocumentMapper extends BaseMapperPlus<KbDocument, KbDocumentVo> {
    Page<KbDocumentVo> selectQueryPage(@Param("page") Page<KbDocument> page, @Param(Constants.WRAPPER) Wrapper<KbDocument> queryWrapper);
}
