package com.example.stumanage.service.impl;

import com.example.stumanage.common.AssertUtils;
import com.example.stumanage.domain.TbStudentInfoPo;
import com.example.stumanage.domain.TbStudentSchoolPo;
import com.example.stumanage.mapper.StudentCourseMapper;
import com.example.stumanage.mapper.StudentInfoMapper;
import com.example.stumanage.mapper.StudentSchoolMapper;
import com.example.stumanage.service.StudentInfoService;
import com.example.stumanage.vo.TbStudentInfoVo;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.util.List;

/**
 *  学籍信息实现类
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

@Service
public class StudentInfoServiceImpl implements StudentInfoService {

    @Resource
    private StudentInfoMapper studentInfoMapper;

    @Resource
    private StudentSchoolMapper studentSchoolMapper;

    @Resource
    private StudentCourseMapper studentCourseMapper;

    private void inputCheck(TbStudentInfoVo tbStudentInfoVo) {
        AssertUtils.hasText(tbStudentInfoVo.getStuName(), "学生姓名不能为空");
        AssertUtils.hasText(tbStudentInfoVo.getSex(), "性别不能为空");
        AssertUtils.hasText(tbStudentInfoVo.getCardId(), "身份证号不能为空");
        AssertUtils.hasText(tbStudentInfoVo.getNation(), "民族不能为空");
        AssertUtils.hasText(tbStudentInfoVo.getNativePlace(), "籍贯不能为空");
        AssertUtils.hasText(tbStudentInfoVo.getBirthPlace(), "出生地不能为空");
        AssertUtils.hasText(tbStudentInfoVo.getPoliticsStatus(), "政治面貌不能为空");
        AssertUtils.hasText(tbStudentInfoVo.getWeddingStatus(), "婚否不能为空");
        AssertUtils.hasText(tbStudentInfoVo.getSchoolStatus(), "学籍状态不能为空");
        AssertUtils.hasText(tbStudentInfoVo.getSchoolTime().toString(), "入学时间不能为空");

    }

    /**
     * 注册学生学籍信息
     * @param tbStudentInfoVo
     */
    @Override
    public void saveInfo(TbStudentInfoVo tbStudentInfoVo) {
        inputCheck(tbStudentInfoVo);
        TbStudentInfoPo tbStudentInfoPo= new TbStudentInfoPo();
        BeanUtils.copyProperties(tbStudentInfoVo,tbStudentInfoPo);

        studentInfoMapper.saveInfo(tbStudentInfoPo);
    }

    /**
     * 删除学籍信息同时把学生的
     * 机构和课程都删除了
     * @param tbStudentInfoVo
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delInfo(TbStudentInfoVo tbStudentInfoVo) {
        studentInfoMapper.delInfo(tbStudentInfoVo.getId());
        studentSchoolMapper.deleteByCard(tbStudentInfoVo.getCardId());
        //身份证号查找学生学号
        String stuId = studentSchoolMapper.findStuIdByCardId(tbStudentInfoVo.getCardId());
        //根据学号删除课程表
        studentCourseMapper.deleteByStuId(stuId);
    }

    /**
     * 更新学籍信息
     * @param tbStudentInfoVo
     */
    @Override
    public void updateInfo(TbStudentInfoVo tbStudentInfoVo) {
        inputCheck(tbStudentInfoVo);
        TbStudentInfoPo tbStudentInfoPo= new TbStudentInfoPo();
        BeanUtils.copyProperties(tbStudentInfoVo,tbStudentInfoPo);

        studentInfoMapper.updateInfo(tbStudentInfoPo);
    }

    /**
     * 查找所有学生的学籍信息分页
     * @param record
     * @return
     */
    @Override
    public List<TbStudentInfoVo> findByAll(TbStudentInfoVo record) {
        PageHelper.startPage(record.getPage(),record.getPageSize());

        List<TbStudentInfoVo> list = studentInfoMapper.findByAll(record);
        return list;
    }

    /**
     * 根据学号查询学生学籍信息
     * @param stuId
     * @return
     */
    @Override
    public TbStudentInfoVo findByStuId(String stuId) {
        //根据学号查出身份证
       TbStudentSchoolPo tbStudentSchoolPo = studentSchoolMapper.findByStuId(stuId);
       String cardId=tbStudentSchoolPo.getCardId();
        //由身份证查出学籍信息
       TbStudentInfoPo tbStudentInfoPo = studentInfoMapper.findByCardId(cardId);
       TbStudentInfoVo tbStudentInfoVo = new TbStudentInfoVo();
       BeanUtils.copyProperties(tbStudentInfoPo,tbStudentInfoVo);

       return tbStudentInfoVo;
    }

    /**
     * 根据身份证号查询学生学籍信息
     * @param cardId
     * @return
     */
    @Override
    public TbStudentInfoVo findByCardId(String cardId) {
        TbStudentInfoPo tbStudentInfoPo = studentInfoMapper.findByCardId(cardId);
        TbStudentInfoVo tbStudentInfoVo = new TbStudentInfoVo();
        BeanUtils.copyProperties(tbStudentInfoPo,tbStudentInfoVo);

        return tbStudentInfoVo;
    }
}
