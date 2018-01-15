package com.example.stumanage.service.impl;


import com.example.stumanage.dao.StuMapper;
import com.example.stumanage.domin.Student;
import com.example.stumanage.domin.User;
import com.example.stumanage.service.StuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import javax.xml.transform.Templates;
import java.io.Console;
import java.util.List;


/**
 * describe: TODO
 * creat_user: bbt_zhangzk
 * creat_date: 2018/1/4
 * creat_time: 14:15
 **/
@Slf4j
@Service
public class StuServiceImpl implements StuService{

    @Autowired
    private StuMapper stuMapper;

    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public List<Student> findAll() {
        return stuMapper.findAll();
    }

    @Override
    public Student findById(String stuId){


        boolean flag = redisTemplate.hasKey(stuId);
        ValueOperations<String,Student> ops = redisTemplate.opsForValue();

        if (flag){
            return ops.get(stuId);
        }
        Student result =stuMapper.findById(stuId);

        try {
            ops.set(stuId,result);
        }catch (Exception e){
            e.printStackTrace();
        }

       return result;
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
