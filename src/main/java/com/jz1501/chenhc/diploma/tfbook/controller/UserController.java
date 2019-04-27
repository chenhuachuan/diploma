package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.User;
import com.jz1501.chenhc.diploma.tfbook.entity.WishList;
import com.jz1501.chenhc.diploma.tfbook.service.UserService;
import com.jz1501.chenhc.diploma.tfbook.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
    @Autowired
    private WishListService wishListService;

    /**
     * 用户注册
     *
     * @param user
     * @param session
     * @return
     */
    @RequestMapping(value = "/userRegist", method = RequestMethod.POST)
    public String userRegistByInput(User user, HttpSession session) {
        try {
            userService.regist(user);
            session.setAttribute("CurrentUser", user);
            session.setAttribute("loginFlag", "true");
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
                Object forceLoginFlag = session.getAttribute("forceLogin");
                Object wish_To_login = session.getAttribute("wish_To_login");
                Object order_To_login = session.getAttribute("order_To_login");

                session.setAttribute("CurrentUser", dbUser);
                session.setAttribute("wishFlag", "loginsuccess");
                if ("toAddress".equals(forceLoginFlag) && forceLoginFlag != null) {
                    //去结算
                    return "forward:/cart/purchase/checkOrder.do";
                } else if ("toWish".equals(wish_To_login)) {
                    //去收藏
                    return "forward:/user/person/favoriteBooks.do";
                } else if ("toOrderList".equals(order_To_login)) {
                    //我的订单
                    return "forward:/cart/purchase/userOrderListInfo.do";
                } else {
                    session.setAttribute("loginErrorInfo", "登录成功！");
                    return "forward:/pages/home.jsp";//去首页
                }
            } else {
                //密码错误
                session.setAttribute("loginErrorInfo", "亲，密码输入错误！");
                return "redirect:/pages/login.jsp";
            }
        } else {
            session.setAttribute("loginErrorInfo", "亲，请核对邮箱地址！");
            return "redirect:/pages/login.jsp";
        }
    }

    @RequestMapping(value = "/logout")
    public String userLogOut(HttpSession session) {
        session.removeAttribute("CurrentUser");
        session.removeAttribute("loginErrorInfo");
        session.removeAttribute("forceLogin");
        session.removeAttribute("wish_To_login");
        session.removeAttribute("wishFlag");
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


    /**
     * 个人收藏
     *
     * @return
     */
    @RequestMapping("/person/favoriteBooks")
    public String myFavoriteBooks(HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("CurrentUser");
        List<WishList> wishLists = wishListService.queryAllWishListByUserId(currentUser.getUserId());
        model.addAttribute("wishBooks", wishLists);
        model.addAttribute("wishCount", wishLists.size());
        return "forward:/pages/wishlist.jsp";
    }

    //添加收藏
    @RequestMapping("/person/addWishBook")
    public String addBookToWishList(String bookId, HttpSession session) {
        WishList dbbook = wishListService.queryWishBookByBookId(bookId);
        if (dbbook != null) {
            return "forward:/user/person/favoriteBooks.do";
        } else {
            User currentUser = (User) session.getAttribute("CurrentUser");
            WishList wishList = new WishList();
            wishList.setCollectId(UUID.randomUUID().toString().replace("-", ""));
            wishList.setBookId(bookId);
            wishList.setCollectTime(new Date());
            wishList.setUserId(currentUser.getUserId());
            wishList.setStatus("1");
            wishListService.addNewBookWishList(wishList);
            return "forward:/user/person/favoriteBooks.do";
        }
    }

    @RequestMapping("/person/removeWishBook")
    public String removeBookFromWishList(String collectId, HttpSession session) {
        User currentUser = (User) session.getAttribute("CurrentUser");
        wishListService.removeWishBookById(collectId, currentUser.getUserId());
        return "forward:/user/person/favoriteBooks.do";
    }

}
