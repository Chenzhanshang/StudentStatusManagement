package com.example.stumanage.mapper;

import com.example.stumanage.domain.Student;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * describe: 映射类
 *
 * @author: zhangzk
 * @date: 2018/1/8  11:47
 **/
@Mapper
@Repository
public interface StuMapper {

    /**
     * 查找全部学生
     *
     * @return List<Student>
     */
    @Select("select * from tb_student")
    List<Student> findAll();

    /**
     * 根据编号查找学生
     *
     * @param id 编号
     * @return List<Student>
     */
    @Select("select * from tb_student where id=#{id}")
    List<Student> findByID(String id);

    /**
     * 根据学号查找学生
     *
     * @param stuId 学号
     * @return Student
     */
    @Select("select * from tb_student where stuId= #{stuId}")
    Student findById(@RequestParam("stuId") String stuId);


    /**
     * 添加新学生
     *
     * @param stu Student
     */
    @Insert("insert into tb_student (id,name,stuId,sex,age,address,idCard) values(#{id},#{name},#{stuId},#{sex},#{age},#{address},#{idCard})")
    void saveStu(Student stu);

    /**
     * 根据学号更新学生信息
     *
     * @param stu 学号
     */
    @Update("UPDATE tb_student set name = #{name},stuId = #{stuId} ,sex=#{sex},age=#{age},address=#{address},idCard=#{idCard} where  id = #{id}")
    void updateStu(Student stu);

    /**
     * 根据编号删除学生信息
     *
     * @param id 编号
     */
    @Delete("delete from tb_student where id = #{id}")
    void delStu(String id);
}
