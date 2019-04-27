package com.jz1501.chenhc.diploma.tfbook;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@SpringBootApplication
//@MapperScan("com.jz1501.chenhc.diploma.tfbook.dao")
//public class Application extends SpringBootServletInitializer{
//
//    /**
//     * Linux上部署重写该方法
//     * @return
//     */
//    @Override
//    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
//        return builder.sources(Application.class);
//    }
//
//    public static void main(String[] args) {
//        SpringApplication.run(Application.class, args);
//    }
//}
@SpringBootApplication
@MapperScan("com.jz1501.chenhc.diploma.tfbook.dao")
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}

