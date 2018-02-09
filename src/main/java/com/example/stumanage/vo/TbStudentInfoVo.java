package com.example.stumanage.vo;

import com.example.stumanage.common.PageVo;

import java.util.Date;


/**
 *学生学籍信息表Vo
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

public class TbStudentInfoVo extends PageVo {

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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    public String getBirthPlace() {
        return birthPlace;
    }

    public void setBirthPlace(String birthPlace) {
        this.birthPlace = birthPlace;
    }

    public String getPoliticsStatus() {
        return politicsStatus;
    }

    public void setPoliticsStatus(String politicsStatus) {
        this.politicsStatus = politicsStatus;
    }

    public String getWeddingStatus() {
        return weddingStatus;
    }

    public void setWeddingStatus(String weddingStatus) {
        this.weddingStatus = weddingStatus;
    }

    public String getSchoolStatus() {
        return schoolStatus;
    }

    public void setSchoolStatus(String schoolStatus) {
        this.schoolStatus = schoolStatus;
    }

    public Date getSchoolTime() {
        return schoolTime;
    }

    public void setSchoolTime(Date schoolTime) {
        this.schoolTime = schoolTime;
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
}
