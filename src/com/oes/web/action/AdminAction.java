package com.oes.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.oes.bean.Admin;
import com.oes.bean.Student;
import com.oes.bean.Teacher;
import com.oes.bean.TestPaper;
import com.oes.service.PaperService;
import com.oes.service.impl.AdminServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.TextParser;

public class AdminAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String adminno;
	private String newPassword;
	
	private int sid;
	private String sno;
	private String sname;
	private String sgender;
	private String sidcardnum;
	private String department;
	private String grade;
	private String sphone;
	
	private int tid;
	private String tno;
	private String tname;
	private String tgender;
	private String tidcardnum;
	private String tphone;
	
	private int tpid;
	
	
	private String stu_key;
	
	private String tea_key;
	
	
	private AdminServiceImpl adminService;
	
	private PaperService paperService;
	
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	
	public void setSid(int sid) {
		this.sid = sid;
	}
	
	public void setTpid(int tpid) {
		this.tpid = tpid;
	}
	

	public void setSno(String sno) {
		this.sno = sno;
	}


	public void setSname(String sname) {
		this.sname = sname;
	}


	public void setSgender(String sgender) {
		this.sgender = sgender;
	}


	public void setSidcardnum(String sidcardnum) {
		this.sidcardnum = sidcardnum;
	}


	public void setDepartment(String department) {
		this.department = department;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public void setSphone(String sphone) {
		this.sphone = sphone;
	}


	public void setTid(int tid) {
		this.tid = tid;
	}

	

	public void setTno(String tno) {
		this.tno = tno;
	}


	public void setTname(String tname) {
		this.tname = tname;
	}


	public void setTgender(String tgender) {
		this.tgender = tgender;
	}


	public void setTidcardnum(String tidcardnum) {
		this.tidcardnum = tidcardnum;
	}


	public void setTphone(String tphone) {
		this.tphone = tphone;
	}


	public void setStu_key(String stu_key) {
		this.stu_key = stu_key;
	}


	public void setTea_key(String tea_key) {
		this.tea_key = tea_key;
	}


	public void setAdminService(AdminServiceImpl adminService) {
		this.adminService = adminService;
	}

	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}

	/**
	 * 修改密码
	 * @return
	 */
	public String modifyPsw() {
		//1对比旧密码输入是否正确
		//2对比两个新密码是否正确
		//3恢复修改按钮、提示修改成功。。跳转到重新登录页面
		HttpSession session = ServletActionContext.getRequest().getSession();
		Admin admin = (Admin) session.getAttribute("user");
		this.adminno = admin.getAdminno();
		//调用修改密码,业务层事务处理
		boolean res = adminService.modifyPassword(adminno,newPassword);
		
		//修改成功
		if(res) {
			//重新获取学生用户，直接将最新的角色信息放入session
			admin = adminService.getRoleByNoPsw(adminno, newPassword);
			session.setAttribute("user", admin);
			session.setAttribute("modify", "修改成功！");
			//重定向回到学生主页面
			return "index";
		}
		
		return null;
	}
	
	//获取所有学生列表
	public String getAllStudents() {
		//设置编码格式
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		List<Student> stu_list=adminService.getAllStus();
		
		String list = JSON.toJSONString(stu_list);
		
		try {
			PrintWriter writer = response.getWriter();
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
		
	}
	//查找学生列表
	public String findStuByKey() {
		//设置编码格式
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		List<Student> stu_list=adminService.selectStudentByKey(stu_key);
		
		String list = JSON.toJSONString(stu_list);
		try {
			PrintWriter writer = response.getWriter();
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	//获取所有教师列表
	public String getAllTeachers() {
		//设置编码格式
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		List<Teacher> tea_list=adminService.getAllTeas();
		
		String list = JSON.toJSONString(tea_list);
		
		try {
			PrintWriter writer = response.getWriter();
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
		
	}

	public String findTeaByKey() {
		
		//设置编码格式
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		List<Teacher> tea_list=adminService.selectTeacherByKey(tea_key);
		
		String list = JSON.toJSONString(tea_list);
		try {
			PrintWriter writer = response.getWriter();
			//System.out.println("数据已发送！");
			writer.print(list);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//删除学生
	public String delStu() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		boolean res = adminService.deleteStudent(sid);
		if(res) {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("<script>alert('删除成功！');</script>");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("<script>alert('删除失败！');</script>");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "admin";
	}
	//删除学生
	public String delTea() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		boolean res = adminService.deleteTeacher(tid);
		if(res) {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("<script>alert('删除成功！');</script>");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("<script>alert('删除失败！');</script>");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "admin";
		
	}
	
	//添加学生
	public String addAStu() {
		Student student=new Student();
		student.setSno(sno);
		student.setSname(sname);
		student.setGender(sgender);
		student.setDepartment(department);
		student.setGrade(grade);
		student.setIdcardnum(sidcardnum);
		student.setPhone(sphone);
		student.setPassword(sno);
		
		System.out.println(sno+sname);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		boolean res = adminService.addStudent(student);
		if(res) {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("1");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("0");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	//添加教师
	public String addATea() {
		Teacher teacher=new Teacher();
		teacher.setTno(tno);
		teacher.setTname(tname);
		teacher.setGender(tgender);
		teacher.setIdcardnum(tidcardnum);
		teacher.setPhone(tphone);
		teacher.setPassword(tno);
		
		System.out.println(tno+tname);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		boolean res = adminService.addTeacher(teacher);
		if(res) {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("1");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("0");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	//加载试卷
	public String getAllTestPaper() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		List<TestPaper> paper_list=adminService.getAllPaper();
		
		String list = JSON.toJSONString(paper_list);
		
		try {
			PrintWriter writer = response.getWriter();
			writer.print(list);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}
	
	//通过审核
	public String passPaper() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		boolean res = adminService.passThePaper(tpid);
		if(res) {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("1");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("0");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	//不通过审核
	public String unpassPaper() {
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		
		boolean res = adminService.unpassThePaper(tpid);
		if(res) {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("0");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				PrintWriter writer = response.getWriter();
				writer.print("1");
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public String seePaper() {

		TestPaper tp = paperService.getPaperByPid(tpid);
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		session.setAttribute("tea_show", tp);
		
		return "showPaper";
	}
}
