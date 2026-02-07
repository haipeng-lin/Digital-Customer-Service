package com.flash.digital.langchain4j.config;

import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.rag.content.retriever.ContentRetriever;
import dev.langchain4j.rag.content.retriever.EmbeddingStoreContentRetriever;
import dev.langchain4j.store.embedding.pgvector.PgVectorEmbeddingStore;
import jakarta.annotation.Resource;
import org.springframework.context.annotation.Bean;

/**
 * @author haipeng-lin
 * @date 2026/2/7 15:19
 * @description: 内容检索器配置
 */
public class ContentRetrieverConfig {

    @Resource
    private EmbeddingModel embeddingModel;

    @Resource
    private PgVectorEmbeddingStore pgVectorEmbeddingStore;

    @Bean("contentRetriever")
    public ContentRetriever contentRetriever() {
        // 5、自定义内容查询器
        ContentRetriever contentRetriever = EmbeddingStoreContentRetriever.builder()
            .embeddingStore(pgVectorEmbeddingStore)
            .embeddingModel(embeddingModel)
            .maxResults(5) // 最多 5 个检索结果
            .minScore(0.75) // 过滤掉分数小于 0.75 的结果
            .build();
        return contentRetriever;
    }




}
