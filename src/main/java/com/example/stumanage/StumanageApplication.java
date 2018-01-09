package com.example.stumanage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.mybatis.spring.annotation.MapperScan;

@EnableAutoConfiguration
@MapperScan("com.example.stumanage.dao.*")
@SpringBootApplication
public class StumanageApplication {
    public static void main(String[] args) {
        SpringApplication.run(StumanageApplication.class, args);
    }
}
