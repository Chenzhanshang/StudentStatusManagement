package com.example.stumanage.vo;

import com.example.stumanage.common.PageVo;
import lombok.Data;

import java.util.Date;
import java.util.List;


/**
 *学生机构Vo
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

@Data
public class TbStudentSchoolVo extends PageVo {

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

    /**
     * 课程信息
     */
    List<TbStudentCourseVo> list;
}
