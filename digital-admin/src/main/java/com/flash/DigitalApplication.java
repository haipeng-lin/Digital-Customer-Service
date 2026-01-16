package com.flash;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.metrics.buffering.BufferingApplicationStartup;

/**
 * 启动程序
 *
 * @author haipeng-lin
 */

@SpringBootApplication
public class DigitalApplication {

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(DigitalApplication.class);
        application.setApplicationStartup(new BufferingApplicationStartup(2048));
        application.run(args);
        System.out.println("(♥◠‿◠)ﾉﾞ  Digital-Customer-Service 启动成功   ლ(´ڡ`ლ)ﾞ");
    }

}
