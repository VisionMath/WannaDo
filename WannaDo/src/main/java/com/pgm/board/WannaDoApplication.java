package com.pgm.board;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class WannaDoApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(WannaDoApplication.class);
    }

    public static void main(String[] args) {

        System.setProperty("server.servlet.context-path", "/WannaDo");
        SpringApplication.run(WannaDoApplication.class, args);
    }

}
