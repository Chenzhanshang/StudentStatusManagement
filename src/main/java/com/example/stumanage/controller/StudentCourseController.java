package com.example.stumanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 学生课程控制器
 * @author: zhangzengke
 * @date: 2018/2/1
 **/
@Controller
@RequestMapping("/course")
public class StudentCourseController {

    @RequestMapping("/list")
    public String getIndex(){
        return "/stumanage/course";
    }
}
