package com.flash.digital.langchain4j.config;

import dev.langchain4j.data.segment.TextSegment;
import dev.langchain4j.store.embedding.EmbeddingStore;
import dev.langchain4j.store.embedding.pgvector.PgVectorEmbeddingStore;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author haipeng-lin
 * @date 2026/2/7 14:43
 * @description: PGVector配置
 */
@Configuration
public class PgVectorConfig {

    @Bean("pgVectorEmbeddingStore")
    public EmbeddingStore<TextSegment> embeddingStore() {
        return PgVectorEmbeddingStore.builder()
            .host("")          // 数据库地址
            .port(55432)                 // 端口
            .user("postgres")           // 用户名
            .password("")       // 密码
            .database("postgres")        // 数据库名
            .table("test_embeddings")   // 向量表名（不存在会自动创建）
            .dimension(1024)            // text-embedding-v4的推荐向量维度
            .build();
    }



}
