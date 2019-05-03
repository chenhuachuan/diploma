package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    public User selectAdminLogin(@Param("adminName") String adminName, @Param("password") String password);

    public String examineEmailExistOrNot(String email);

    public String examinePhoneNumExist(String phone);


    public List<User> selectAllUsersInfo(@Param("row") Integer row, @Param("index") Integer index);

    public Integer selectTotalCount();

    public List<User> selectUsersBySearch(@Param("row") Integer row, @Param("index") Integer index,
                                          @Param("search") String search, @Param("fromDate") java.sql.Date fromDate,
                                          @Param("toDate") java.sql.Date toDate);

    public Integer selectTotalCountBySearchBg(@Param("row") Integer row, @Param("index") Integer index,
                                              @Param("search") String search, @Param("fromDate") java.sql.Date fromDate,
                                              @Param("toDate") java.sql.Date toDate);
}
