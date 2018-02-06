package com.example.stumanage.service;

import com.example.stumanage.vo.TbStudentInfoVo;

import java.util.List;

/**
 * 学生学籍信息service接口
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

public interface StudentInfoService {

    /**
     * 新添学生学籍信息
     * @param tbStudentInfoVo
     */
    void saveInfo(TbStudentInfoVo tbStudentInfoVo);

    /**
     * 删除学生学籍信息
     * @param tbStudentInfoVo
     */
    void delInfo(TbStudentInfoVo tbStudentInfoVo);

    /**
     * 修改学生学籍信息
     * @param tbStudentInfoVo
     */
    void updateInfo(TbStudentInfoVo tbStudentInfoVo);

    /**
     * 查找所有学生学籍信息分页
     * @param tbStudentInfoVo
     * @return
     */
    List<TbStudentInfoVo> findByAll(TbStudentInfoVo tbStudentInfoVo);

    /**
     * 根据学生学号查找学生学籍信息
     * @param stuId
     * @return
     */
    TbStudentInfoVo findByStuId(String stuId);

    /**
     * 身份号查学籍
     */
    TbStudentInfoVo findByCardId(String cardId);
}
