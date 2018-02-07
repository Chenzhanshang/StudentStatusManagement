package com.example.stumanage.mapper;


import com.example.stumanage.domain.TbStudentSchoolPo;
import com.example.stumanage.vo.TbStudentSchoolVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 学生机构信息映射
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

public interface StudentSchoolMapper {

    /**
     * 保存学生机构信息
     * @param tbStudentSchoolPo
     */
    void save(TbStudentSchoolPo tbStudentSchoolPo);

    /**
     * 更新学生机构信息
     * @param tbStudentSchoolPo
     */
    void update(TbStudentSchoolPo tbStudentSchoolPo);

    /**
     * 删除机构信息
     * @param id
     */
    void deleteById(Integer id);

    /**
     * 根据身份证号删除机构信息
     */
    void deleteByCard(String cardId);

    /**
     * 查找所有学生机构信息
     * @param tbStudentSchoolVo
     * @return
     */
    List<TbStudentSchoolVo> findAll(TbStudentSchoolVo tbStudentSchoolVo);

    /**
     * 根据学号查找学生的机构信息
     * @param stuId
     * @return
     */
    TbStudentSchoolPo findByStuId(String stuId);

    /**
     * 根据身份证号查找学号
     * @param cardId
     * @return
     */
    TbStudentSchoolPo findByCardId(String cardId);

    void other(@Param("experience") String experience,@Param("stuId") String stuId);
}
