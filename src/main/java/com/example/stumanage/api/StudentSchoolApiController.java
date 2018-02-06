package com.example.stumanage.api;

import com.example.stumanage.service.StudentSchoolService;
import com.github.pagehelper.PageInfo;
import com.example.stumanage.common.ResponseResult;
import com.example.stumanage.vo.TbStudentSchoolVo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 *学生机构api
 * @author: zhangzengke
 * @date: 2018/2/1 
 **/

@RequestMapping("api/school")
@RestController
public class StudentSchoolApiController {

    @Resource
    private StudentSchoolService studentSchoolService;

    /**
     * 新添学生机构信息
     * @param tbStudentSchoolVo
     * @return
     */
    @PostMapping("/save")
    public ResponseResult save(@RequestBody TbStudentSchoolVo tbStudentSchoolVo){

        tbStudentSchoolVo.setCreatedBy("daitu");
        tbStudentSchoolVo.setModifiedBy("daitu");
        studentSchoolService.save(tbStudentSchoolVo);

        return new ResponseResult();
    }

    @PostMapping("/update")
    public  ResponseResult update(@RequestBody TbStudentSchoolVo tbStudentSchoolVo){

        studentSchoolService.update(tbStudentSchoolVo);
        return  new ResponseResult();
    }

    /**
     * 根据id删除学生机构信息
     * @param tbStudentSchoolVo
     * @return
     */
    @GetMapping("/deleteById")
    public ResponseResult deleteById(@RequestParam TbStudentSchoolVo tbStudentSchoolVo){
        studentSchoolService.deleteById(tbStudentSchoolVo);

        return  new ResponseResult();
    }

    /**
     * 根据身份证号删除学生机构信息
     * @param tbStudentSchoolVo
     * @return
     */
    @GetMapping("/delByCardId")
    public ResponseResult delByCardId(@RequestParam TbStudentSchoolVo tbStudentSchoolVo){
        studentSchoolService.deleteByCardId(tbStudentSchoolVo);

        return  new ResponseResult();
    }
    /**
     * 查找所有学生机构并分页
     */
    @PostMapping("/findAll")
    public ResponseResult<PageInfo<TbStudentSchoolVo>> findAll(@RequestBody TbStudentSchoolVo record){
        List<TbStudentSchoolVo> tbStudentSchoolVos = studentSchoolService.findAll(record);

        return new ResponseResult<>(new PageInfo<>(tbStudentSchoolVos));
    }

    /**
     * 根据学号查找学生的机构信息
     * @return
     */
    @GetMapping("/findByStuId")
    public ResponseResult<TbStudentSchoolVo> findByStuId(@RequestParam  String stuId){
        TbStudentSchoolVo tbStudentSchoolVo =studentSchoolService.findByStuId(stuId);

        return new ResponseResult<>(tbStudentSchoolVo);
    }

    /**
     * 根据身份证号查询学号
     * @return
     */
    @GetMapping("/findStuIdByCardId")
    public ResponseResult<String> findStuIdByCardId(@RequestParam String stuId){
        String stuid = studentSchoolService.findStuIdByCardId(stuId);

        return new ResponseResult<>(stuid);
    }
}
