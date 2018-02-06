package com.example.stumanage.service;

import com.example.stumanage.vo.TbStudentCourseVo;

import java.util.List;

/**
 *学生课程成绩service接口
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

public interface StudentCourseService {

    /**
     * 根据id查找课程信息
     * @param id
     * @return
     */
    TbStudentCourseVo findById(Integer id);


    /**
     * 查找一个学生的全部课程并分页
     * @param record
     * @param record
     * @return
     */
    List<TbStudentCourseVo> findByStuId(TbStudentCourseVo record);

    /**
     * 添加课程
     * @param tbStudentCourseVo
     */
    void saveCourse(TbStudentCourseVo tbStudentCourseVo);

    /**
     * 修改课程信息和添加成绩等
     * @param tbStudentCourseVo
     */
    void editCourse(TbStudentCourseVo tbStudentCourseVo);


    void del(Integer id);
}
