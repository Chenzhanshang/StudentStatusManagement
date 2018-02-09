package com.example.stumanage.domain;

import lombok.Data;

import java.util.Date;


/**
 *学生学籍信息表Po
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

@Data
public class TbStudentInfoPo {

    /**
     * id
     */
    private Integer id;

    /**
     * 姓名
     */
    private String stuName;

    /**
     * 性别
     */
    private  String sex;

    /**
     * 身份证号
     */
    private  String cardId;

    /**
     * 民族
     */
    private  String nation;


    /**
     * 籍贯
     */
    private  String nativePlace;

    /**
     * 出生地
     */
    private  String birthPlace;

    /**
     * 政治面貌
     */
    private  String politicsStatus;

    /**
     * 婚否
     */
    private  String weddingStatus;

    /**
     * 学籍状态
     */
    private  String schoolStatus;

    /**
     * 入学时间
     */

    private  Date schoolTime;

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
