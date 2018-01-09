package com.example.stumanage;

import com.example.stumanage.dao.StuMapper;
import com.example.stumanage.pojo.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = StumanageApplication.class)
public class StumanageApplicationTests {

	@Resource
	private StuMapper stuMapper;

	@Test
	public void contextLoads() {
	}

	@Test
	public void testMapper(){
		Student stu = stuMapper.findById("1011");
		System.out.println(stu);
	}

}
