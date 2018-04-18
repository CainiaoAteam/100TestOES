package com.oes.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.oes.bean.Exam;
import com.oes.service.ExamService;
import com.opensymphony.xwork2.ActionSupport;

public class ExamAction extends ActionSupport {
	private String pid;
	
	public void setPid(String pid) {
		this.pid = pid;
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
		
		System.out.println("加载考试事项！！！");
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
		System.out.println(list);
		
		try {
			PrintWriter writer = response.getWriter();
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
	}
	
	public String loadPaper(){
		
		System.out.println(pid);
		
		return "exam";
	}
	
}
