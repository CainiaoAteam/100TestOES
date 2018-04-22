package com.oes.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.oes.bean.Exam;
import com.oes.bean.FillQuestion;
import com.oes.bean.MutipleQuestion;
import com.oes.bean.Question;
import com.oes.bean.Record;
import com.oes.bean.SingleQuestion;
import com.oes.bean.TestPaper;
import com.oes.service.ExamService;
import com.oes.service.PaperService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

public class ExamAction extends ActionSupport {
	
	private PaperService paperService;
	
	private String sAnswer;
	private String mAnswer;
	private String fAnswer;
	
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
		
//		System.out.println(examid);
//		TestPaper paper = paperService.getPaperByPid(pid);
		//将考试对象存入session
		ServletActionContext.getRequest().getSession().setAttribute("exam", exam);
		
		
		return "exam";
	}
	/**
	 * 加载相应学生考试记录
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
		List<Record> records = examService.getExamRecordBySid(sid);
		
		if(records.size() > 0) {
			String examlist = JSON.toJSONString(records);
			System.out.println(examlist);
			
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
	 * 查看考试对应的试卷
	 * 
	 * @return
	 */
	public String showPaper() {
		//根据对应的id获取考试对象
		Exam exam = examService.getExamById(examid);
		//根据因为考试对象中需要的paper对象，根据相应的id获取paper对象
		TestPaper paper = paperService.getPaperByPid(exam.getTestpaper().getTpid());
		//将获取到的paper封装好exam对象
		exam.setTestpaper(paper);
		
		//将exam存入session
		ServletActionContext.getRequest().getSession().setAttribute("record", exam);
		
		return "showPaper";
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
		
		//获取考试对象
		Exam exam = (Exam) ServletActionContext.getRequest().getSession().getAttribute("exam");
		
//		解析答案
		String[] sArr = sAnswer.split("-");
		List<SingleQuestion> squestions = exam.getTestpaper().getSquestions();
		for(int i = 0; i<sArr.length;i++) {
			if(sArr[i].equals("")) {
				squestions.get(i).setAnswer("没有作答！");
			}else {
				squestions.get(i).setAnswer(sArr[i]);
			}
			
			if(sArr[i].equals(squestions.get(i).getSanswer())) {
				squestions.get(i).setIstrue(1);
			}else {
				squestions.get(i).setIstrue(0);
			}
			
		}
		exam.getTestpaper().setSquestions(squestions);
		
		String[] mArr = mAnswer.split("-");
		List<MutipleQuestion> mquestions = exam.getTestpaper().getMquestions();
		for(int i = 0; i<mArr.length;i++) {
			if(mArr[i].equals("")) {
				mquestions.get(i).setAnswer("没有作答！");
			}else {
				mquestions.get(i).setAnswer(mArr[i]);
			}
			
			if(mArr[i].equals(mquestions.get(i).getManswer())) {
				mquestions.get(i).setIstrue(1);
			}else if(mquestions.get(i).getManswer().indexOf(mArr[i])>=0 && mArr[i].length() < mquestions.get(i).getManswer().length()){
				mquestions.get(i).setIstrue(0.5);
			}else {
				mquestions.get(i).setIstrue(0);
			}
			
		}
		exam.getTestpaper().setMquestions(mquestions);
		
		String[] fArr = fAnswer.split("-");
		List<FillQuestion> fquestions = exam.getTestpaper().getFquestions();
		
		for(int i = 0; i<fArr.length;i++) {
			if(fArr[i].equals("")) {
				fquestions.get(i).setAnswer("没有作答！");
			}else {
				fquestions.get(i).setAnswer(fArr[i]);
			}
			
			if(fArr[i].equals(fquestions.get(i).getFanswer())) {
				fquestions.get(i).setIstrue(1);
			}else {
				fquestions.get(i).setIstrue(0);
			}
		}
		exam.getTestpaper().setFquestions(fquestions);
		
		//计算分数
		double totalScore = this.calculateTotalScore(exam);
		exam.setTotalScore(totalScore);
		
		//将结算后的exam放入session
		ServletActionContext.getRequest().getSession().setAttribute("afterExam", exam);
		
		String json = JSON.toJSONString(exam);
		System.out.println(json);
		
		//怎么保存到数据库
		
		
		return "getScore";
	}
	
	/**
	 * 计算考试分数
	 * 
	 * @param exam
	 * @return
	 */
	public double calculateTotalScore(Exam exam) {
		double sTotal = 0.0;
		double mTotal = 0.0;
		double fTotal = 0.0;
		
		double total = 0.0;
		
		List<FillQuestion> fquestions = exam.getTestpaper().getFquestions();
		int score = exam.getTestpaper().getFquestionscore();
		for (FillQuestion fillQuestion : fquestions) {
			fTotal += (score*fillQuestion.getIstrue());
		}
		System.out.println("填空题得分："+fTotal);
		
		List<SingleQuestion> squestions = exam.getTestpaper().getSquestions();
		score = exam.getTestpaper().getSquestionscore();
		for (SingleQuestion singleQuestion : squestions) {
			sTotal += (score*singleQuestion.getIstrue());
		}
		System.out.println("单选题得分："+sTotal);
		
		List<MutipleQuestion> mquestions = exam.getTestpaper().getMquestions();
		score = exam.getTestpaper().getMquestionscore();
		for (MutipleQuestion mutipleQuestion : mquestions) {
			mTotal +=(score*mutipleQuestion.getIstrue());
		}
		System.out.println("双选题得分："+mTotal);
		
		total = sTotal+mTotal+fTotal;
		
		System.out.println("最后得分："+total);
		
		return total;
	}
	
}
