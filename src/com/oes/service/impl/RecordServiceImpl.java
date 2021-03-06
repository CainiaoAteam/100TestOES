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
	
	
	public void setExamService(ExamService examService) {
		this.examService = examService;
	}
	public void setStudentService(RoleService studentService) {
		this.studentService = studentService;
	}
	public void setRecordDao(RecordDao recordDao) {
		this.recordDao = recordDao;
	}
	public boolean saveRecord(Record re) {
		System.out.println("保存记录："+re);
		
		boolean res = recordDao.saveRecord(re.getExam().getExamid(),re.getStudent().getSid(),
				re.getMyanswer(),re.getScore());
		
		
		return res;
	}
	/**
	 * 
	 */
	public Record packageRecord(Record re,Student student, Exam exam, String answer) {
		
//		System.out.println(answer);
		
		//解析答案
		String[] allAnswer = answer.split("##");
		
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
		
		re.setStudent(student);
		re.setExam(exam);
		re.setMyanswer(answer);
		
		return re;
	}
	public Record getRecordById(Integer rid) {
		//获取到考试对象
		Record re = recordDao.getRecordById(rid);
		//获取到考试答案
		String myanswer = re.getMyanswer();
		//获取要获取的考试对象id
		Integer examid = re.getExam().getExamid();
		//根据考试id获取考试对象
		Exam exam = examService.getExamById(examid);
		//根据学生id获取学生
		Student student = (Student) studentService.getRoleById(re.getStudent().getSid());
		
		
		//封装考试记录对象
		re = this.packageRecord(re,student, exam, myanswer);
		
		return re;
	}
	/**
	 * 获取该学生的所有考试记录、要封装好每一条记录对象
	 * 
	 */
	public List<Record> getRecordsBySid(Integer sid) {
		// TODO Auto-generated method stub
		
		List<Record> list = recordDao.getRecordBySid(sid);
		for (int i =0; i<list.size();i++) {
			Integer examid = list.get(i).getExam().getExamid();
			Exam exam = examService.getExamById(examid);
			Student student = (Student) studentService.getRoleById(sid);
			Record record = new Record();
			record = this.packageRecord(list.get(i),student, exam, list.get(i).getMyanswer());
			list.set(i, record);
		}
		
		return list;
	}
	public List<Record> getRecordByExamId(int examid) {
		List<Record> list = recordDao.getRecordsByExamId(examid);
		for(int i=0; i<list.size();i++) {
			Record record = list.get(i);
			Exam exam = examService.getExamById(record.getExam().getExamid());
			Student student = (Student) studentService.getRoleById(record.getStudent().getSid());
			record.setExam(exam);
			record.setStudent(student);
			list.set(i, record);
		}
		return list;
	}
	public boolean isHasRecordForSidAndExamid(int sid, int examid) {
		// TODO Auto-generated method stub
		return recordDao.getRecordByExamIdAndSid(sid,examid);
	}

}
