package com.example.stumanage.service.impl;

import com.example.stumanage.common.AssertUtils;
import com.example.stumanage.domain.TbAdminPo;
import com.example.stumanage.mapper.AdminMapper;
import com.example.stumanage.service.AdminService;
import com.example.stumanage.vo.TbAdminVo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

/**
 * 管理员实现类
 *
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    private void inputCheck(TbAdminVo tbAdminVo) {
        AssertUtils.hasText(tbAdminVo.getNickName(), "真实姓名不能为空");
        AssertUtils.hasText(tbAdminVo.getUserName(), "账号不能为空");
        AssertUtils.hasText(tbAdminVo.getPassWord(), "密码不能为空");
        AssertUtils.hasText(tbAdminVo.getPhone(), "手机号不能为空");
    }

    @Override
    public void saveAdmin(TbAdminVo tbAdminVo) {

        inputCheck(tbAdminVo);
        TbAdminPo tbAdminPo = new TbAdminPo();
        BeanUtils.copyProperties(tbAdminVo, tbAdminPo);
        adminMapper.saveAdmin(tbAdminPo);
    }

    @Override
    public void delAdmin(Integer id) {

        adminMapper.delAdmin(id);
    }

    @Override
    public void updateAdmin(TbAdminVo tbAdminVo) {
        inputCheck(tbAdminVo);
        TbAdminPo tbAdminPo = new TbAdminPo();
        BeanUtils.copyProperties(tbAdminVo, tbAdminPo);
        adminMapper.updateAdmin(tbAdminPo);
    }

    /**
     * 根据账号查询管理员
     * 显示管理员名字和注册查重用
     * @param userName
     * @return
     */
    @Override
    public TbAdminVo findByUserName(String userName) {

        TbAdminPo tbAdminPo=adminMapper.findByUserName(userName);
        if (tbAdminPo==null){
            return null;
        }
        TbAdminVo tbAdminVo = new TbAdminVo();
        BeanUtils.copyProperties(tbAdminPo,tbAdminVo);
        return tbAdminVo;
    }
}
