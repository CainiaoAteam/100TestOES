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
		    		
		    		   exam.setExamname(rs.getString("examname"));  
		    		   exam.setExamday(rs.getDate("examday"));
		    		   exam.setStartTime(sdf.format(rs.getTimestamp("examday")));
		    		   exam.setExamno(rs.getString("examno"));
		    		   
		    		   /**
		    		    * 这部分还没完成
		    		    * 
		    		    */
		    		  /* TestPaper p = new TestPaper();
		    			p.setTpid(12);
		    			exam.setTestpaper(p);*/
		    		   
		    		   examlist.add(exam); 
		    	   } while(rs.next());
		       }  
		   });  
		 
		/*List<Exam> list = new ArrayList<Exam>();
		Exam a1 = new Exam();
		a1.setExamname("测试考试科目一");
		a1.setExamday(new Date());
		a1.setExamid(1);
		//为了方便显示，处理一下时间的格式
		a1.setStartTime(sdf.format(new Date()));
		a1.setExamno("cet4-4122563");
		//a1.setTpid(12);
		TestPaper p1 = new TestPaper();
		p1.setTpid(12);
		a1.setTestpaper(p1);
		
		Exam a2 = new Exam();
		a2.setExamname("测试考试科目二");
		a2.setExamday(new Date());
		a2.setStartTime(sdf.format(new Date()));
		a2.setExamno("cet6-4128963");
		a2.setExamid(2);
		TestPaper p2 = new TestPaper();
		p2.setTpid(13);
		a2.setTestpaper(p2);
		
		Exam a3 = new Exam();
		a3.setExamname("测试考试科目三");
		a3.setExamday(new Date());
		a3.setStartTime(sdf.format(new Date()));
		a3.setExamno("yasi-4128963");
		a3.setExamid(3);
		TestPaper p3 = new TestPaper();
		p3.setTpid(14);
		a3.setTestpaper(p3);
		
		list.add(a1);
		list.add(a2);
		list.add(a3);*/
		
		return examlist;
	}
	
	/**
	 * 获取考试对象
	 * 
	 */
	@Test
	public Exam getExamById(int examid) {
		
		 
		/*String sql = "select examno from Exam where examid=?";
		
		RowMapper<Exam> rowMapper=new BeanPropertyRowMapper<Exam>(Exam.class);
		
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Exam exam= jdbcTemplate.queryForObject(sql, rowMapper,examid);
		
		System.out.println(exam);*/
		
		
		Exam exam = new Exam();
		exam.setExamid(examid);
		exam.setExamtime(30);
		TestPaper p = new TestPaper();
		p.setTpid(12);
		p.setTpname("测试试卷 AAA");
		
		exam.setTestpaper(p);
		return exam;
		
	}
	
	/**
	 * 根据学生id获取学生考试记录
	 * 
	 */
	public List<Record> getRecordBySid(Integer sid) {
		
		Record re = new Record();
		List<Record> res = new ArrayList<Record>();
		
		res.add(re);
		
		
		return res;
	}
	
	
}
