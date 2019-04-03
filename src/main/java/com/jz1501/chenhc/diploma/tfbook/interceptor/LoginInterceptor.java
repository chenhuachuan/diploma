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
     *
     * @param request
     * @param response
     * @param o
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //获取session
        HttpSession session = request.getSession(true);
        Object loginFlag = session.getAttribute("CurrentUser");
        if (loginFlag == null) {
            //终止请求，并重定向到登录界面
            session.setAttribute("forceLogin", "yes");
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return false;
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
