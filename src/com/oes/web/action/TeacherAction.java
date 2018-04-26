package com.oes.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeFilter;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.mchange.lang.StringUtils;
import com.oes.bean.Exam;
import com.oes.bean.FillQuestion;
import com.oes.bean.MutipleQuestion;
import com.oes.bean.PageBean;
import com.oes.bean.Question;
import com.oes.bean.Record;
import com.oes.bean.SingleQuestion;
import com.oes.bean.Teacher;
import com.oes.bean.TestPaper;
import com.oes.service.ExamService;
import com.oes.service.FillService;
import com.oes.service.MutipleService;
import com.oes.service.PaperService;
import com.oes.service.RecordService;
import com.oes.service.RoleService;
import com.oes.service.SingleService;
import com.oes.utils.BasicUtil;
import com.opensymphony.xwork2.ActionSupport;

public class TeacherAction extends ActionSupport{
	private SingleQuestion singleQuestion;
	private MutipleQuestion mutipleQuestion;
	private FillQuestion fillQuestion;
	
	private SingleService singleService;
	private MutipleService mutipleService;
	private FillService fillService;
	private PaperService paperService;
	private ExamService examService;
	private RoleService teacherService;
	private RecordService recordService;
	private int tid;
	private int sqid;
	
	private int mqid;
	private int fqid;
	
	private String tno;
	private String newPassword;
	
	private String difficulty;
	
	private PageBean pageBean;
	
	private TestPaper testPaper;
	
