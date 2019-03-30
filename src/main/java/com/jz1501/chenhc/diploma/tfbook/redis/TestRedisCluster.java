package com.jz1501.chenhc.diploma.tfbook.redis;

import org.junit.jupiter.api.Test;
import redis.clients.jedis.Jedis;

public class TestRedisCluster {
//选中模块-> load/Unload Modules 关闭模块

    @Test
    public void test() {

        Jedis jedis = new Jedis("192.168.74.138", 7000);

        String name = jedis.get("name");
        System.out.println(name);


    }

}
