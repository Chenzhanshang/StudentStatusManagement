package com.example.stumanage.controller;


import com.example.stumanage.vo.TbAdminVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 管理员跳转
 * @author: zhangzengke
 * @date: 2018/2/1 
 **/
@RequestMapping("/admin")
@Controller
public class AdminController {

    @GetMapping("/list")
    public String getIndex(){
        return "/stumanage/admin";
    }

    @GetMapping("/setting")
    public String getSetting(HttpServletRequest request){
       TbAdminVo tbAdminVo= (TbAdminVo)request.getSession().getAttribute("tbAdmin");
        String admin="admin";
       if((tbAdminVo.getUserName().equals(admin))){
            return "/stumanage/setting";
        }
        return "/stumanage/settings";
    }

    @GetMapping("/index")
    public String index(){
        return "/index";
    }

    @GetMapping("/login")
    public String login(){
        return "/login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request){

        request.getSession().removeAttribute("tbAdmin");
        return "redirect: /login";
    }
}
