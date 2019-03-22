package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    /**
     * 用户注册
     *
     * @param user
     * @return boolean
     */
    public void insertIntoUser(User user);

    /**
     * 用户登录
     *
     * @param email
     * @param password
     * @return User
     */
    public User selectByNameAndPassword(@Param("email") String email, @Param("password") String password);

    public String examineEmailExistOrNot(String email);

    public String examinePhoneNumExist(String phone);
}
