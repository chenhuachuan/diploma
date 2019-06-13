package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.User;

import java.util.List;

public interface UserService {

    /**
     * register
     * @return
     */
    void regist(User user);

    void adminRegist(User user);
    /**
     * 登录
     * @param email
     * @param password
     * @return User
     */
    User login(String email, String password);

    void findOrUpdatePwd(String userId, String password);

    User selectUserByEmail(String email);

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

    public List<User> queryUsersBySearch(Integer row, Integer page, String search);

    public Integer queryUsersBySearchTotalCount(String search);

    public void modifyUserInfo(User user);

    public void forbidUser(String userId, String status);
}

