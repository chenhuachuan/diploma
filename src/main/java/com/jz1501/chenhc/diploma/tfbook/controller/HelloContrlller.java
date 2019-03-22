package com.jz1501.chenhc.diploma.tfbook.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloContrlller {
    @RequestMapping("/hello")
    public String hello() {
        return "hello SpringBoot";
    }
}
