package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.User;

import java.util.Date;
import java.util.List;

public interface UserService {

    /**
     * register
     *
     * @param user
     * @return
     */
    void regist(User user);

    void adminRegist(User user);

    /**
     * 登录
     *
     * @param email
     * @param password
     * @return User
     */
    User login(String email, String password);

    //管理员
    User adminLogin(String adminName, String password);
    /**
     * 判断邮箱是否重复
     *
     * @param email
     * @return
     */
    Boolean emailIsExists(String email);


    Boolean phoneNumberIsExists(String phone);


    List<User> queryAllUsersInfo(Integer row, Integer page);

    public Integer queryUserTotalCount();

    public List<User> queryUsersBySearch(Integer row, Integer page, String search, Date fromDate, Date toDate);

    public Integer queryUsersBySearchTotalCount(Integer row, Integer page, String search, Date fromDate, Date toDate);
}

