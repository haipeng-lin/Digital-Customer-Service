package com.flash;

import com.flash.digital.langchain4j.service.OpenAiService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @author haipeng-lin
 * @date 2026/1/16 9:32
 * @description: ai测试
 */
@SpringBootTest
//@RunWith(SpringRunner.class)
public class Langchain4jTest {

    @Autowired
    private OpenAiService openAiService;

    @Test
    void testChatModelCall() {
        // 执行一个简单的调用
        System.out.println(openAiService.chat("你是谁"));

    }
}
