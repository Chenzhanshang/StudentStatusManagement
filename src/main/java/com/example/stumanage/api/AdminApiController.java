package com.example.stumanage.api;

import com.example.stumanage.service.AdminService;
import com.example.stumanage.common.ResponseResult;
import com.example.stumanage.vo.TbAdminVo;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;

/**
 * 管理员api
 * @author: zhangzengke
 * @date: 2018/2/1
 **/

@RequestMapping("api/admin")
@RestController
public class AdminApiController {

    @Resource
    private AdminService adminService;

    @PostMapping("/register")
    public ResponseResult saveAdmin(@RequestBody TbAdminVo tbAdminVo){

        adminService.saveAdmin(tbAdminVo);

        return new ResponseResult();
    }

    @GetMapping("/find")
    public  ResponseResult<TbAdminVo> findByUserName(@RequestParam String userName){
        TbAdminVo tbAdminVo = adminService.findByUserName(userName);

        return  new ResponseResult<>(tbAdminVo);
    }

    @PostMapping("/update")
    public ResponseResult updateAdmin(@RequestBody TbAdminVo tbAdminVo){
        adminService.updateAdmin(tbAdminVo);

        return new ResponseResult();
    }

    @GetMapping("/del")
    public ResponseResult delAdmin(@RequestParam Integer id){
        adminService.delAdmin(id);

        return new ResponseResult();
    }




}