	private Exam exam;
	
	
	
	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}
	public void setExamService(ExamService examService) {
		this.examService = examService;
	}
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	public TestPaper getTestPaper() {
		return testPaper;
	}
	public void setTestPaper(TestPaper testPaper) {
		this.testPaper = testPaper;
	}
	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public void setSqid(int sqid) {
		this.sqid = sqid;
	}
	public void setMqid(int mqid) {
		this.mqid = mqid;
	}
	public void setFqid(int fqid) {
		this.fqid = fqid;
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
	
	//difficulty题目难度
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public void setTeacherService(RoleService teacherService) {
		this.teacherService = teacherService;
	}
	
	public String getExamByState() {
		
		int state = Integer.parseInt(ServletActionContext.getRequest().getParameter("examState"));
		int tid = Integer.parseInt(ServletActionContext.getRequest().getParameter("who"));
		List<Exam> list = null;
		if(state == -1) {
			list = examService.getExamTid(tid);
		}else {
			
			list = examService.getExamByTidAndState(tid, state);
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		//设置编码格式
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter writer = null;
		String json ="";
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(list.size()>0) {
			json = JSON.toJSONString(list);	
			System.out.println(json);
		}else {
			json = "{\"tip\":\"no\"}";
			JSON.toJSONString(json);
		}
		
		writer.println(json);
		return NONE;
	}
	public String addExam() {
		
		System.out.println(exam);
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("user");
		String parameter = ServletActionContext.getRequest().getParameter("formatexamday");
		int tpid = Integer.parseInt(ServletActionContext.getRequest().getParameter("tpid"));
		System.out.println("tpid:"+tpid);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy-MM-dd HH:mm");
		TestPaper paper = new TestPaper();
		paper.setTpid(tpid);
		exam.setTestpaper(paper);
		
		try {
			Date examdate = simpleDateFormat.parse(parameter);
			exam.setExamday(examdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		exam.setTeacher(teacher);
		examService.saveExam(exam);
		
		return "teacher";
	}
	
	/**
	 * 获取相应的考试信息getExamByTid getExamByTid
	 * @return
	 */
	public String getRecordByTid() {
		
		int examid = Integer.parseInt(ServletActionContext.getRequest().getParameter("examid"));
		System.out.println("考试id"+examid);
		List<Record> list = recordService.getRecordByExamId(examid);
		HttpServletResponse response = ServletActionContext.getResponse();
		//设置编码格式
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter writer = null;
		String json ="";
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(list.size()>0) {
			json = JSON.toJSONString(list);	
//			System.out.println(json);
		}else {
			json = "{\"tip\":\"no\"}";
			JSON.toJSONString(json);
		}
		
		writer.println(json);
		return NONE;
	}
	public String getAllExamByTid(){
		int tid = Integer.parseInt(ServletActionContext.getRequest().getParameter("who"));
		
		System.out.println("老师id："+tid);
		
//		List<Exam> list = examService.getExamTid(tid);
		List<Exam> list = examService.getExamByTidAndState(tid, 1);
		
		 
		
		HttpServletResponse response = ServletActionContext.getResponse();
		//设置编码格式
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter writer = null;
		String json ="";
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(list.size()>0) {
			json = JSON.toJSONString(list);		
		}else {
			json = "{\"tip\":\"no\"}";
			JSON.toJSONString(json);
		}
		
		writer.println(json);
		
		return NONE;
	}
	
	/**
	 * 查看试卷
	 * @return
	 */
	public String showPaper() {
		
		int tpid = Integer.parseInt(ServletActionContext.getRequest().getParameter("tpid"));
		TestPaper paper = paperService.getPaperByPid(tpid);
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("tea_show", paper);
		
		return "showPaper";
	}
	
	/**
	 * 根据试卷状态获取试卷
	 * @return
	 */
	public String getPaperIsPass() {
		int paperState = Integer.parseInt(ServletActionContext.getRequest().getParameter("paperState"));
		int tid = Integer.parseInt(ServletActionContext.getRequest().getParameter("who"));
		
		System.out.println("状态："+paperState);
		System.out.println("老师id："+tid);
		
		List<TestPaper> list = paperService.getPapersByStateForTid(tid, paperState);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		//设置编码格式
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter writer = null;
		String json ="";
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(list.size()>0) {
			json = JSON.toJSONString(list);		
		}else {
			json = "{\"tip\":\"no\"}";
			JSON.toJSONString(json);
		}
		
		writer.println(json);
		
		return NONE;
	}
	/**
	 * 发布考试时加载试卷的请求
	 * @return
	 */
	public String getAllPaper() {
		HttpServletResponse response = ServletActionContext.getResponse();
		//设置编码格式
		response.setContentType("text/html;charset=utf-8");
		
		int tid = Integer.parseInt(ServletActionContext.getRequest().getParameter("tid"));
		List<TestPaper> papers = paperService.getPapersByStateForTid(tid, 1);
		//设置编码格式
		
		PrintWriter writer = null;
		String json ="";
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(papers.size()>0) {
			json = JSON.toJSONString(papers);		
		}else {
			json = "{\"tip\":\"no\"}";
			JSON.toJSONString(json);
		}
		writer.println(json);
		
		return NONE;
	}
	
	
	/**
	 * 控制跳转到添加试卷的页面
	 * @return
	 */
	public String addExamPaper() {
		
		//获取关于该老师的单选题目
		Teacher teacher = (Teacher) ServletActionContext.getRequest().getSession().getAttribute("user");
		int tid = teacher.getTid();
		List<SingleQuestion> singles = singleService.getSinglesByTid(tid);
		List<MutipleQuestion> mutiples = mutipleService.getMutiplesByTid(tid);
		List<FillQuestion> fills = fillService.getFillsByTid(tid);
		
		HashMap<String, List<?>> question = new HashMap<String, List<?>>();
		question.put("singles", singles);
		question.put("mutiples", mutiples);
		question.put("fills", fills);
		
		//将题目保存到session中
		ServletActionContext.getRequest().getSession().setAttribute("question", question);
		
		
		return "addExamPaper";
	}
	
	/**
	 * 添加试卷
	 * @return
	 */
	public String addPaper() {
//		System.out.println("添加试卷！");
//		
//		System.out.println(testPaper);
////		
//		System.out.println(testPaper.getTeacher().getTid());
		
		boolean istrue = paperService.addTestPaper(testPaper);
		
		return SUCCESS;
	}
	/**
	 * 根据试卷状态获取试卷
	 * @return
	 */
	public String getTestPaperByState() {
		
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter writer;
		try {
			writer = response.getWriter();
		
			//设置编码格式
			response.setContentType("text/html;charset=utf-8");
			
			int state = Integer.parseInt(ServletActionContext.getRequest().getParameter("state"));
			int who = Integer.parseInt(ServletActionContext.getRequest().getParameter("who"));
			List<TestPaper> list = paperService.getPapersByStateForTid(who,state);
			System.out.println(who+":"+state);
			
			String json = "";
			
			if(list == null) {
				json = "{'tip':'no'}";
				
				json = JSON.toJSONString(json);
				
			}else {
				json = JSON.toJSONString(list,SerializerFeature.DisableCircularReferenceDetect);
			}
			
			writer.print(json);
			writer.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
	}
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
			return "add";
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
			return "add";
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
			return "add";
		}
		
		return NONE;
	}
	/**
	 * 跳转到添加题目页面
	 * @return
	 */
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
	
	/**
	 * 获取该老师的所有单选题
	 * 
	 * @return
	 */
	public String getSQuestion() {
		//设置编码格式
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = ServletActionContext.getRequest().getSession();
		Teacher t=(Teacher)session.getAttribute("user");
		List<SingleQuestion> sq_list;
		//System.out.println(difficulty);
		if(difficulty.equals("全部")) {
			sq_list=singleService.getSinglesByTid(t.getTid());
		}
		//List<SingleQuestion> sq_list=singleService.getSinglesByTid(t.getTid());
		else {
			sq_list=singleService.getSinglesByTidAndDifficulty(t.getTid(),difficulty);
		}
		//List<SingleQuestion> sq_list=singleService.getSinglesByTidAndDifficulty(t.getTid(),difficulty);
		String list = JSON.toJSONString(sq_list);
		try {
			PrintWriter writer = response.getWriter();
			//System.out.println("题目已发送！");
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取该老师的所有双选题
	 * 
	 * @return
	 */
	public String getMQuestion() {
		//设置编码格式
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = ServletActionContext.getRequest().getSession();
		Teacher t=(Teacher)session.getAttribute("user");
		List<MutipleQuestion> mq_list;
		if(difficulty.equals("全部")) {
			mq_list=mutipleService.getMutiplesByTid(t.getTid());
		}
		else {
			mq_list=mutipleService.getMutiplesByTidAndDifficulty(t.getTid(),difficulty);
			
		}
		String list = JSON.toJSONString(mq_list);
		try {
			PrintWriter writer = response.getWriter();
			//System.out.println("题目已发送！");
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取该老师的所有填空题
	 * 
	 * @return
	 */
	public String getFQuestion() {
		//设置编码格式
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = ServletActionContext.getRequest().getSession();
		Teacher t=(Teacher)session.getAttribute("user");
		List<FillQuestion> fq_list;
		if(difficulty.equals("全部")) {
			fq_list=fillService.getFillsByTid(t.getTid());
		}else {
			fq_list=fillService.getFillsByTidAndDifficulty(t.getTid(),difficulty);
		}
		 
		String list = JSON.toJSONString(fq_list);
		try {
			PrintWriter writer = response.getWriter();
			//System.out.println("题目已发送！");
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public String getOneSQ() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = ServletActionContext.getRequest().getSession();
		SingleQuestion sQuestion=singleService.getSingleById(sqid);
		session.setAttribute("updataid", sQuestion.getSqid());
		session.setAttribute("updatano", sQuestion.getSqno());
		String list = JSON.toJSONString(sQuestion);
		try {
			PrintWriter writer = response.getWriter();
			//System.out.println(list);
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public String getOneMQ() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = ServletActionContext.getRequest().getSession();
		MutipleQuestion mQuestion=mutipleService.getMutipleById(mqid);
		session.setAttribute("updataid", mQuestion.getMqid());
		session.setAttribute("updatano", mQuestion.getMqno());
		String list = JSON.toJSONString(mQuestion);
		try {
			PrintWriter writer = response.getWriter();
			//System.out.println(list);
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public String getOneFQ() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = ServletActionContext.getRequest().getSession();
		FillQuestion fQuestion=fillService.getFillById(fqid);
		session.setAttribute("updataid", fQuestion.getFqid());
		session.setAttribute("updatano", fQuestion.getFqno());
		String list = JSON.toJSONString(fQuestion);
		try {
			PrintWriter writer = response.getWriter();
			//System.out.println(list);
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	public String updataSQ() {
		//System.out.println(singleQuestion.getSquestion());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = ServletActionContext.getRequest().getSession();
		int qid=(Integer)session.getAttribute("updataid");
		String qno=(String) session.getAttribute("updatano");
		Teacher t=(Teacher)session.getAttribute("user");
		singleQuestion.setSqid(qid);
		singleQuestion.setSqno(qno);
		singleQuestion.setTid(t.getTid());
		boolean issecu = singleService.updataSingleQuestion(singleQuestion);
		//System.out.println(singleQuestion.getSquestion());
		if(issecu) {
			try {
				PrintWriter writer = response.getWriter();
				//System.out.println(list);
				writer.print("1");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				PrintWriter writer = response.getWriter();
				//System.out.println(list);
				writer.print("0");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public String updataMQ() {
			
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = ServletActionContext.getRequest().getSession();
		int qid=(Integer)session.getAttribute("updataid");
		String qno=(String) session.getAttribute("updatano");
		Teacher t=(Teacher)session.getAttribute("user");
		mutipleQuestion.setMqid(qid);
		mutipleQuestion.setMqno(qno);
		mutipleQuestion.setTid(t.getTid());
		
		boolean issecu = mutipleService.updataMutipleQuestion(mutipleQuestion);
		if(issecu) {
			try {
				PrintWriter writer = response.getWriter();
				//System.out.println(list);
				writer.print("1");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				PrintWriter writer = response.getWriter();
				//System.out.println(list);
				writer.print("0");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public String updataFQ() {
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = ServletActionContext.getRequest().getSession();
		int qid=(Integer)session.getAttribute("updataid");
		String qno=(String) session.getAttribute("updatano");
		Teacher t=(Teacher)session.getAttribute("user");
		fillQuestion.setFqid(qid);
		fillQuestion.setFqno(qno);
		fillQuestion.setTid(t.getTid());
		boolean issecu = fillService.updataFillQuestion(fillQuestion);
		if(issecu) {
			try {
				PrintWriter writer = response.getWriter();
				//System.out.println(list);
				writer.print("1");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				PrintWriter writer = response.getWriter();
				//System.out.println(list);
				writer.print("0");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public String delectSQuestion() {
		System.out.println(sqid);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		boolean issecu = singleService.delectSQBySqid(sqid);
		if(issecu) {
			try {
				PrintWriter writer = response.getWriter();
				//System.out.println(list);
				writer.print("1");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				PrintWriter writer = response.getWriter();
				//System.out.println(list);
				writer.print("0");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return null;
	}
	public String delectMQuestion() {
			
		System.out.println(mqid);	
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		boolean issecu = mutipleService.delectMQByMqid(mqid);
		if(issecu) {
			try {
				PrintWriter writer = response.getWriter();
				//System.out.println(list);
				writer.print("1");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				PrintWriter writer = response.getWriter();
				//System.out.println(list);
				writer.print("0");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		return null;
	}
	public String delectFQuestion() {
		
		System.out.println(fqid);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		boolean issecu = fillService.delectFQByFqid(fqid);
		if(issecu) {
			try {
				PrintWriter writer = response.getWriter();
				//System.out.println(list);
				writer.print("1");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				PrintWriter writer = response.getWriter();
				//System.out.println(list);
				writer.print("0");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		return null;
	}
}
