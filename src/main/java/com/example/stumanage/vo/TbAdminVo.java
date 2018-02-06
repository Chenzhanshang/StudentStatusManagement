package com.example.stumanage.vo;

import com.example.stumanage.common.PageVo;
import lombok.Data;

import java.util.Date;

/**
 * 管理员实体类Vo
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

@Data
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
}
