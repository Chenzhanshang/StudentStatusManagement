package com.example.stumanage.mapper;

import com.example.stumanage.domain.TbAdminPo;
import com.example.stumanage.vo.TbAdminVo;
import com.example.stumanage.vo.TbStudentInfoVo;

import java.util.List;

/**
 * 管理员映射接口
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

public interface AdminMapper {

    /**
     * 注册管理员
     * @param tbAdminPo
     */
    void saveAdmin(TbAdminPo tbAdminPo);

    /**
     * 删除管理员账户
     * @param id
     */
    void delAdmin(Integer id);

    /**
     * 修改管理员信息
     * @param tbAdminPo
     */
    void updateAdmin(TbAdminPo tbAdminPo);

    /**
     * 根据账号查找管理员
     * @param userName
     * @return
     */
    TbAdminPo findByUserName(String userName);

    List<TbAdminVo> findByAll(TbAdminVo record);
}
