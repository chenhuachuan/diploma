package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.User;

public interface UserService {

    /**
     * register
     *
     * @param user
     * @return
     */
    void regist(User user);

    /**
     * 登录
     *
     * @param email
     * @param password
     * @return User
     */
    User login(String email, String password);

    /**
     * 判断邮箱是否重复
     *
     * @param email
     * @return
     */
    Boolean emailIsExists(String email);


    Boolean phoneNumberIsExists(String phone);

}

