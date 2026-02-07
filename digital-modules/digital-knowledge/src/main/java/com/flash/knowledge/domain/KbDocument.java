package com.flash.knowledge.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.flash.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.io.Serial;

/**
 * 知识库文档对象 dig_kb_document
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
@Document(indexName = "kb_document")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("kb_document")
public class KbDocument extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @Id
    @TableId(value = "id")
    private Long id;

    /**
     * 知识库分类id
     */
    @Field(type = FieldType.Text, analyzer = "ik_smart")
    private Long kbCategoryId;

    /**
     * 标题
     */
    @Field(type = FieldType.Text, analyzer = "ik_smart")
    private String title;

    /**
     * 标签
     */
    @Field(type = FieldType.Keyword)
    private String tag;

    /**
     * 内容
     */
    private String content;

    /**
     * 状态（0-可用 1-禁用）
     */
    private String status;


}
