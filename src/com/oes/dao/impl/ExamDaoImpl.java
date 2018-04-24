package com.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.junit.Test;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
		
		String sql = "select * from exam where examday >= ?";
		
		 final List<Exam> examlist = new ArrayList<Exam>();
		 JdbcTemplate jdbcTemplate = getJdbcTemplate();
		 Object args[] = new Object[]{date}; 
		 
		  jdbcTemplate.query(sql,args, new RowCallbackHandler(){  
			  
		       public void processRow(ResultSet rs) throws SQLException {  
		    	   do {
		    		   Exam exam = new Exam();  

		    		   exam.setExamid(rs.getInt("examid"));
		    		   exam.setExamname(rs.getString("examname"));  
		    		   exam.setExamday(rs.getDate("examday"));
		    		   exam.setStartTime(sdf.format(rs.getTimestamp("examday")));
		    		   exam.setExamno(rs.getString("examno"));
		    		   exam.setExamstate(rs.getInt("examstate"));
		    		   
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
	@Test
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
		    		   exam.setExamstate(rs.getInt("examstate"));
		    		   
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
	
	
}
