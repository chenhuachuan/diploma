package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.UserMapper;
import com.jz1501.chenhc.diploma.tfbook.entity.User;
import com.jz1501.chenhc.diploma.tfbook.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
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

    @Override
    public User login(String email, String password) {


        String salt = DigestUtils.md5Hex(password);
        String userPassword = DigestUtils.md5Hex(password + salt);
        //将用户输入密码加盐和数据库对比
        User dbUser = userMapper.selectByNameAndPassword(email, userPassword);
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
}
