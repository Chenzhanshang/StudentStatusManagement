package com.example.stumanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 其他设置控制器
 * @author: zhangzengke
 * @date: 2018/2/1
 **/
@Controller
@RequestMapping("/other")
public class StudentotherController {

    @RequestMapping("/list")
    public String getIndex(){
        return "/stumanage/other";
    }

}
