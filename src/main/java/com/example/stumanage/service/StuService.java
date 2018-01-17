package com.example.stumanage.service;


import com.example.stumanage.domain.Student;

import java.util.List;


/**
 * describe: 学籍信息service接口
 * creat_user: bbt_zhangzk
 * creat_date: 2018/1/4
 * creat_time: 14:15
 **/
public interface StuService {
   List<Student> findAll();

   Student findById(String stuId);

   List<Student> findByID(String id);

   String saveStu(Student stu);

   void updateStu(Student stu);

   void delStu(String id);

}
