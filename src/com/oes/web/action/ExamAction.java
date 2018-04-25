package com.oes.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.oes.bean.Exam;
import com.oes.bean.FillQuestion;
import com.oes.bean.MutipleQuestion;
import com.oes.bean.Question;
import com.oes.bean.Record;
import com.oes.bean.SingleQuestion;
import com.oes.bean.Student;
import com.oes.bean.TestPaper;
import com.oes.service.ExamService;
import com.oes.service.PaperService;
import com.oes.service.RecordService;
import com.oes.utils.BasicUtil;
import com.oes.utils.ExamUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

public class ExamAction extends ActionSupport {
	private static Record tmp;	//暂时数据
	
	
	private PaperService paperService;
	private RecordService recordService;
	
	private String sAnswer;
	private String mAnswer;
	private String fAnswer;
	
	private Integer rid;
	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}
	private Integer sid;
	
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	
	private int examid;
	
	public void setExamid(int examid) {
		this.examid = examid;
	}

	private ExamService examService;
	
	public void setExamService(ExamService examService) {
		this.examService = examService;
	}
	
	/**
	 * 加载考试事项，一般都是页面加载成功的时候请求
	 * 
	 * @return
	 */
	public String loadExamItem() {
		
//		System.out.println("加载考试事项！！！");
		HttpServletResponse response = ServletActionContext.getResponse();
		//设置编码格式
		response.setContentType("text/html;charset=utf-8");
		//获取当前时间，
		//Date nowTime = 
		Calendar nowTime = Calendar.getInstance();
		//获取当前时间
		Date date = nowTime.getTime();
		//获取可以进行的考试项
		List<Exam> exams = examService.getExamItemByDate(date);
		String list = JSON.toJSONString(exams);
//		System.out.println(list);
		
		try {
			PrintWriter writer = response.getWriter();
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
	}
	/**
	 * 加载考试页面
	 * 
	 * @return
	 */
	public String loadPaper(){
		
		//获取当前考试的信息
		Exam exam = examService.getExamById(examid);
		
		System.out.println(examid);
		//TestPaper paper = paperService.getPaperByPid(pid);
		//将考试对象存入session
		ServletActionContext.getRequest().getSession().setAttribute("exam", exam);
		System.out.println(exam);
		
		return "exam";
	}
	/**
	 * 加载相应学生考试记录列表
	 * 
	 * 
	 * @return
	 */
	public String loadExamRecrod() {
		
		System.out.println("加载考试记录！！");
		
		HttpServletResponse response = ServletActionContext.getResponse();
		//设置编码格式
		response.setContentType("text/html;charset=utf-8");
		
		//根据学生id获取考试记录
		List<Record> records = recordService.getRecordsBySid(sid);
		
		if(records.size() > 0) {
			String examlist = JSON.toJSONString(records,SerializerFeature.DisableCircularReferenceDetect);
			System.out.println("考试记录列表："+examlist);
			try {
				response.getWriter().print(examlist);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			String examlist = JSON.toJSONString(records,SerializerFeature.DisableCircularReferenceDetect);
			System.out.println("考试记录列表22："+examlist);
			try {
				response.getWriter().print(examlist);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return NONE;
		
	}
	/**
	 * 查看考试对应的试卷			尚未完成，知识获取到了考试记录对象
	 * 	留下的问题			在显示考试记录的时候，显示的应该是考试记录，而不是考试列表
	 * 
	 * @return
	 */
	public String showPaper() {
		
		//根据接收到的考试记录id获取考试记录对象
		Record re = recordService.getRecordById(rid);
		
		//将获取的考试记录返回，不要删除，到时候用到这里
		ServletActionContext.getRequest().getSession().setAttribute("record", re);
		System.out.println(re);
		
		return "examRecord";
	}
	/**
	 * 交卷
	 * @return
	 */
	public String handPaper(){
		
		System.out.println("交卷");
		
		sAnswer = ServletActionContext.getRequest().getParameter("sAnswer");
		mAnswer = ServletActionContext.getRequest().getParameter("mAnswer");
		fAnswer = ServletActionContext.getRequest().getParameter("fAnswer");
		
		//保存到考试记录中的答案字段
		String answerRecord = sAnswer +"##" + mAnswer +"##"+fAnswer;
		
		//保存到数据库中的学生id
		Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("user");
		Integer sid = student.getSid();
		
		//获取考试对象
		Exam exam = (Exam) ServletActionContext.getRequest().getSession().getAttribute("exam");
		
		//封装考试记录对象
		Record record = new Record();
		//组装好答案
		answerRecord = BasicUtil.packageAnswerToDB(answerRecord);
		record = recordService.packageRecord(record,student,exam,answerRecord);
		
		//计算分数
		double totalScore = BasicUtil.calculateTotalScore(record.getExam());
		
		//保存分数
		record.setScore(totalScore);//保存成绩的记录
		
		System.out.println("保存记录："+record);
		
		boolean issucc = recordService.saveRecord(record);
		
		
		//保存成功
		if(issucc) {
			//将结算后的保存了该次考试记录的记录放入session
			ServletActionContext.getRequest().getSession().setAttribute("afterExam", record);
			
			String json = JSON.toJSONString(record);
			System.out.println(json);
			
			return "getScore";
		}
		
		return "tip";
		
	}
	/**
	 * 返回学生主页
	 * 
	 * @return
	 */
	public String toHomaPage() {
		return "student";
	}

	
}
