package com.flash.knowledge.es;

import com.flash.knowledge.domain.KbDocument;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.util.List;

/**
 * @author haipeng-lin
 * @date 2026/1/14 16:13
 * @description: 知识库文档EsMapper
 */
public interface KbDocumentEsMapper extends ElasticsearchRepository<KbDocument, String> {
    // 自动根据方法名生成查询逻辑
    List<KbDocument> findByTitleContaining(String keyword);
}
