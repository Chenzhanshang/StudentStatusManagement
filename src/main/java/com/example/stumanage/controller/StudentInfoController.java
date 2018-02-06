package com.example.stumanage.controller;

import com.example.stumanage.service.StudentInfoService;
import com.example.stumanage.vo.TbStudentInfoVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 学生学籍信息控制器
 * @author: zhangzengke
 * @date: 2018/2/1
 **/
@Controller
@RequestMapping("/info")
public class StudentInfoController {

    @Resource
    private StudentInfoService studentInfoService;

    @RequestMapping("/list")
    public String getIndex(){
        return "/stumanage/info";
    }

    @RequestMapping("/turnSchool")
    public String turnSchool(){
        return "/stumanage/school";
    }
    /**
     * 身份证号查学籍
     */

    @GetMapping("/findByCardId/{cardId}")
    public String findByCardId(@PathVariable String cardId,Model model) {
        TbStudentInfoVo tbStudentInfoVo = studentInfoService.findByCardId(cardId);

        model.addAttribute("student",tbStudentInfoVo);

        return "/stumanage/school";
    }


}
