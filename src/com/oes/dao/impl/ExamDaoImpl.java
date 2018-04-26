package com.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.Exam;
import com.oes.bean.FillQuestion;
import com.oes.bean.MutipleQuestion;
import com.oes.bean.Record; 
import com.oes.bean.SingleQuestion;
import com.oes.bean.Teacher;
import com.oes.bean.TestPaper;
import com.oes.dao.ExamDao;

public class ExamDaoImpl extends JdbcDaoSupport implements ExamDao {

	public List<Exam> getExamByDate(Date date) {
		// TODO Auto-generated method stub
		//注： 这里要对data处理一下，以便于和数据库中的时间对比
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int minute = calendar.get(Calendar.MINUTE);
		calendar.set(Calendar.MINUTE, minute-30);
		String datebefore = sdf.format(calendar.getTime());
		
		System.out.println("30分钟前的时间：" + sdf.format(calendar.getTime()));
		
		String sql = "select * from exam where examday >= ?";
		
		 final List<Exam> examlist = new ArrayList<Exam>();
		 JdbcTemplate jdbcTemplate = getJdbcTemplate();
		 Object args[] = new Object[]{datebefore}; 
		 
		  jdbcTemplate.query(sql,args, new RowCallbackHandler(){  
			  
		       public void processRow(ResultSet rs) throws SQLException {  
		    	   do {
		    		   Exam exam = new Exam();  

		    		   exam.setExamid(rs.getInt("examid"));
		    		   exam.setExamname(rs.getString("examname"));  
		    		   exam.setExamday(rs.getDate("examday"));
		    		   exam.setStartTime(sdf.format(rs.getTimestamp("examday")));
		    		   exam.setExamno(rs.getString("examno"));
		    		   exam.setState(rs.getInt("state"));
		    		   
		    		   int tpid = rs.getInt("tpid");	//获取到试卷id
		    		   TestPaper p = new TestPaper();
		    		   p.setTpid(tpid);	//将id封装到试卷中
		    		   exam.setTestpaper(p);	//将相应的试卷封装到对应的考试中 
		    		   
		    		   Teacher t = new Teacher();
		    		   int tid = rs.getInt("tid");
		    		   t.setTid(tid);
		    		   exam.setTeacher(t);
		    		   
		    		   //System.out.println("获取考试信息:-------"+exam);
		    		   
		    		   examlist.add(exam); 
		    		   
		    	   } while(rs.next());
		    	   
		       }  
		   });  
		
		return examlist;
	}
	
	/**
	 * 获取考试对象
	 * 
	 */
	public Exam getExamById(int examid) {
		
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String sql = "select * from Exam where examid=?";
		Object args[] = new Object[] {examid};
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		final Exam exam = new Exam();
		jdbcTemplate.query(sql,args, new RowCallbackHandler(){  
			  
		       public void processRow(ResultSet rs) throws SQLException {  
		    	   
		    		   exam.setExamid(rs.getInt("examid"));
		    		   exam.setExamname(rs.getString("examname"));  
		    		   exam.setExamday(rs.getDate("examday"));
		    		   exam.setExamtime(rs.getInt("examtime"));
		    		   exam.setStartTime(sdf.format(rs.getTimestamp("examday")));
		    		   exam.setExamno(rs.getString("examno"));
		    		   exam.setState(rs.getInt("state"));
		    		   
		    		   Teacher t = new Teacher();
		    		   int tid = rs.getInt("tid");
		    		   t.setTid(tid);
		    		   exam.setTeacher(t);
		    		   
		    		   TestPaper p = new TestPaper();
		    		   int tpid = rs.getInt("tpid");	//获取到试卷id    		   
		    		   p.setTpid(tpid);	//将id封装到试卷中
		    		   exam.setTestpaper(p);	//将相应的试卷封装到对应的考试中
		  
		       }  
		   });  
		
		return exam;
		
	}
	/**
	 * 根据学生id获取学生考试记录
	 * ----------不实现-------------
	 */
	public List<Record> getRecordBySid(Integer sid) {
		Record re = new Record();
		List<Record> res = new ArrayList<Record>();	
		res.add(re);
		return res;
	}
	/**
	 * 获取该老师对应状态下的考试
	 * @param tid
	 * @param state
	 * @return
	 */
	public List<Exam> getExamsByTidAndState(int tid, int state){
		
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String sql = "select * from exam where tid = ? and state = ?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {tid,state};
		
		final List<Exam> examlist = new ArrayList<Exam>();
		jdbcTemplate.query(sql,args, new RowCallbackHandler(){  
			  
		       public void processRow(ResultSet rs) throws SQLException {  
		    	   do {
		    		   Exam exam = new Exam();  

		    		   exam.setExamid(rs.getInt("examid"));
		    		   exam.setExamname(rs.getString("examname"));  
		    		   exam.setExamday(rs.getDate("examday"));
		    		   exam.setStartTime(sdf.format(rs.getTimestamp("examday")));
		    		   exam.setExamno(rs.getString("examno"));
		    		   exam.setState(rs.getInt("state"));
		    		   
		    		   int tpid = rs.getInt("tpid");	//获取到试卷id
		    		   TestPaper p = new TestPaper();
		    		   p.setTpid(tpid);	//将id封装到试卷中
		    		   exam.setTestpaper(p);	//将相应的试卷封装到对应的考试中
		    		   
		    		   Teacher t = new Teacher();
		    		   int tid = rs.getInt("tid");
		    		   t.setTid(tid);
		    		   exam.setTeacher(t);
		    		   
		    		   //System.out.println("获取考试信息:-------"+exam);
		    		   
		    		   examlist.add(exam); 
		    		   
		    	   } while(rs.next());
		    	   
		       }  
		   });  
		
		return examlist;
		
	}
	/**
	 * 获取该老发布的所有考试
	 * @param tid
	 * @return
	 */
	public List<Exam> getExamsByTid(int tid){
		
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String sql = "select * from exam where tid = ?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {tid};
		
		final List<Exam> examlist = new ArrayList<Exam>();
		jdbcTemplate.query(sql,args, new RowCallbackHandler(){  
			  
		       public void processRow(ResultSet rs) throws SQLException {  
		    	   do {
		    		   Exam exam = new Exam();  

		    		   exam.setExamid(rs.getInt("examid"));
		    		   exam.setExamname(rs.getString("examname"));  
		    		   exam.setExamday(rs.getDate("examday"));
		    		   exam.setStartTime(sdf.format(rs.getTimestamp("examday")));
		    		   exam.setExamno(rs.getString("examno"));
		    		   exam.setState(rs.getInt("state"));
		    		   
		    		   int tpid = rs.getInt("tpid");	//获取到试卷id
		    		   TestPaper p = new TestPaper();
		    		   p.setTpid(tpid);	//将id封装到试卷中
		    		   exam.setTestpaper(p);	//将相应的试卷封装到对应的考试中
		    		   
		    		   Teacher t = new Teacher();
		    		   int tid = rs.getInt("tid");
		    		   t.setTid(tid);
		    		   exam.setTeacher(t);
		    		   
		    		   examlist.add(exam); 
		    		   
		    	   } while(rs.next());
		    	   
		       }  
		   });  
		
		return examlist;
		
		}

