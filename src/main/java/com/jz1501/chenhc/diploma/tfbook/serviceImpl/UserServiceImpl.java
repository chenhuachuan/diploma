package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.UserMapper;
import com.jz1501.chenhc.diploma.tfbook.entity.User;
import com.jz1501.chenhc.diploma.tfbook.service.UserService;
import com.jz1501.chenhc.diploma.tfbook.util.TimeFormatUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired(required = false)
    private UserMapper userMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void regist(User user) {
        String salt = DigestUtils.md5Hex(user.getPassword());
        String password = DigestUtils.md5Hex(user.getPassword() + salt);
        String userId = UUID.randomUUID().toString().replace("-", "");
        user.setUserId(userId);
        user.setSalt(salt);
        user.setPassword(password);
        user.setStatus("1");
        user.setRegistTime(new Date());
        userMapper.insertIntoUser(user);
    }

    //管理员注册
    @Override
    public void adminRegist(User user) {
        String salt = DigestUtils.md5Hex(user.getPassword());
        String password = DigestUtils.md5Hex(user.getPassword() + salt);
        String userId = UUID.randomUUID().toString().replace("-", "");

        user.setUserId(userId);
        user.setSalt(salt);
        user.setPassword(password);
        user.setStatus("88");
        user.setRegistTime(new Date());
        user.setNickName("超级管理员");
        userMapper.insertIntoUser(user);
    }

    @Override
    public User login(String email, String password) {
        String salt = DigestUtils.md5Hex(password);
        String userPassword = DigestUtils.md5Hex(password + salt);
        //将用户输入密码加盐和数据库对比
        User dbUser = userMapper.selectByNameAndPassword(email, userPassword);
        return dbUser;
    }

    @Override
    public User adminLogin(String adminName, String password) {
        String salt = DigestUtils.md5Hex(password);
        String userPassword = DigestUtils.md5Hex(password + salt);
        //将用户输入密码加盐和数据库对比
        User dbUser = userMapper.selectAdminLogin(adminName, userPassword);
        return dbUser;
    }

    @Override
    public Boolean emailIsExists(String email) {
        if (userMapper.examineEmailExistOrNot(email) != null) {
            return true;
        }
        return false;
    }

    @Override
    public Boolean phoneNumberIsExists(String phone) {
        if (userMapper.examinePhoneNumExist(phone) != null) {
            return true;
        }
        return false;
    }

    @Override
    public List<User> queryAllUsersInfo(Integer row, Integer page) {
        Integer index = (page - 1) * row;
        return userMapper.selectAllUsersInfo(row, index);
    }

    @Override
    public Integer queryUserTotalCount() {
        return userMapper.selectTotalCount();
    }

    @Override
    public List<User> queryUsersBySearch(Integer row, Integer page, String search, Date fromDate, Date toDate) {
        Integer index = (page - 1) * row;
        String searchFlag = "%" + search + "%";

        return userMapper.selectUsersBySearch(row, index, searchFlag, (fromDate == null) ? null : TimeFormatUtil.toSqlDate(fromDate), (toDate == null) ? null : TimeFormatUtil.toSqlDate(toDate));
    }

    @Override
    public Integer queryUsersBySearchTotalCount(Integer row, Integer page, String search, Date fromDate, Date toDate) {
        Integer index = (page - 1) * row;
        String searchFlag = "%" + search + "%";
        return userMapper.selectTotalCountBySearchBg(row, index, searchFlag, (fromDate == null) ? null : TimeFormatUtil.toSqlDate(fromDate), (toDate == null) ? null : TimeFormatUtil.toSqlDate(toDate));
    }
}
