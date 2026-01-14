package com.flash.knowledge.mapper;

import com.flash.common.mybatis.core.mapper.BaseMapperPlus;
import com.flash.knowledge.domain.KbCategory;
import com.flash.knowledge.domain.KbDocument;
import com.flash.knowledge.domain.vo.KbCategoryVo;

import java.util.List;

/**
 * 知识库分类Mapper接口
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
public interface KbCategoryMapper extends BaseMapperPlus<KbCategory, KbCategoryVo> {

    // 自动根据方法名生成查询逻辑
    List<KbDocument> findByTitleContaining(String keyword);

}
