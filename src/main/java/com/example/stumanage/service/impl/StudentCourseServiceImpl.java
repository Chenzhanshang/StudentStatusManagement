package com.example.stumanage.service.impl;


import com.example.stumanage.domain.TbStudentCoursePo;
import com.example.stumanage.mapper.StudentCourseMapper;
import com.example.stumanage.service.StudentCourseService;
import com.example.stumanage.vo.TbStudentCourseVo;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * 学生课程实现类
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

@Service
public class StudentCourseServiceImpl implements StudentCourseService {

    @Resource
    private StudentCourseMapper studentCourseMapper;

    /**
     * 根据id查找课程信息
     * @param id
     * @return
     */
    @Override
    public TbStudentCourseVo findById(Integer id) {

        TbStudentCoursePo tbStudentCoursePo =studentCourseMapper.findById(id);
        TbStudentCourseVo tbStudentCourseVo = new TbStudentCourseVo();

        BeanUtils.copyProperties(tbStudentCoursePo,tbStudentCourseVo);
        return tbStudentCourseVo;
    }

    /**
     * 查找一个学生所有课程信息并分页
     * @param record
     * @return
     */
    @Override
    public List<TbStudentCourseVo> findByStuId(TbStudentCourseVo record) {

        List<TbStudentCourseVo> list = studentCourseMapper.findByStuId(record);

        return list;
    }

    /**
     * 添加课程
     * @param tbStudentCourseVo
     */
    @Override
    public void saveCourse(TbStudentCourseVo tbStudentCourseVo) {
        TbStudentCoursePo tbStudentCoursePo= new TbStudentCoursePo();
        BeanUtils.copyProperties(tbStudentCourseVo,tbStudentCoursePo);

        studentCourseMapper.save(tbStudentCoursePo);
    }

    /**
     * 修改课程信息添加成绩等
     * @param tbStudentCourseVo
     */
    @Override
    public void editCourse(TbStudentCourseVo tbStudentCourseVo) {
        TbStudentCoursePo tbStudentCoursePo= new TbStudentCoursePo();
        BeanUtils.copyProperties(tbStudentCourseVo,tbStudentCoursePo);

        studentCourseMapper.edit(tbStudentCoursePo);
    }

    /**
     * 删除
     * @param id
     */
    @Override
    public void del(Integer id) {
        studentCourseMapper.deleteById(id);
    }
}
