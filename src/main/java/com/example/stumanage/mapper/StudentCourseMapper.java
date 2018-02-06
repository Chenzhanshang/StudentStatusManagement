package com.example.stumanage.mapper;

import com.example.stumanage.domain.TbStudentCoursePo;
import com.example.stumanage.vo.TbStudentCourseVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 学生课程映射接口
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

public interface StudentCourseMapper {

    TbStudentCoursePo findById(@Param("id") Integer id);

    void deleteByStuId(@Param("stuId") String stuId);

    void deleteById(@Param("id") Integer id);

    List<TbStudentCourseVo> findByStuId(TbStudentCourseVo tbStudentCourseVo);

    List<TbStudentCoursePo> findByStuIdd(@Param("stuId") String stuId);

    void save(TbStudentCoursePo tbStudentCoursePo);

    void edit(TbStudentCoursePo tbStudentCoursePo);
}
