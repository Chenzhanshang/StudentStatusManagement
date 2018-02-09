package com.example.stumanage.domain;

import lombok.Data;

import java.util.Date;


/**
 *学生机构Po
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

@Data
public class TbStudentSchoolPo {

    /**
     * id
     */
    private Integer id;

    /**
     * 学号
     */
    private String stuId;

    /**
     * 姓名
     */
    private  String stuName;

    /**
     * 身份证号
     */
    private  String cardId;

    /**
     * 学院
     */
    private  String academy;


    /**
     * 系
     */
    private  String department;

    /**
     * 班
     */
    private  String clazz;

    /**
     * 综合评定奖惩机制
     */
    private  String experience;

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
