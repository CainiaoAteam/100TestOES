package com.oes.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.oes.bean.Exam;
import com.oes.bean.TestPaper;
import com.oes.dao.ExamDao;

public class ExamDaoImpl extends HibernateDaoSupport implements ExamDao {

	public List<Exam> getExamByDate(Date date) {
		// TODO Auto-generated method stub
		//注： 这里要对data处理一下，以便于和数据库中的时间对比
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		
		List<Exam> list = new ArrayList();
		Exam a1 = new Exam();
		a1.setExamname("2018年大学四级英语考试");
		a1.setExamday(new Date());
		a1.setExamid(1);
		//为了方便显示，处理一下时间的格式
		a1.setStartTime(sdf.format(new Date()));
		a1.setExamno("cet4-4122563");
		//a1.setTpid(12);
		TestPaper p1 = new TestPaper();
		p1.setTpid(12);
		a1.setTestpaper(p1);
		
		Exam a2 = new Exam();
		a2.setExamname("2018年大学六级英语考试");
		a2.setExamday(new Date());
		a2.setStartTime(sdf.format(new Date()));
		a2.setExamno("cet6-4128963");
		a2.setExamid(2);
		TestPaper p2 = new TestPaper();
		p2.setTpid(13);
		a2.setTestpaper(p2);
		
		Exam a3 = new Exam();
		a3.setExamname("2018年国际雅思英语考试");
		a3.setExamday(new Date());
		a3.setStartTime(sdf.format(new Date()));
		a3.setExamno("yasi-4128963");
		a3.setExamid(3);
		TestPaper p3 = new TestPaper();
		p3.setTpid(14);
		a3.setTestpaper(p3);
		
		list.add(a1);
		list.add(a2);
		list.add(a3);
		
		return list;
	}
	/**
	 * 获取考试对象
	 * 
	 */
	public Exam getExamById(int examid) {
		
		
		Exam exam = new Exam();
		exam.setExamid(examid);
		exam.setExamtime(120);
		TestPaper p = new TestPaper();
		p.setTpid(12);
		p.setTpname("测试试卷 AAA");
		exam.setTestpaper(p);
		
		return exam;
	}
	
	
}
