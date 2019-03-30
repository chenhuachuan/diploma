package com.jz1501.chenhc.diploma.tfbook;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.MemcachedClientBuilder;
import net.rubyeye.xmemcached.XMemcachedClientBuilder;
import net.rubyeye.xmemcached.exception.MemcachedException;
import net.rubyeye.xmemcached.utils.AddrUtil;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

public class MemcachedTest {
    public static void main(String[] args) throws IOException {
        MemcachedClientBuilder builder = new XMemcachedClientBuilder(
                // 多个Memcached Server：host1:port1
                AddrUtil.getAddresses("192.168.74.138:11211"));
        MemcachedClient memcachedClient = builder.build();
        try {
            // 存储数据 参数⼀：key名 参数⼆：expire时间（单位秒）表示永久存储（默认是⼀个⽉）
            //参数三：value值
            memcachedClient.set("wtf", 0, "Hello,xmemcached");
            // 获取数据
            String value = memcachedClient.get("wtf");
            System.out.println("wtf=" + value);
            // 删除数据
            memcachedClient.delete("wtf");
            value = memcachedClient.get("wtf");
            System.out.println("wtf=" + value);
        } catch (MemcachedException e) {
            System.err.println("MemcachedClient operation fail");
            e.printStackTrace();
        } catch (TimeoutException e) {
            System.err.println("MemcachedClient operation timeout");
            e.printStackTrace();
        } catch (InterruptedException e) {
            // ignore
        }
        try {
            //close memcached client
            memcachedClient.shutdown();
        } catch (IOException e) {
            System.err.println("Shutdown MemcachedClient fail");
            e.printStackTrace();
        }

    }
}
