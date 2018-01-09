package com.example.stumanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * describe: 首页跳转控制器
 * @author: bbt_zhangzk
 * @date: 2018/1/8  12:00
 **/


@RequestMapping("/page")
@Controller
public class IndexController {
    /**
     * 首页跳转
     */
    @RequestMapping("/index")
    public String getIndex() {
        return "index";
    }

    /**
     * 学院跳转
     */
    @RequestMapping("/academy")
    public String getAcademy() {
        return "academy";
    }

    /**
     * 学籍跳转
     */
    @RequestMapping("/student")
    public String getStudent() {
        return "student";
    }

    /**
     * 课程跳转
     */
    @RequestMapping("/course")
    public String getCourse() {
        return "course";
    }

    /**
     * 成绩跳转
     */
    @RequestMapping("/grade")
    public String getGrade() {
        return "grade";
    }

    /**
     * 系统跳转
     *
     * @return String
     */
    @RequestMapping("/sys")
    public String getSys() {
        return "sys";
    }

}
