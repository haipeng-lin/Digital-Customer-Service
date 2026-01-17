package com.flash.knowledge.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import com.flash.common.web.core.BaseController;
import com.flash.digital.langchain4j.service.OpenAiService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

/**
 * 知识库分类
 *
 * @author haipeng-lin
 * @date 2026-01-13
 */
@SaIgnore
@RequiredArgsConstructor
@RestController
@RequestMapping("/ai")
public class TestController extends BaseController {

    private final OpenAiService openAiService;

    /**
     * 流式聊天
     */
    @GetMapping(value="/stream", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<String> chatWithStream(@RequestParam("message") String message) {
        return openAiService.chatWhitStream(message)
            .map(token -> {
                // 如果 token 为空或是换行符，进行替换
                // 即使 token 是 "你好\n"，也会变成 "你好<|newline|>"
                if (token == null) return "";
                return token.replace("\n", "<|newline|>");
            });
    }

}
