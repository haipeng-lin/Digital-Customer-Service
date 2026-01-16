//package com.flash;
//
//import com.flash.knowledge.domain.KbDocument;
//import com.flash.knowledge.es.KbDocumentEsMapper;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import java.util.List;
//
//import static org.wildfly.common.Assert.assertFalse;
//import static org.wildfly.common.Assert.assertTrue;
//
//@SpringBootTest(classes = DromaraApplication.class)
//class DigitalKnowledgeApplicationTests {
//
//    @Test
//    void contextLoads() {
//
//    }
//
//    @Autowired
//    private KbDocumentEsMapper kbDocumentEsMapper;
//
//    @Test
//    void testEsConnection() {
//        // 1. 创建测试数据
//        KbDocument doc = new KbDocument();
//        doc.setId(1l);
//        doc.setTitle("Spring Boot 3 连接 ES 测试");
//        doc.setContent("这是一个测试文档，用于验证 Spring Data Elasticsearch 的集成。");
//        doc.setTag("AI");
//
//        // 2. 保存数据
//        kbDocumentEsMapper.save(doc);
//
//        // 3. 查询验证
//        assertTrue(kbDocumentEsMapper.existsById("1"));
//
//        // 4. 模糊搜索测试
//        List<KbDocument> results = kbDocumentEsMapper.findByTitleContaining("连接");
//        assertFalse(results.isEmpty());
//        System.out.println("搜索结果: " + results.get(0).getTitle());
//    }
//
//}
