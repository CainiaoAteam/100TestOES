package com.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.Admin;
import com.oes.bean.Student;
import com.oes.bean.Teacher;
import com.oes.dao.AdminDao;

public class AdminDaoImpl extends JdbcDaoSupport implements AdminDao {
	

	//检查账号是否存在
	public boolean checkAdminNo(String adminNo) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from admin where adminno = ?"; 
		
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
			 
	     Object args[] = new Object[]{adminNo};   
	     
	     int count = jdbcTemplate.queryForObject(sql, args,Integer.class);
		if(count>0) {
			return true;
		}
		return false;
	}
	
	//检查密码是否正确
	public boolean checkAdminPassword(String adminNo, String password) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from admin where adminno = ? and adminpwd=?"; 
		 
		 JdbcTemplate jdbcTemplate = getJdbcTemplate();
			 
	     Object args[] = new Object[]{adminNo,password};  
	     
	     int count = jdbcTemplate.queryForObject(sql, args,Integer.class);
		if(count>0) {
			return true;
		}
		return false;
	}
	
	//获取管理员对象
	public Admin getAdmin4NoPassword(String adminNo, String password) {
		// TODO Auto-generated method stub
		String sql = "select * from admin where adminno = ? and adminpwd = ? "; 
		 
		 JdbcTemplate jdbcTemplate = getJdbcTemplate();
			 
		 final Admin admin = new Admin();
	     final Object args[] = new Object[]{adminNo,password};  
	     
	     jdbcTemplate.query(sql,args,new RowCallbackHandler() {
	    	 public void processRow(ResultSet rs) throws SQLException {
	    		 
	    		 admin.setAdminid(rs.getInt("adminid"));
	    		 admin.setAdminno(rs.getString("adminno"));
	    		 admin.setAdminname(rs.getString("adminname"));
	    		 admin.setAdminpwd(rs.getString("adminpwd"));
	    	 }
	     });
		
		return admin;
	}

	//更改密码
	public boolean updatePassword(String adminno, String newPassword) {
		// TODO Auto-generated method stub
		String sql = "update admin set adminpwd=? where adminno=?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();

		// final Student s = new Student();
		final Object args[] = new Object[] { newPassword, adminno };
		jdbcTemplate.update(sql, args);
		return true;
	}

	//得到学生列表
	public List<Student> getStudents() {
		// TODO Auto-generated method stub
		
		String sql="select * from student";
		
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		final List<Student> stu_list=new ArrayList<Student>();
		
		
		
		Object aObject[] = new Object[] {};
		
		jdbcTemplate.query(sql, aObject,new RowCallbackHandler() {
			
			public void processRow(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				do {
					Student student = new Student();
					student.setSid(rs.getInt("sid"));
					student.setSno(rs.getString("sno"));
					student.setSname(rs.getString("sname"));
					student.setGender(rs.getString("gender"));
					student.setIdcardnum(rs.getString("idcardnum"));
					student.setDepartment(rs.getString("department"));
					student.setGrade(rs.getString("grade"));
					student.setPhone(rs.getString("phone"));
					student.setPassword(rs.getString("password"));
					stu_list.add(student);
				}while(rs.next());
			}
		});
		
		return stu_list;
	}
	
	//得到教师列表
	public List<Teacher> getTeachers() {
		// TODO Auto-generated method stub
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		final List<Teacher> tea_list=new ArrayList<Teacher>();
		
		String sql="select * from teacher";
		
		Object aObject[] = new Object[] {};
		
		jdbcTemplate.query(sql, aObject,new RowCallbackHandler() {
			
			public void processRow(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				do {
					Teacher teacher = new Teacher();
					teacher.setTid(rs.getInt("tid"));
					teacher.setTno(rs.getString("tno"));
					teacher.setTname(rs.getString("tname"));
					teacher.setGender(rs.getString("gender"));
					teacher.setIdcardnum(rs.getString("idcardnum"));
					teacher.setPhone(rs.getString("phone"));
					teacher.setPassword(rs.getString("password"));
					tea_list.add(teacher);
				}while(rs.next());
			}
		});
		
		return tea_list;
	}

	public boolean delStu(int sid) {
		// TODO Auto-generated method stub
		String sql = "delete from student where sid = ?";  
		int temp= this.getJdbcTemplate().update(sql,sid); 
		
		if(temp>0)
			return true;
		else
			return false;
	}

	public boolean delTea(int tid) {
		// TODO Auto-generated method stub
		String sql = "delete from teacher where tid = ?";  
		int temp= this.getJdbcTemplate().update(sql,tid); 
		
		if(temp>0)
			return true;
		else
			return false;
	}

	public List<Student> selStuByKey(String stu_key) {
		// TODO Auto-generated method stub
		String sql="SELECT * FROM student WHERE sid LIKE '%"+stu_key+"%' or sno like '%"+stu_key+
				"%' or sname like '%"+stu_key+"%' or gender like '%"+stu_key+"%' or idcardnum like '%"+
				stu_key+"%' or department like '%"+stu_key+"%' or grade like '%"+stu_key+"%' or phone like '%"+stu_key+"%'";
		
		
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		final List<Student> stu_list=new ArrayList<Student>();
		
		
		
		Object aObject[] = new Object[] {};
		
		jdbcTemplate.query(sql, aObject,new RowCallbackHandler() {
			
			public void processRow(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				do {
					Student student = new Student();
					student.setSid(rs.getInt("sid"));
					student.setSno(rs.getString("sno"));
					student.setSname(rs.getString("sname"));
					student.setGender(rs.getString("gender"));
					student.setIdcardnum(rs.getString("idcardnum"));
					student.setDepartment(rs.getString("department"));
					student.setGrade(rs.getString("grade"));
					student.setPhone(rs.getString("phone"));
					student.setPassword(rs.getString("password"));
					stu_list.add(student);
				}while(rs.next());
			}
		});
		
		return stu_list;
	}

	public List<Teacher> selTeaByKey(String tea_key) {
		// TODO Auto-generated method stub
		String sql="SELECT * FROM teacher WHERE tid LIKE '%"+tea_key+"%' or tno like '%"+tea_key+
				"%' or tname like '%"+tea_key+"%' or gender like '%"+tea_key+"%' or idcardnum like '%"+
				tea_key+"%' or phone like '%"+tea_key+"%'";
		
		//System.out.println(sql);
		
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		final List<Teacher> tea_list=new ArrayList<Teacher>();
		
		
		
		Object aObject[] = new Object[] {};
		
		jdbcTemplate.query(sql, aObject,new RowCallbackHandler() {
			
			public void processRow(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				do {
					Teacher teacher = new Teacher();
					teacher.setTid(rs.getInt("tid"));
					teacher.setTno(rs.getString("tno"));
					teacher.setTname(rs.getString("tname"));
					teacher.setGender(rs.getString("gender"));
					teacher.setIdcardnum(rs.getString("idcardnum"));
					teacher.setPhone(rs.getString("phone"));
					teacher.setPassword(rs.getString("password"));
					tea_list.add(teacher);
				}while(rs.next());
			}
		});
		
		return tea_list;
	}

	public boolean insertStudent(Student s) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO student(sno,sname,gender,department,grade,idcardnum,phone,password) VALUES(?, ?, ?, ?, ?, ?, ?, ?)"; 
		Object aObject[] = new Object[] {s.getSno(),s.getSname(),s.getGender(),
		s.getDepartment(),s.getGrade(),s.getIdcardnum(),s.getPhone(),s.getPassword()};
		int temp= this.getJdbcTemplate().update(sql,aObject); 
		
		if(temp>0)
			return true;
		else
			return false;
	}

	public boolean insertTeacher(Teacher t) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO teacher(tno,tname,gender,idcardnum,phone,password) VALUES(?, ?, ?, ?, ?, ?)"; 
		Object aObject[] = new Object[] {t.getTno(),t.getTname(),t.getGender(),
		t.getIdcardnum(),t.getPhone(),t.getPassword()};
		int temp= this.getJdbcTemplate().update(sql,aObject); 
		
		if(temp>0)
			return true;
		else
			return false;
	}

	public boolean passPaper(int tpid) {
		// TODO Auto-generated method stub
		String sql="UPDATE testpaper SET state=1 where tpid='"+tpid+"'";
		
		int temp= this.getJdbcTemplate().update(sql); 
		if(temp>0)
			return true;
		else
			return false;
	}

	public boolean unpassPaper(int tpid) {
		// TODO Auto-generated method stub
		String sql="UPDATE testpaper SET state=2 where tpid='"+tpid+"'";
		
		int temp= this.getJdbcTemplate().update(sql); 
		if(temp>0)
			return true;
		else
			return false;
	}

}
