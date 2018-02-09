package com.example.stumanage.api;

import com.example.stumanage.service.AdminService;
import com.example.stumanage.common.ResponseResult;
import com.example.stumanage.vo.TbAdminVo;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

    @PostMapping("/find")
    public  ResponseResult<String> findByUserName(@RequestBody TbAdminVo tbAdminVo, HttpServletRequest request){
        TbAdminVo result = adminService.findByUserName(tbAdminVo.getUserName());
        if(result == null){
            return  new ResponseResult<>(1001,"没有该账号");
        }
        else if(tbAdminVo.getPassWord().equals(result.getPassWord()) ){
            request.getSession().setAttribute("tbAdmin", result);
            //return "forward:to_index";
            return  new ResponseResult<>();
        }
        else{
            return  new ResponseResult<>(1000,"账号或密码错误");
        }

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
