package com.flash.digital.langchain4j.service;

import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.spring.AiService;
import reactor.core.publisher.Flux;

import static dev.langchain4j.service.spring.AiServiceWiringMode.EXPLICIT;

/**
 * @author haipeng-lin
 * @date 2026/1/16 16:24
 * @description: OpenAi服务
 */
@AiService(wiringMode = EXPLICIT,
    chatModel = "openAiChatModel",
    contentRetriever = "contentRetriever",	   // 内容检索器
    streamingChatModel = "openAiStreamingChatModel"
)
public interface OpenAiService {

    @SystemMessage("提示词：你是一名智能小助手")
    String chat(String message);

    @SystemMessage("提示词：你是一名智能客服，请根据我提供的知识精准准确回答用户的问题，不要回答除了问题无关的内容，如果你不知道内容，请输出'不好意思，我不明白的您的意思，售后电话：18811888811'")
    Flux<String> chatWhitStream(String message);

}
