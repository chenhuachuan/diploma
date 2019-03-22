package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.User;
import com.jz1501.chenhc.diploma.tfbook.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * @author 陈华川
 * @version v1.0.0
 * 用户模块
 * @since 2019.03
 */
@Controller
@RequestMapping("/user")
public class UserController extends PropertiesEditor {

    @Autowired
    private UserService userService;

    /**
     * 用户注册
     *
     * @param user
     * @param session
     * @return
     */
    @RequestMapping(value = "/userRegist", method = RequestMethod.POST)
    public String userRegistByInput(User user, HttpSession session) {
        //User{userId='null', userName='风清扬', password='dsaf', email='chenhc@163.com', salt='null', status='null',
        // registTime=null, sex='m', birthdate=null, phone='15214202610'}
        try {
            userService.regist(user);
            session.setAttribute("CurrentUser", user);
            return "redirect:/pages/home.jsp";
        } catch (Exception e) {
            return "redirect:/pages/regist.jsp";
        }
    }

    /**
     * 用户登录
     *
     * @param email
     * @param password
     * @param session
     * @return String
     */
    @RequestMapping(value = "/userLogin", method = RequestMethod.POST)
    public String userLoginByEmailAndPassword(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session) {
        session.removeAttribute("loginErrorInfo");
        Boolean email_exist = userService.emailIsExists(email);
        if (email_exist) {
            //邮箱存在
            User dbUser = userService.login(email, password);
            if (dbUser != null) {
                session.setAttribute("CurrentUser", dbUser);
                session.setAttribute("loginErrorInfo", "登录成功！");
                return "forward:/pages/home.jsp";
            } else {
                //密码错误
                session.setAttribute("loginErrorInfo", "亲，密码输入错误！");
                return "redirect:/pages/home.jsp";
            }
        } else {
            session.setAttribute("loginErrorInfo", "亲，请核对邮箱地址！");
            return "redirect:/pages/home.jsp";
        }
    }

    @RequestMapping(value = "/logout")
    public String userLogOut(HttpSession session) {
        session.removeAttribute("CurrentUser");
        return "redirect:/pages/home.jsp";
    }

    @RequestMapping("/emailExists")
    public String checkEmailExists(String email) {
        Boolean emailIsExist = userService.emailIsExists(email);
        if (emailIsExist) {
            return "yes";
        } else {
            return "no";
        }
    }

}
