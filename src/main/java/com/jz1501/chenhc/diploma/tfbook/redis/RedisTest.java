package com.jz1501.chenhc.diploma.tfbook.redis;

import com.jz1501.chenhc.diploma.tfbook.entity.User;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RedisTest {
    private Logger logger = LoggerFactory.getLogger(RedisTest.class);

    @Autowired
    UserRedis userRedis;

    @Before
    public void setup() {
        User user = new User();
        user.setUserId("123");
        user.setUserName("花无缺");
        user.setPhone("189089898889");
        userRedis.delete(this.getClass().getName() + "userByName:" + user.getUserName());
        userRedis.add(this.getClass().getName() + ":userPhone:" + user.getPhone(), 10L, user);
    }

    @Test
    public void get() {
        User user = userRedis.get(this.getClass().getName() + ":userPhone:189089898889");
        logger.info("=================user==================name:{}", user.getUserName());
    }


}
