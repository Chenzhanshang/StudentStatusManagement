package com.example.stumanage.vo;

import com.example.stumanage.common.PageVo;

import java.util.Date;

/**
 * 管理员实体类Vo
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

public class TbAdminVo extends PageVo {
    /**
     * id
     */
    private Integer id;

    /**
     *管理员姓名
     */
    private String nickName;

    /**
     * 管理员账号
     */
    private String userName;

    /**
     * 管理员密码
     */
    private String passWord;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 创建时间
     */
    private Date createdTime;

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

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
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
