package com.example.stumanage.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.example.stumanage.common.PageVo;
import lombok.Data;

import java.util.Date;
import java.util.List;


/**
 *学生机构Vo
 * @author: zhangzengke
 * @date: 2018/1/31
 **/


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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getAcademy() {
        return academy;
    }

    public void setAcademy(String academy) {
        this.academy = academy;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public List<TbStudentCourseVo> getList() {
        return list;
    }

    public void setList(List<TbStudentCourseVo> list) {
        this.list = list;
    }
}
