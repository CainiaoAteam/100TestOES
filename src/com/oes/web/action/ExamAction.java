package com.oes.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.oes.service.ExamService;
import com.opensymphony.xwork2.ActionSupport;

public class ExamAction extends ActionSupport {
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
		
		//获取当前时间，
		//Date nowTime = 
		System.out.println("加载考试事项！！！");
		
		try {
			PrintWriter writer = ServletActionContext.getResponse().getWriter();
			writer.print(JSON.toJSONString("加载成功！！！"));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return NONE;
	}
}
