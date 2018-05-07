package com.example.stumanage.service.impl;


import com.example.stumanage.common.AssertUtils;
import com.example.stumanage.domain.TbStudentSchoolPo;
import com.example.stumanage.mapper.StudentCourseMapper;
import com.example.stumanage.mapper.StudentSchoolMapper;
import com.example.stumanage.service.StudentSchoolService;
import com.example.stumanage.vo.TbStudentSchoolVo;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 学生机构实现类
 * @author: zhangzengke
 * @date: 2018/1/31
 **/

@Service
public class StudentSchoolServiceImpl implements StudentSchoolService {

    @Resource
    private StudentSchoolMapper studentSchoolMapper;

    @Resource
    private StudentCourseMapper studentCourseMapper;

    /**
     * 数据正确性检验
     * @param tbStudentSchoolVo
     */
    private void inputCheck(TbStudentSchoolVo tbStudentSchoolVo) {
        AssertUtils.hasText(tbStudentSchoolVo.getStuId(), "学号不能为空");
        AssertUtils.hasText(tbStudentSchoolVo.getStuName(), "姓名不能为空");
        AssertUtils.hasText(tbStudentSchoolVo.getCardId(), "身份证号不能为空");
        AssertUtils.hasText(tbStudentSchoolVo.getAcademy(), "学院不能为空");
        AssertUtils.hasText(tbStudentSchoolVo.getClazz(), "班不能为空");
    }

    @Override
    public TbStudentSchoolVo findNameByStuId(String stuId){
    TbStudentSchoolPo tbStudentSchoolPo = studentSchoolMapper.findByStuId(stuId);
    TbStudentSchoolVo tbStudentSchoolVo= new TbStudentSchoolVo();
    BeanUtils.copyProperties(tbStudentSchoolPo,tbStudentSchoolVo);

    return tbStudentSchoolVo;
    }

    /**
     * 修改奖惩信息
     * @param tbStudentSchoolVo
     */
    @Override
    public void other(TbStudentSchoolVo tbStudentSchoolVo) {
        String experience=tbStudentSchoolVo.getExperience();
        String stuId = tbStudentSchoolVo.getStuId();
        studentSchoolMapper.other(experience,stuId );
    }

    /**
     * 查找所有学院
     * @return
     */
    @Override
    public List<String> findAcademy() {
        List<String> list =studentSchoolMapper.findAcademy();

        return list;
    }

    /**
     * 查找该学院下的所有系
     * @param academyName
     * @return
     */
    @Override
    public List<String> findDepartment(String academyName) {
        List<String> list = studentSchoolMapper.findDepartment(academyName);

        return list;
    }

    /**
     * 插入学生机构信息
     * @param tbStudentSchoolVo
     */
    @Override
    public void save(TbStudentSchoolVo tbStudentSchoolVo) {
        inputCheck(tbStudentSchoolVo);
        TbStudentSchoolPo tbStudentSchoolPo= new TbStudentSchoolPo();
        BeanUtils.copyProperties(tbStudentSchoolVo,tbStudentSchoolPo);
        studentSchoolMapper.save(tbStudentSchoolPo);
    }

    /**
     * 更新学生机构设置的同时清空学生课程信息
     * 并弹出设置学生课程的弹窗
     * @param tbStudentSchoolVo
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(TbStudentSchoolVo tbStudentSchoolVo) {
        inputCheck(tbStudentSchoolVo);
        TbStudentSchoolPo tbStudentSchoolPo= new TbStudentSchoolPo();
        BeanUtils.copyProperties(tbStudentSchoolVo,tbStudentSchoolPo);
        studentSchoolMapper.update(tbStudentSchoolPo);
        //清空学生是个可选项不写在这
    }

    /**
     * 根据id删除学生机构信息的同时删除学生课程信息
     * @param tbStudentSchoolVo
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteById(TbStudentSchoolVo tbStudentSchoolVo) {
        studentSchoolMapper.deleteById(tbStudentSchoolVo.getId());

        studentCourseMapper.deleteByStuId(tbStudentSchoolVo.getStuId());
    }
    /**
     * 根据身份证号删除学生机构信息的同时删除学生课程信息
     * @param tbStudentSchoolVo
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteByCardId(TbStudentSchoolVo tbStudentSchoolVo) {
        studentSchoolMapper.deleteByCard(tbStudentSchoolVo.getCardId());

        studentCourseMapper.deleteByStuId(tbStudentSchoolVo.getStuId());
    }

    /**
     * 查找所有学生的机构信息分页
     @param record
     * @return
     */
    @Override
    public List<TbStudentSchoolVo> findAll(TbStudentSchoolVo record) {
        PageHelper.startPage(record.getPage(),record.getPageSize());
        List<TbStudentSchoolVo> list =studentSchoolMapper.findAll(record);

        return list;
    }

    /**
     * 根据学号查询学生机构信息
     * @param stuId
     * @return
     */
    @Override
    public TbStudentSchoolVo findByStuId(String stuId) {

        TbStudentSchoolPo tbStudentSchoolPo = studentSchoolMapper.findByStuId(stuId);
        TbStudentSchoolVo tbStudentSchoolVo = new TbStudentSchoolVo();
        BeanUtils.copyProperties(tbStudentSchoolPo,tbStudentSchoolVo);
       /* List<TbStudentCoursePo> tbStudentCoursePos =studentCourseMapper.findByStuIdd(stuId);
        if (tbStudentCoursePos.isEmpty()){
            return null;
        }
        List<TbStudentCourseVo>  tbStudentCourseVos = new ArrayList<>(tbStudentCoursePos.size());

        for(TbStudentCoursePo tbStudentCoursePo :tbStudentCoursePos)
        {
            TbStudentCourseVo tbStudentCourseVo = new TbStudentCourseVo();
            BeanUtils.copyProperties(tbStudentCoursePo,tbStudentCourseVo);
            tbStudentCourseVos.add(tbStudentCourseVo);
        }
        tbStudentSchoolVo.setList(tbStudentCourseVos);*/

        return tbStudentSchoolVo;
    }

    /**
     * 根据身份证号查找机构信息
     * @param cardId
     * @return
     */
    @Override
    public TbStudentSchoolVo findByCardId(String cardId) {
        TbStudentSchoolPo tbStudentSchoolPo=studentSchoolMapper.findByCardId(cardId);

        TbStudentSchoolVo tbStudentSchoolVo = new TbStudentSchoolVo();
        BeanUtils.copyProperties(tbStudentSchoolPo,tbStudentSchoolVo);
        return tbStudentSchoolVo;
    }
}
