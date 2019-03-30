package com.jz1501.chenhc.diploma.tfbook.redis;

import com.alibaba.druid.util.StringUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.jz1501.chenhc.diploma.tfbook.entity.User;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Repository
public class UserRedis {
    @Resource
    private RedisTemplate<String, String> redisTemplate;


    public void add(String key, Long time, User user) {
        Gson gson = new Gson();
        redisTemplate.opsForValue().set(key, gson.toJson(user), time, TimeUnit.MINUTES);
    }

    public void add(String key, Long time, List<User> users) {
        Gson gson = new Gson();
        redisTemplate.opsForValue().set(key, gson.toJson(users), time, TimeUnit.MINUTES);
    }

    public User get(String key) {
        Gson gson = new Gson();
        User user = null;
        String userJson = redisTemplate.opsForValue().get(key);
        if (!StringUtils.isEmpty(userJson)) user = gson.fromJson(userJson, User.class);
        return user;
    }

    public List<User> users(String key) {
        Gson gson = new Gson();
        List<User> users = null;
        String usersJson = redisTemplate.opsForValue().get(key);
        // 将期望解析的数据类型返回给gson
        if (!StringUtils.isEmpty(usersJson)) users = gson.fromJson(usersJson, new TypeToken<List<User>>() {
        }.getType());
        return users;
    }

    public void delete(String key) {
        redisTemplate.opsForValue().getOperations().delete(key);
    }

}
