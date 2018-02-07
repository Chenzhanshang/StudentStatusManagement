package com.example.stumanage.service;

import com.example.stumanage.vo.TbStudentSchoolVo;

import java.util.List;

/**
 * 学生机构信息service接口
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

public interface StudentSchoolService {

    /**
     * 保存学生机构信息
     * @param tbStudentSchoolVo
     */
    void save(TbStudentSchoolVo tbStudentSchoolVo);

    /**
     * 更新学生机构信息
     * @param tbStudentSchoolVo
     */
    void update(TbStudentSchoolVo tbStudentSchoolVo);

    /**
     * 删除机构信息
     * @param tbStudentSchoolVo
     */
    void deleteById(TbStudentSchoolVo tbStudentSchoolVo);

    /**
     * 根据身份证号删除机构信息
     * @param tbStudentSchoolVo
     */
    void deleteByCardId(TbStudentSchoolVo tbStudentSchoolVo);

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
    TbStudentSchoolVo findByStuId(String stuId);

    /**
     * 根据身份证号查找信息
     * @param cardId
     * @return
     */
    TbStudentSchoolVo findByCardId(String cardId);


    /**
     * 根据学号查询姓名
     * @param stuId
     * @return
     */
    TbStudentSchoolVo findNameByStuId(String stuId);

    /**
     * 修改奖惩信息
     * @param tbStudentSchoolVo
     */
    void other(TbStudentSchoolVo tbStudentSchoolVo);
}
