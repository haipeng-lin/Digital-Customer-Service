//package com.flash;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.ai.chat.model.ChatModel;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
//
///**
// * @author haipeng-lin
// * @date 2026/1/16 9:32
// * @description: ai测试
// */
//@SpringBootTest(classes = DromaraApplication.class)
//public class SpringAITest {
//
//    @Autowired
//    private ChatModel chatModel;
//
//    @Test
//    void testChatModelCall() {
//        // 执行一个简单的调用
//        String response = chatModel.call("你好，请问你是谁？");
//
//        // 打印结果
//        System.out.println("AI Response: " + response);
//
//        // 断言：确认返回结果不为空
//        assertThat(response).isNotEmpty();
//        assertThat(response).contains("DeepSeek"); // 验证是否连接到了正确的模型
//    }
//}
