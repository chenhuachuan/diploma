package com.jz1501.chenhc.diploma.tfbook.controller;

import com.whalin.MemCached.MemCachedClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping("/cache")
public class MemcacheController {

    @Autowired
    private MemCachedClient memCachedClient;

    @RequestMapping("/memcache_test")
    @ResponseBody
    public String memcache() throws InterruptedException {
        // 放入缓存
        boolean flag = memCachedClient.set("name", "陈华川");
        // 取出缓存
        Object value = memCachedClient.get("name");
        System.out.println("姓名：" + value);
        // 3s后过期
        memCachedClient.set("num", "666", new Date(3000));
        Object key = memCachedClient.get("num");
        System.out.println(key);
        //多线程睡眠3s
        Thread.sleep(3000);
        key = memCachedClient.get("num");
        System.out.println(value);
        System.out.println(key);
        return "success";
    }

}
