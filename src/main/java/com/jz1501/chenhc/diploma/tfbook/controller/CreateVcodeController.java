package com.jz1501.chenhc.diploma.tfbook.controller;


import com.jz1501.chenhc.diploma.tfbook.util.CreateValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/code")
public class CreateVcodeController {

    @RequestMapping("/getVcode")
    public void create(HttpSession session, HttpServletResponse response) throws IOException {
        //1.创建工具对象，并生成验证码
        CreateValidateCode vCode = new CreateValidateCode(100, 30, 4, 10);

        //2.保存在Session作用域
        session.setAttribute("code", vCode.getCode());

        //3.使用response获得指向客户端的流对象，并输出
        vCode.write(response.getOutputStream());
    }

    @RequestMapping("/checkCode")
    public @ResponseBody
    String checkCode(@RequestParam("clientCode") String clientCode, HttpSession session) {

        String code = (String) session.getAttribute("code");

        if (code.equals(clientCode)) {
            return "OK";
        } else {
            return "<font style='color:red;'>ERROR</font>";
        }


    }

}
