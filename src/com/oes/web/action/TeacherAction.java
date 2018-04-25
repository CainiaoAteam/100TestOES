package com.oes.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeFilter;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.oes.bean.FillQuestion;
import com.oes.bean.MutipleQuestion;
import com.oes.bean.PageBean;
import com.oes.bean.Question;
import com.oes.bean.SingleQuestion;
import com.oes.bean.Teacher;
import com.oes.bean.TestPaper;
import com.oes.service.FillService;
import com.oes.service.MutipleService;
import com.oes.service.PaperService;
import com.oes.service.RoleService;
import com.oes.service.SingleService;
import com.opensymphony.xwork2.ActionSupport;

public class TeacherAction extends ActionSupport{
	private SingleQuestion singleQuestion;
	private MutipleQuestion mutipleQuestion;
	private FillQuestion fillQuestion;
	
	private SingleService singleService;
	private MutipleService mutipleService;
	private FillService fillService;
	private PaperService paperService;
	
	private RoleService teacherService;
	private int tid;
	
	private String tno;
	private String newPassword;
	
	private PageBean pageBean;
	
	
	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public MutipleQuestion getMutipleQuestion() {
		return mutipleQuestion;
	}
	public void setMutipleQuestion(MutipleQuestion mutipleQuestion) {
		this.mutipleQuestion = mutipleQuestion;
	}
	public FillQuestion getFillQuestion() {
		return fillQuestion;
	}
	public void setFillQuestion(FillQuestion fillQuestion) {
		this.fillQuestion = fillQuestion;
	}
	public void setSingleService(SingleService singleService) {
		this.singleService = singleService;
	}
	public void setMutipleService(MutipleService mutipleService) {
		this.mutipleService = mutipleService;
	}
	public void setFillService(FillService fillService) {
		this.fillService = fillService;
	}
	public SingleQuestion getSingleQuestion() {
		return singleQuestion;
	}
	public void setSingleQuestion(SingleQuestion singleQuestion) {
		this.singleQuestion = singleQuestion;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public void setTeacherService(RoleService teacherService) {
		this.teacherService = teacherService;
	}
	/**
	 * 根据试卷状态获取试卷
	 * @return
	 */
//	public String getTestPaperByState() {
//		
//		HttpServletResponse response = ServletActionContext.getResponse();
//		//设置编码格式
//		response.setContentType("text/html;charset=utf-8");
//		
//		int state = Integer.parseInt(ServletActionContext.getRequest().getParameter("state"));
//		int who = Integer.parseInt(ServletActionContext.getRequest().getParameter("who"));
//		List<TestPaper> list = paperService.getPapersByStateForTid(who,state);
//		System.out.println(who+":"+state);
//		
//		String json = "";
//		
//		if(list == null) {
//			json = "{\"tip\":\"no\"}";
//			json = JSON.toJSONString(json);
//			
//		}else {
//			json = JSON.toJSONString(list,SerializerFeature.DisableCircularReferenceDetect);
//		}
//		
//		try {
//			response.getWriter().print(json);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return NONE;
//	}
	/**
	 * 获取所有的题目
	 * 
	 * @return
	 */
	public String getAllQuestion() {
		//先获取该老师的单选题
		System.out.println(tid);
		int sTotal = singleService.getSinglesCountByTid(tid);
		List<SingleQuestion> slists = singleService.getSinglesByTid(tid);
		int mTotal = mutipleService.getMutiplesCountByTid(tid);
		List<MutipleQuestion> mlists = mutipleService.getMutiplesByTid(tid);
		int fTotal = fillService.getFillsCountByTid(tid);
		List<FillQuestion> flists = fillService.getFillsByTid(tid);
		
		//组装返回的所有题目
		List<Question> list = new ArrayList<Question>();
		list.addAll(slists);
		list.addAll(mlists);
		list.addAll(flists);
		
		pageBean.setTotalCount(fTotal+mTotal+sTotal);
		pageBean.setPageSize(3);//每页显示3条数据
		pageBean.setBeanList(list);
		
		String json = JSON.toJSONString(pageBean,SerializerFeature.DisableCircularReferenceDetect);
		
		
		
		
		return null;
		
	}
	/**
	 * 添加填空题
	 * @return
	 */
	public String addFill() {
		
		
		boolean issecu = fillService.saveFillQuestion(fillQuestion);
		if(issecu) {
			ServletActionContext.getRequest().getSession().setAttribute("msg", "添加填空题成功！");
			System.out.println(fillQuestion);
			return "addQuestion";
		}
		
		return NONE;
	}
	
	/**
	 * 添加双选 注意要将答案数组解析一下在封装
	 * @return
	 */
	public String addMutiple() {
		
		boolean issecu = mutipleService.saveMutipleQuestion(mutipleQuestion);
		
		if(issecu) {
			ServletActionContext.getRequest().getSession().setAttribute("msg", "添加双选题成功！");
			System.out.println(mutipleQuestion);
			return "addQuestion";
		}
		
		return NONE;
	}
	
	/**
	 * 添加单选、注意获取到的单选对象有两个字段是空的 id 和 no 去业务成封装
	 * 
	 * @return
	 */
	public String addSingle() {
		
		
		boolean issecu = singleService.saveSingleQuestion(singleQuestion);
		if(issecu) {
			ServletActionContext.getRequest().getSession().setAttribute("msg", "添加单选题成功！");
			System.out.println(singleQuestion);
			return "addQuestion";
		}
		
		return NONE;
	}
	public String toAddJsp() {
		if(ServletActionContext.getRequest().getSession().getAttribute("msg") != null) {
			
			ServletActionContext.getRequest().getSession().removeAttribute("msg");
		}
		return "addquestion";
	}
	
	/**
	 * 修改密码
	 * 
	 * @return
	 */
	public String modifyPsw() {
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		Teacher teacher = (Teacher) session.getAttribute("user");
		this.tno = teacher.getTno();
		
		boolean res = teacherService.modifyPassword(tno, newPassword);

		// 修改成功
		if (res) {
			
			teacher = (Teacher) teacherService.getRoleByNoPsw(tno, newPassword);
			session.setAttribute("user", teacher);
			session.setAttribute("modify", "修改成功！");
			
			return "index";
		}

		return null;
	}
}