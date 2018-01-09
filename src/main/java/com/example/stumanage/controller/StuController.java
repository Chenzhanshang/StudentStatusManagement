package com.example.stumanage.controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.example.stumanage.pojo.Student;
import com.example.stumanage.service.StuService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.Console;
import java.util.List;

/**
 * describe: 学生学籍信息控制器
 *
 * @author: bbt_zhangzk
 * @date: 2018/1/8  11:41
 **/

@RestController
@RequestMapping("/student")
public class StuController {

    @Resource
    private StuService stuService;

    /**
     * 查找全部学生信息
     *
     * @return List<Student>
     */
    @RequestMapping("/findall")
    public List<Student> findAll() {
        return stuService.findAll();
    }

    /**
     * 编号查找学生
     *
     * @param idv 编号
     * @return List<Student>
     */
    @RequestMapping("/findByID")
    public List<Student> findByID(@RequestParam String idv) {

        List<Student> list = stuService.findByID(idv);
        return list;
    }

    /**
     * 学号查找学生
     *
     * @param stuId 编号
     * @return student
     */
    @RequestMapping("/find/{stuId}")
    public Student findById(@PathVariable String stuId) {
        return stuService.findById(stuId);
    }


    @PostMapping(value = "/save")
    public String saveStu(@RequestBody Student student) {
        try {
            stuService.saveStu(student);
        } catch (Exception e) {

            return "false";
        }
        return "ok";
    }

    /**
     * 修改学生信息
     *
     * @param id      编号
     * @param name    姓名
     * @param stuId   学号
     * @param sex     性别
     * @param age     年龄
     * @param address 地址
     * @param idCard  身份证号
     */
    @RequestMapping("/update")
    public void updateStu(@RequestParam Integer id, String name, String stuId, String sex, Integer age, String address, String idCard) {
        Student student = new Student();
        student.setId(id);
        student.setName(name);
        student.setAge(age);
        student.setAddress(address);
        student.setIdCard(idCard);
        student.setSex(sex);
        student.setStuId(stuId);

        stuService.updateStu(student);
    }

    /**
     * 删除学生信息
     *
     * @param id 编号
     */
    @RequestMapping("/delete")
    public void delStu(@RequestParam String id) {
        stuService.delStu(id);
    }
}
