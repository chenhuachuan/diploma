package com.jz1501.chenhc.diploma.tfbook;

import com.whalin.MemCached.MemCachedClient;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringBootMemcachedTest {
    @Autowired
    private MemCachedClient memCachedClient;

    @Test
    public void contextLoads() throws InterruptedException {
        // 放入缓存
        boolean flag = memCachedClient.set("wff", "陈华川s");

        // 取出缓存
        Object a = memCachedClient.get("wff");
        System.out.println("name:" + a);
        // 删除数据
        memCachedClient.delete("wff");

        // 3s后过期
        memCachedClient.set("age", 18, new Date(3000));
        Object b = memCachedClient.get("age");
        System.out.println("age:" + b);

        Thread.sleep(3000);
        b = memCachedClient.get("age");
        System.out.println("3秒后：" + b);

    }

    @Test
    public void testThisSBMethod() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        System.out.println(clazz + method);
    }
}
