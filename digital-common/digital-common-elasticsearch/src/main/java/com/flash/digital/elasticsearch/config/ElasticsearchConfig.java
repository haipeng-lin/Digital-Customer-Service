package com.flash.digital.elasticsearch.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.client.ClientConfiguration;
import org.springframework.data.elasticsearch.client.elc.ElasticsearchConfiguration;

import java.time.Duration;

/**
 * @author haipeng-lin
 * @date 2026/1/16 15:32
 * @description: ES配置类
 */
@Configuration
// 核心逻辑：只有当 elasticsearch.enabled 为 true 时，该配置类才生效
// matchIfMissing = false 表示默认不开启
@ConditionalOnProperty(name = "elasticsearch.enabled", havingValue = "true", matchIfMissing = false)
public class ElasticsearchConfig extends ElasticsearchConfiguration {

    @Value("${elasticsearch.uris}")
    private String uris;

    @Value("${elasticsearch.connection-timeout}")
    private Duration connectTimeout;

    @Value("${elasticsearch.socket-timeout}")
    private Duration socketTimeout;

    @Override
    public ClientConfiguration clientConfiguration() {
        // 解析 URI (去掉 http://)
        String hostAndPort = uris.replace("http://", "").replace("https://", "");

        return ClientConfiguration.builder()
            .connectedTo(hostAndPort)
            .withConnectTimeout(connectTimeout)
            .withSocketTimeout(socketTimeout)
            // 如果有用户名密码，可以在这里链式调用 .withBasicAuth("user", "pass")
            .build();
    }
}
