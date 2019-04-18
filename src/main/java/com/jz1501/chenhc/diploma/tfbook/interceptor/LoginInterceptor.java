package com.jz1501.chenhc.diploma.tfbook.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    /**
     * 拦截请求
     * @param request
     * @param response
     * @param o
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String access = "";
        String ClazzName = o.toString();
        String[] strs = ClazzName.split(" ");
        String methodName = strs[2];
        String str1 = "com.jz1501.chenhc.diploma.tfbook.controller.UserController.myFavoriteBooks(javax.servlet.http.HttpSession,org.springframework.ui.Model)";
        String str2 = "com.jz1501.chenhc.diploma.tfbook.controller.ShoppingCartController.checkoutOrder(javax.servlet.http.HttpSession)";
        String str3 = "com.jz1501.chenhc.diploma.tfbook.controller.ShoppingCartController.checkoutOrder(java.lang.String,java.lang.Integer,javax.servlet.http.HttpSession)";
        String str4 = "com.jz1501.chenhc.diploma.tfbook.controller.UserController.addBookToWishList(java.lang.String,javax.servlet.http.HttpSession)";
        System.out.println("methodName" + methodName);
        if (str2.equals(methodName) || str3.equals(methodName)) {
            access = "checkorder";
        } else if (str1.equals(methodName) || str4.equals(methodName)) {
            access = "wish";
        }
        //获取session
        HttpSession session = request.getSession(true);
        Object loginFlag = session.getAttribute("CurrentUser");
        if (loginFlag == null) {//用户没有登录
            Object wishFlag = session.getAttribute("wishFlag");
            Object forceLogin = session.getAttribute("forceLogin");

            if ("wish".equals(access)) {
                session.setAttribute("wish_To_login", "toWish");
                response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
                return false;
            } else if ("checkorder".equals(access)) {
                //终止请求，并重定向到登录界面
                session.setAttribute("forceLogin", "toAddress");
                response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
                return false;
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
                return false;
            }

        } else {
            return true;
        }
    }

    /**
     * 拦截响应
     *
     * @param request
     * @param response
     * @param o
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {

    }

    /**
     * 异常处理
     *
     * @param request
     * @param response
     * @param o
     * @param e
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {

    }
}
