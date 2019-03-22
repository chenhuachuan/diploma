package com.jz1501.chenhc.diploma.tfbook;

import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
public class TestTfBookDemo {

    @Before
    public void init() {
        System.out.println("----begin---------------------");

    }

    @After
    public void after() {
        System.out.println("----end---------------------");
    }

}
