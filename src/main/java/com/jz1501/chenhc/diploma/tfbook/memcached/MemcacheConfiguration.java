package com.jz1501.chenhc.diploma.tfbook.memcached;

import com.whalin.MemCached.MemCachedClient;
import com.whalin.MemCached.SockIOPool;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MemcacheConfiguration {
    //服务器
    @Value("${memcache.servers}")
    private String[] servers;
    //
    @Value("${memcache.failover}")
    private boolean failover;
    @Value("${memcache.initConn}")
    private int initConn;
    @Value("${memcache.minConn}")
    private int minConn;
    @Value("${memcache.maxConn}")
    private int maxConn;
    @Value("${memcache.maintSleep}")
    private int maintSleep;
    @Value("${memcache.nagle}")
    private boolean nagel;
    @Value("${memcache.socketTO}")
    private int socketTO;
    @Value("${memcache.aliveCheck}")
    private boolean aliveCheck;

    @Bean
    public SockIOPool sockIOPool() {
        //获取连接池实例
        SockIOPool pool = SockIOPool.getInstance();
        //设置服务器信息
        pool.setServers(servers);
        pool.setFailover(failover);
        //设置初始连接数、最小连接数、最大连接数
        pool.setInitConn(initConn);
        pool.setMinConn(minConn);
        pool.setMaxConn(maxConn);
        //设置连接池守护线程的睡眠时间
        pool.setMaintSleep(maintSleep);
        //设置TCP参数，连接超时
        pool.setNagle(nagel);
        pool.setSocketTO(socketTO);
        pool.setAliveCheck(aliveCheck);
        //初始化并启动连接chi
        pool.initialize();
        return pool;
    }

    @Bean
    public MemCachedClient memCachedClient() {
        return new MemCachedClient();
    }
}
