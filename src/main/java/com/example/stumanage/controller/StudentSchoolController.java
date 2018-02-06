package com.example.stumanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 学生机构控制器
 * @author: zhangzengke
 * @date: 2018/2/1
 **/
@Controller
@RequestMapping("/school")
public class StudentSchoolController {

    @RequestMapping("/list")
    public String getIndex(){
        return "/stumanage/school";
    }
}
