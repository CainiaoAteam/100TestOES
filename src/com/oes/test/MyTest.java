package com.oes.test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.mchange.v1.db.sql.DriverManagerDataSource;
import com.oes.bean.Teacher;
import com.oes.bean.TestPaper;

public class MyTest extends JdbcDaoSupport {
	
	public static void main(String[] args) {
		
	}
	
	public void run() {
		Calendar nowTime = Calendar.getInstance();
		//获取当前时间
		System.out.println(nowTime.getTime());
	}
	
	@Test
	public void getPaperByPid() {
		
		//int tpid=1;
		String sql = "select * from testpaper where tpid = ?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[]{1};

		final TestPaper p = new TestPaper();
		jdbcTemplate.query(sql,args,new RowCallbackHandler() {
	    	 public void processRow(ResultSet rs) throws SQLException {
	 
	    		 p.setTpid(rs.getInt("tpid"));
	    		 p.setTpno(rs.getString("tpno"));
	    		 p.setTpname(rs.getString("tpname"));
	    		
	    		 p.setSquestion(rs.getString("squestion"));
	    		 p.setMquestion(rs.getString("mquestion"));
	    		 p.setFquestion(rs.getString("fquestion"));
	    		
	    		 p.setSquestionscore(rs.getInt("squestionscore"));
	    		 p.setMquestionscore(rs.getInt("mquestionscore"));
	    		 p.setFquestionscore(rs.getInt("fquestionscore"));
	    		 p.setTotalscore(rs.getInt("totalscore"));;
	    		 p.setTpstate(rs.getInt("state"));
	    		 
	    		 int tid = rs.getInt("tid");
	    		 Teacher t = new Teacher();
	    		 t.setTid(tid);
	    		 p.setTeacher(t);
	    		 
	    		 System.out.println("paperDao获取试卷信息：--------"+p);

	    	 }
	     });
	
	}
}
