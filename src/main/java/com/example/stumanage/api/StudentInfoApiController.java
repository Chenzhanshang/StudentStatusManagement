package com.example.stumanage.api;

import com.example.stumanage.common.ResponseResult;
import com.github.pagehelper.PageInfo;
import com.example.stumanage.service.StudentInfoService;
import com.example.stumanage.vo.TbStudentInfoVo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;

/**
 * 学生学籍api
 * @author: zhangzengke
 * @date: 2018/2/1
 **/

@RequestMapping("api/info")
@RestController
public class StudentInfoApiController {

    @Resource
    private StudentInfoService studentInfoService;

    /**
     * 根据学号查找学生学籍信息
     *
     * @param stuId
     * @return
     */
    @GetMapping("/findByStuId")
    public ResponseResult<TbStudentInfoVo> findByStuId(@RequestParam String stuId) {
        TbStudentInfoVo tbStudentInfoVo = studentInfoService.findByStuId(stuId);

        return new ResponseResult<>(tbStudentInfoVo);
    }

    /**
     * 查找所有学生学籍信息分页
     */
    @PostMapping("/findAll")
    public ResponseResult<PageInfo<TbStudentInfoVo>> findAll(@RequestBody Map map) {
        System.out.println(map.get("stuId"));

        return null;

     /*   List<TbStudentInfoVo> list = studentInfoService.findByAll(record);

        return new ResponseResult<>(new PageInfo<>(list));*/
    }

    @PostMapping("/save")
    public ResponseResult saveInfo(@RequestBody TbStudentInfoVo tbStudentInfoVo) {
        tbStudentInfoVo.setCreatedBy("带土");
        tbStudentInfoVo.setSchoolTime(new Date());
        tbStudentInfoVo.setModifiedBy("带土");
        studentInfoService.saveInfo(tbStudentInfoVo);

        return new ResponseResult();
    }

    @PostMapping("/del")
    public ResponseResult delInfo(@RequestBody TbStudentInfoVo tbStudentInfoVo) {
        studentInfoService.delInfo(tbStudentInfoVo);

        return new ResponseResult();
    }

    @PostMapping("/update")
    public ResponseResult update(@RequestBody TbStudentInfoVo tbStudentInfoVo) {
        studentInfoService.updateInfo(tbStudentInfoVo);

        return new ResponseResult();
    }



}
