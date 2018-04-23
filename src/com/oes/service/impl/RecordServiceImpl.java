package com.oes.service.impl;

import java.util.List;

import com.oes.bean.Exam;
import com.oes.bean.FillQuestion;
import com.oes.bean.MutipleQuestion;
import com.oes.bean.Record;
import com.oes.bean.Role;
import com.oes.bean.SingleQuestion;
import com.oes.bean.Student;
import com.oes.dao.RecordDao;
import com.oes.service.ExamService;
import com.oes.service.RecordService;
import com.oes.service.RoleService;
import com.oes.utils.BasicUtil;
import com.oes.utils.ExamUtils;

public class RecordServiceImpl implements RecordService {
	private RecordDao recordDao;
	private ExamService examService;
	private RoleService studentService;
	
	public void setStudentService(RoleService studentService) {
		this.studentService = studentService;
	}
	public void setRecordDao(RecordDao recordDao) {
		this.recordDao = recordDao;
	}
	public boolean saveRecord(Record re) {
		boolean res = recordDao.saveRecord(re.getExam().getExamid(),re.getStudent().getSid(),
				re.getMyanswer(),re.getScore());
		
		
		return res;
	}
	/**
	 * 
	 */
	public Record packageRecord(Student student, Exam exam, String answer) {
		
//		System.out.println(answer);
		
		String[] allAnswer = answer.split("##");
		System.out.println("答案"+answer);
		System.out.println(allAnswer.length+"个数组");
		System.out.println("单选："+allAnswer[0]);
		System.out.println("双选："+allAnswer[1]);
		System.out.println("填空："+allAnswer[2]);
		
		//根据答案封装单选
		List<SingleQuestion> squestions = exam.getTestpaper().getSquestions();
		squestions = ExamUtils.packageSingleQuestion(squestions, allAnswer[0]);
		exam.getTestpaper().setSquestions(squestions);
		
		//封装双选
		List<MutipleQuestion> mquestions = exam.getTestpaper().getMquestions();
		mquestions = ExamUtils.packageMutipleQuestion(mquestions, allAnswer[1]);
		exam.getTestpaper().setMquestions(mquestions);
		
		//封装填空题目
		List<FillQuestion> fquestions = exam.getTestpaper().getFquestions();
		ExamUtils.packageFillQuestion(fquestions, allAnswer[2]);
		exam.getTestpaper().setFquestions(fquestions);
		
		//计算分数
		double totalScore = BasicUtil.calculateTotalScore(exam);
		
		//创建一个考试记录对象
		Record re = new Record();
		re.setScore(totalScore);//保存成绩的记录
		re.setStudent(student);
		re.setExam(exam);
		re.setMyanswer(answer);
		
		return re;
	}
	public Record getRecordById(Integer rid) {
		//获取到考试对象
		Record re = recordDao.getRrcordById(rid);
		//获取到考试答案
		String myanswer = re.getMyanswer();
		//获取要获取的考试对象id
		Integer examid = re.getExam().getExamid();
		//根据考试id获取考试对象
		Exam exam = examService.getExamById(examid);
		//根据学生id获取学生
		Student student = (Student) studentService.getRoleById(re.getStudent().getSid());
		
		
		//封装考试记录对象
		re = this.packageRecord(student, exam, myanswer);
		
		return re;
	}

}
