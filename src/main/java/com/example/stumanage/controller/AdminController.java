package com.example.stumanage.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
