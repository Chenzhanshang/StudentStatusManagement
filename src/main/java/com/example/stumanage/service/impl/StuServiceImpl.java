package com.example.stumanage.service.impl;


import com.example.stumanage.dao.StuMapper;
import com.example.stumanage.pojo.Student;
import com.example.stumanage.service.StuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.ws.Response;
import java.util.List;


/**
 * describe: TODO
 * creat_user: bbt_zhangzk
 * creat_date: 2018/1/4
 * creat_time: 14:15
 **/
@Service
public class StuServiceImpl implements StuService{

    @Autowired
    private StuMapper stuMapper;

    @Override
    public List<Student> findAll() {
        return stuMapper.findAll();
    }

    @Override
    public Student findById(String stuId){

       return stuMapper.findById(stuId);
    }

    @Override
    public String  saveStu(Student stu){

        try {
         stuMapper.saveStu(stu);
        }catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
            return "ok";
    }

    @Override
    public void updateStu(Student stu) {

        stuMapper.updateStu(stu);

    }

    @Override
    public void delStu(String id) {

        stuMapper.delStu(id);

    }

    @Override
    public List<Student> findByID(String id) {
        System.out.println(stuMapper.findByID(id));

        return stuMapper.findByID(id);

    }
}
