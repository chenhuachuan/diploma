package com.jz1501.chenhc.diploma.tfbook.entity;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private String userId;
    private String userName;
    private String nickName;
    private String password;
    private String email;
    private String salt;
    private String status;
    private Date registTime;
    private String sex;
    private Date birthdate;
    private String phone;

    public User() {
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public User(String userId, String userName, String nickName, String password, String email, String salt, String status, Date registTime, String sex, Date birthdate, String phone) {
        this.userId = userId;
        this.userName = userName;
        this.nickName = nickName;
        this.password = password;
        this.email = email;
        this.salt = salt;
        this.status = status;
        this.registTime = registTime;
        this.sex = sex;
        this.birthdate = birthdate;
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", salt='" + salt + '\'' +
                ", status='" + status + '\'' +
                ", registTime=" + registTime +
                ", sex='" + sex + '\'' +
                ", birthdate=" + birthdate +
                ", phone='" + phone + '\'' +
                '}';
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getRegistTime() {
        return registTime;
    }

    public void setRegistTime(Date registTime) {
        this.registTime = registTime;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
