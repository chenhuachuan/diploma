package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.*;
import com.jz1501.chenhc.diploma.tfbook.service.AddressService;
import com.jz1501.chenhc.diploma.tfbook.service.CascadingService;
import com.jz1501.chenhc.diploma.tfbook.service.UserService;
import com.jz1501.chenhc.diploma.tfbook.service.WishListService;
import com.whalin.MemCached.MemCachedClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.*;

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
    @Autowired
    private AddressService addressService;
    @Autowired
    private CascadingService cascadingService;
    @Autowired
    private MemCachedClient memCachedClient;
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

    @RequestMapping("/adminRegist")
    @ResponseBody
    public String adminRegist(@RequestParam("adminName") String adminName,
                              @RequestParam("password") String password,
                              @RequestParam("email") String email) {
        try {
            User user = new User();
            user.setUserName(adminName);
            user.setPassword(password);
            user.setEmail(email);
            userService.adminRegist(user);
          /*  session.setAttribute("admin", user);
            session.setAttribute("adminLoginFlag", "true");*/
            //session.setAttribute("check_admin_status", "regist_success_toLogin");
            //return "redirect:/bgpages/main.jsp";
            return "regist_success";
        } catch (Exception e) {
            //session.setAttribute("check_admin_status", "regist_fail_toRegist");
//            return "redirect:/bgpages/main.jsp";
            return "regist_fail";
        }
    }

    /**
     * 用户登录
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
            if ("0".equals(dbUser.getStatus())) {
                session.setAttribute("loginErrorInfo", "账号被禁用，请联系管理员！");
                return "redirect:/pages/login.jsp";
            }
            if (dbUser != null) {
                Object forceLoginFlag = session.getAttribute("forceLogin");
                Object wish_To_login = session.getAttribute("wish_To_login");
                Object order_To_login = session.getAttribute("order_To_login");
                Object center_To_login = session.getAttribute("center_To_login");

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
                } else if ("to_peraonal_center".equals(center_To_login)) {
                    //个人中心
                    return "forward:/user/person/personalCenter.do";
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

    @RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
    @ResponseBody
    public String adminLogin(@RequestParam("adminName") String adminName, @RequestParam("password") String password, HttpSession session) {
        User admin = userService.adminLogin(adminName, password);
        if (admin != null) {
            session.setAttribute("CurrentAdmin", admin);
            session.setAttribute("admin_login_time", new Date());
            System.out.println("----admin_login-----");
            return "login_success";//redirect:/bgpages/main.jsp
        } else {
            //session.setAttribute("check_admin_status","login_fail_toReLogin");
            System.out.println("----adminName:" + adminName + "," + "--loginFail----");
            return "login_fail";
        }
    }


    @RequestMapping(value = "/logout")
    public String userLogOut(HttpSession session) {
        session.removeAttribute("CurrentUser");
        session.removeAttribute("loginErrorInfo");
        session.removeAttribute("forceLogin");
        session.removeAttribute("wish_To_login");
        session.removeAttribute("wishFlag");
        session.removeAttribute("showCart");
        session.removeAttribute("checkOrder");
        session.removeAttribute("totalMoney");
        session.removeAttribute("perMoney");
        session.removeAttribute("OrderInfo");

        session.removeAttribute("AddressInfo");
        session.removeAttribute("totalCartCount");
        session.removeAttribute("findPwdStatus");
        session.removeAttribute("loginFlag");
        memCachedClient.flushAll();
        //session.invalidate();//清除所有
        return "redirect:/pages/home.jsp";
    }

    @RequestMapping(value = "/logout_admin")
    @ResponseBody
    public String AdminLogOut(HttpSession session) {
        session.removeAttribute("bg_hotBooks1");
        session.removeAttribute("newBookShelvesBG");
        session.removeAttribute("orderCount");
        session.removeAttribute("userCount");
        session.removeAttribute("recordCount");
        session.removeAttribute("orderInfoStaties");
        session.removeAttribute("booksInfoStaties");
        session.removeAttribute("userInfoStaties");
        session.removeAttribute("CurrentAdmin");
        session.removeAttribute("admin_login_time");
        memCachedClient.flushAll();
        //session.invalidate();//清除所有  bgpages/main.jsp
        return "success_logout";
    }

    @RequestMapping("/emailExists")
    @ResponseBody
    public String checkEmailExists(String email) {
        Boolean emailIsExist = userService.emailIsExists(email);
        if (emailIsExist) {
            return "yes";
        } else {
            return "no";
        }
    }

    @RequestMapping("/findUserPdw")
    public String findUserPdw(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session) {
        User user = userService.selectUserByEmail(email);
        try {
            userService.findOrUpdatePwd(user.getUserId(), password);
            session.setAttribute("findPwdStatus", "success");
            return "redirect:/pages/login.jsp";
        } catch (Exception e) {
            session.setAttribute("findPwdStatus", "fail");
            return "redirect:/pages/login.jsp";
        }
    }


    /**
     * 个人收藏
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


    @RequestMapping("/showAllUsersInfo")
    @ResponseBody
    public Map<String, Object> showAllUsersInfo(Integer rows, Integer page) {
        Map<String, Object> map = new HashMap<String, Object>();
        Integer totalCount = userService.queryUserTotalCount();
        List<User> users = userService.queryAllUsersInfo(rows, page);
        map.put("total", totalCount);
        map.put("rows", users);
        return map;
    }

    @RequestMapping("/queryUsersBySearch_bg")
    @ResponseBody
    public Map<String, Object> queryAllUserBySearchBg(Integer rows, Integer page, String search) {
        Map<String, Object> map = new HashMap<String, Object>();
        Integer totalCount = 1;
        List<User> users = null;
        if (search == null) {
            totalCount = userService.queryUserTotalCount();
            users = userService.queryUsersBySearch(rows, page, "");
        } else {
            totalCount = userService.queryUsersBySearchTotalCount(search);
            users = userService.queryUsersBySearch(rows, page, search);
        }

        map.put("total", totalCount);
        map.put("rows", users);
        return map;
    }

    //禁用
    @RequestMapping("/forbidCurrentUser")
    @ResponseBody
    public String forbidCurrentUser(String userId, String status) {
        System.out.println("------forbidCurrentUser--" + userId + "------------" + status + "-----------");
        try {
            userService.forbidUser(userId, status);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    /**
     * 个人中心
     *
     * @return
     */
    @RequestMapping("/person/personalCenter")
    public String personalCenter(HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("CurrentUser");
        User userInfo = userService.selectUserByEmail(currentUser.getEmail());
        //地址信息
        List<Address> categoryAddr = addressService.queryAddressByUserId(currentUser.getUserId());
        model.addAttribute("allAddrSort", categoryAddr);
        model.addAttribute("userInfo_p", userInfo);
        return "forward:/pages/personalCenter.jsp";
    }

    @RequestMapping("/updateUserInfo")
    public String updateUserInfo(User user, HttpSession session) {
        User currentUser = (User) session.getAttribute("CurrentUser");
        user.setUserId(currentUser.getUserId());
        try {
            userService.modifyUserInfo(user);
            System.out.println("__________修改用户信息成功:" + user);
        } catch (Exception e) {
            System.out.println("__________修改用户信息失败:" + user);
            throw new RuntimeException("修改用户信息失败");
        }
        return "forward:/user/person/personalCenter.do";
    }


    /**
     * 根据地址昵称查询一条地址
     *
     * @param nickAddrId
     * @param session
     * @return
     */
    @RequestMapping("/queryOneAddress")
    @ResponseBody
    public Address queryOneAddressByNickId(String nickAddrId, HttpSession session) {
        User currentUser = (User) session.getAttribute("CurrentUser");
        Address addresses = addressService.queryAddressById(currentUser.getUserId(), nickAddrId);
        return addresses;
    }

    //修改收货地址
    @RequestMapping("/person/showOrUpdateAddress")
    public String addAddressOrUpdateAddress(Address address, HttpSession session) {
        User currentUser = (User) session.getAttribute("CurrentUser");
        //根据这两个id查数据库，匹配各个字段是否和数据库一致
        Address completeAddress = getCompleteAddress(address);//去掉页面的其他符号
        Address dbAddress = addressService.queryAddressById(address.getUserId(), completeAddress.getNickAddrId());

        //判断地址是否是新地址
        if (completeAddress.getAddressId() == "" && "new".equals(completeAddress.getNickAddrId())) {
            //新地址  入库
            if (completeAddress.getNickAddrName() == "" || "".equals(completeAddress.getNickAddrName())) {
                completeAddress.setNickAddrName("地址:" + completeAddress.getProvNameAddr());//地址别名：
            }
            completeAddress.setNickAddrId("");
            completeAddress.setUserId(currentUser.getUserId());
            addressService.addNewAddress(address);
            System.out.println("__________新地址入库成功:" + address);
            return "forward:/user/person/personalCenter.do";
        } else if (!completeAddress.equals(dbAddress)) {
            //修改了地址  入库
            addressService.modifyAddress(address);
            System.out.println("__________修改地址成功:" + address);
            return "forward:/user/person/personalCenter.do";
        } else {
            System.out.println("__________无操作:" + address);
            return "forward:/user/person/personalCenter.do";
        }
    }

    //去掉地址中的,
    private Address getCompleteAddress(Address address) {
        String nickAddrId = "";
        String nickAddrs[] = address.getNickAddrId().split(",");
        if (nickAddrs.length > 0) {
            nickAddrId = nickAddrs[0] != "" ? nickAddrs[0] : nickAddrs[1];
        }

        address.setNickAddrId(nickAddrId);
        address.setNickAddrName(address.getNickAddrName().replace(",", ""));
        address.setProvNameAddr(address.getProvNameAddr().replace(",", ""));
        address.setCityNameAddr(address.getCityNameAddr().replace(",", ""));
        address.setAreaNameAddr(address.getAreaNameAddr().replace(",", ""));

        if (address.getAddressId() == "") {
            //旧地址
            Province province = cascadingService.queryProvNameByCode(address.getProvNameAddr());
            City city = cascadingService.queryCityNameByCode(address.getCityNameAddr());
            Area area = cascadingService.queryAreaNameByCode(address.getAreaNameAddr());

            address.setProvNameAddr(province.getProvName());
            address.setCityNameAddr(city.getCityName());
            address.setAreaNameAddr(area.getAreaName());
        }
        return address;
    }


}
