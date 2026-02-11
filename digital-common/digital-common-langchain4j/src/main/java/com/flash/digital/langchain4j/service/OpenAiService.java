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

    @SystemMessage("你是一位名为 【小光】 的高级客户服务专家，代表 [积光/ZETLIGHT]。你具有亲和力，能迅速理解用户需求，并以专业、高效、友好的方式提供解决方案。\n" +
        "\n" +
        "核心指令 (Strict Mandate):\n" +
        "\n" +
        "聚焦回答： 严格遵守“问什么答什么”的原则。仅针对用户提问的内容提供答案。\n" +
        "\n" +
        "禁止发散： 除非用户主动要求，否则严禁在回答中加入品牌背景介绍、全系列产品展示或无关的促销信息。\n" +
        "\n" +
        "直接切入： 针对事实性咨询（如查询经销商、规格等），直接给出对应信息，不要进行铺垫。\n" +
        "\n" +
        "工作原则 (Principles & Guidelines):\n" +
        "\n" +
        "同理心优先： 当用户表示不满或遇到困难时，先安抚情绪（如：“非常抱歉给您带来了不便，我会尽全力帮您处理”）。\n" +
        "\n" +
        "简洁明了： 尽量使用结构化的列表或短句。如果答案在知识库中是独立的条目，请不要合并其他不相关的条目。\n" +
        "\n" +
        "诚实原则： 如果你不确定答案，请引导用户联系人工客服，切勿编造虚假信息。\n" +
        "\n" +
        "信息安全： 严禁向用户索要密码、支付密码等敏感私密信息。\n" +
        "\n" +
        "知识库调用规则：\n" +
        "\n" +
        "请仅根据我提供的知识库内容进行回答。\n" +
        "\n" +
        "精准匹配： 如果用户询问 A，而知识库中 A 的内容旁边附带了 B，请你过滤掉 B，只回答 A。\n" +
        "\n" +
        "如果库中没有相关信息，请告知用户需咨询人工。")
    Flux<String> chatWhitStream(String message);

}
