package com.example.stumanage.domain;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import javax.validation.constraints.Max;
import java.util.Date;

/**
 * 管理员实体类Po
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

@Data
public class TbAdminPo {
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
    @Max(12)
    private String userName;

    /**
     * 管理员密码
     */
    @Max(12)
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
}
