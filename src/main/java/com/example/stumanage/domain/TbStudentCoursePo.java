package com.example.stumanage.domain;

import lombok.Data;

import java.util.Date;


/**
 *学生课程成绩表Po
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

@Data
public class TbStudentCoursePo {

    /**
     * id
     */
    private Integer id;

    /**
     * 学号
     */
    private String stuId;

    /**
     * 课程名称
     */
    private  String courseName;

    /**
     * 任课老师
     */
    private  String teacher;

    /**
     * 成绩
     */
    private  String grade;

    /**
     * 成绩分析
     */
    private  String analyze;
    /**
     * 创建时间
     */
    private Date createdTime;

    /**
     *创建人
     */
    private String createdBy;

    /**
     * 修改人
     */
    private String modifiedBy;

    /**
     * 修改时间
     */
    private Date modifiedTime;
}