	public List<Exam> getExamByDate(int sid, final Date date) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Exam> getExamsByState(int state) {
		// TODO Auto-generated method stub
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String sql = "select * from exam where state = ?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {state};
		
		final List<Exam> examlist = new ArrayList<Exam>();
		jdbcTemplate.query(sql,args, new RowCallbackHandler(){  
			  
		       public void processRow(ResultSet rs) throws SQLException {  
		    	   do {
		    		   Exam exam = new Exam();  

		    		   exam.setExamid(rs.getInt("examid"));
		    		   exam.setExamname(rs.getString("examname"));  
		    		   exam.setExamday(rs.getDate("examday"));
		    		   exam.setStartTime(sdf.format(rs.getTimestamp("examday")));
		    		   exam.setExamno(rs.getString("examno"));
		    		   exam.setState(rs.getInt("state"));
		    		   
		    		   int tpid = rs.getInt("tpid");	//获取到试卷id
		    		   TestPaper p = new TestPaper();
		    		   p.setTpid(tpid);	//将id封装到试卷中
		    		   exam.setTestpaper(p);	//将相应的试卷封装到对应的考试中
		    		   
		    		   Teacher t = new Teacher();
		    		   int tid = rs.getInt("tid");
		    		   t.setTid(tid);
		    		   exam.setTeacher(t);
		    		   
		    		   examlist.add(exam); 
		    		   
		    	   } while(rs.next());	   
		       }  
		   });  
		return examlist;
	}

	public List<Exam> getAllExams() {
		// TODO Auto-generated method stub
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String sql = "select * from exam";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		final List<Exam> examlist = new ArrayList<Exam>();
		jdbcTemplate.query(sql,new RowCallbackHandler(){  
			  
		       public void processRow(ResultSet rs) throws SQLException {  
		    	   do {
		    		  
			    		   Exam exam = new Exam();  
	
			    		   exam.setExamid(rs.getInt("examid"));
			    		   exam.setExamname(rs.getString("examname"));  
			    		   exam.setExamday(rs.getDate("examday"));
			    		   exam.setStartTime(sdf.format(rs.getTimestamp("examday")));
			    		   exam.setExamno(rs.getString("examno"));
			    		   exam.setState(rs.getInt("state"));
			    		   
			    		   int tpid = rs.getInt("tpid");	//获取到试卷id
			    		   TestPaper p = new TestPaper();
			    		   p.setTpid(tpid);	//将id封装到试卷中
			    		   exam.setTestpaper(p);	//将相应的试卷封装到对应的考试中
			    		   
			    		   Teacher t = new Teacher();
			    		   int tid = rs.getInt("tid");
			    		   t.setTid(tid);
			    		   exam.setTeacher(t);
			    		   
			    		   examlist.add(exam); 
		    		   
		    	   } while(rs.next());	   
		       }  
		   });  
		return examlist;
	}

	public boolean saveExam(Exam exam) {
		// TODO Auto-generated method stub
		String sql = "insert into exam(tid,examno,tpid,examday,examtime,examname,state)values(?,?,?,?,?,?,?)";  
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {exam.getTeacher().getTid(),exam.getExamno(),exam.getTestpaper().getTpid(),
				exam.getExamday(),exam.getExamtime(),exam.getExamname(),exam.getState()};
		
		int temp = jdbcTemplate.update(sql, args);
		if( temp>0 )
			return true;
		
		return false;
	}

	
	/**
	 * 保存考试信息，即老师发布考试
	 */
	public boolean addExam(Exam exam) {
		// TODO Auto-generated method stub
		String sql = "insert into exam(tid,examno,tpid,examday,examtime,examname,state)values(?,?,?,?,?,?,?)"; 
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {exam.getTeacher().getTid(),exam.getExamno(),exam.getTestpaper().getTpid(),
				exam.getExamday(),exam.getExamtime(),exam.getExamname(),exam.getState()};
		
		int temp = jdbcTemplate.update(sql, args);
		if( temp>0 )
			return true;
		
		return false;
	}

}
	
	
