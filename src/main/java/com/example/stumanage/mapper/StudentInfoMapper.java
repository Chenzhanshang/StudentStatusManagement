package com.example.stumanage.mapper;

import com.example.stumanage.domain.TbStudentInfoPo;
import com.example.stumanage.vo.TbStudentInfoVo;

import java.util.List;

/**
 * 学籍信息映射接口
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

public interface StudentInfoMapper {
    /**
     * 新添学生学籍信息
     * @param tbStudentInfoPo
     */
    void saveInfo(TbStudentInfoPo tbStudentInfoPo);

    /**
     * 删除学生学籍信息
     * @param id
     */
    void delInfo(Integer id);

    /**
     * 修改学生学籍信息
     * @param tbStudentInfoPo
     */
    void updateInfo(TbStudentInfoPo tbStudentInfoPo);

    /**
     * 查找所有学生学籍信息分页
     * @param tbStudentInfoVo
     * @return
     */
    List<TbStudentInfoVo> findByAll(TbStudentInfoVo tbStudentInfoVo);

    /**
     * 根据身份证号查找学生学籍信息
     * @param cardId
     * @return
     */
    TbStudentInfoPo findByCardId(String cardId);
}
