package com.example.stumanage.service;

import com.example.stumanage.vo.TbAdminVo;

import java.util.List;

/**
 * 管理员service接口
 */
public interface AdminService {


    /**
     * 注册管理员
     * @param tbAdminVo
     */
    void saveAdmin(TbAdminVo tbAdminVo);

    /**
     * 删除管理员账户
     * @param id
     */
    void delAdmin(Integer id);

    /**
     * 修改管理员信息
     * @param tbAdminVo
     */
    void updateAdmin(TbAdminVo tbAdminVo);

    /**
     * 根据账号查找管理员
     * @param userName
     * @return
     */
    TbAdminVo findByUserName(String userName);

    List<TbAdminVo> findByAll(TbAdminVo record);
}
