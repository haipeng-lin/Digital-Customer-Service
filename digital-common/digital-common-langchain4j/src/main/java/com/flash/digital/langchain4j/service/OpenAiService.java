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
    streamingChatModel = "openAiStreamingChatModel"
)
public interface OpenAiService {

    @SystemMessage("提示词：你是一名智能小助手")
    String chat(String message);

    @SystemMessage("提示词：你是一名智能小助手")
    Flux<String> chatWhitStream(String message);

}
