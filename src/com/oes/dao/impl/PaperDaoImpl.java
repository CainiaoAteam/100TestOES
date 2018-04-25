package com.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.FillQuestion;
import com.oes.bean.MutipleQuestion;
import com.oes.bean.SingleQuestion;
import com.oes.bean.Teacher;
import com.oes.bean.TestPaper;
import com.oes.dao.PaperDao;

public class PaperDaoImpl extends JdbcDaoSupport implements PaperDao {
	
	/**
	 * 不要实现该方法
	 * @param pid
	 * @return
	 */
	public TestPaper getPaperByPid(String tpno) {
		// TODO Auto-generated method stub
		
		return null;
	}

	public TestPaper getPaperByPid(Integer tpid) {
		
		String sql = "select * from testpaper where tpid = ?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[]{tpid};

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
	
		return p;
	}
	
	/**
	 * 根据tid获取对应状态下所有试卷
	 */
	public List<TestPaper> getPapersByStateForTid(int tid, int state) {
		// TODO Auto-generated method stub
		String sql = "select * from testpaper where tid=? and state = ?";
		Object args[] = new Object[] {tid,state};
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		final List<TestPaper> paperlist = new ArrayList<TestPaper>();
		jdbcTemplate.query(sql, args, new RowCallbackHandler(){
	    	 public void processRow(ResultSet rs) throws SQLException {
	 
	    		 do {
		    			 TestPaper p = new TestPaper();
			    		 
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
			    		 
			    		 paperlist.add(p);
		    		 
	    		 }while(rs.next());
	    	 }
	     });

		return paperlist;
	}

	public boolean addTestPaper(TestPaper testPaper) {
		// TODO Auto-generated method stub
		String sql = "insert into testpaper(tpno,tpname,squestion,mquestion,fquestion,"
		+" squestionscore,mquestionscore,fquestionscore,tid,totalscore,state)values(?,?,?,?,?,?,?,?,?,?,?)";
		
JdbcTemplate jdbcTemplate = getJdbcTemplate();

		Object args[] = new Object[] {testPaper.getTpno(),testPaper.getTpname(),testPaper.getSquestion(),
				testPaper.getMquestion(),testPaper.getFquestion(),testPaper.getSquestionscore(),testPaper.getMquestionscore(),
				testPaper.getFquestionscore(),testPaper.getTeacher().getTid(),testPaper.getfTotal(),testPaper.getState()};
		
		int temp = jdbcTemplate.update(sql,args);
		
		if( temp>0) {
			return true;
		}
		return false;
	}

	public List<TestPaper> getPapersByTid(int tid) {
		// TODO Auto-generated method stub
		String sql = "select * from testpaper where tid=?";
		Object args[] = new Object[] {tid};
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		final List<TestPaper> paperlist = new ArrayList<TestPaper>();
		jdbcTemplate.query(sql, args, new RowCallbackHandler(){
	    	 public void processRow(ResultSet rs) throws SQLException {
	 
	    		 do {
		    			 TestPaper p = new TestPaper();
			    		 
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
			    		 
			    		 paperlist.add(p);
		    		 
	    		 }while(rs.next());
	    	 }
	     });

		return paperlist;
	}

	public List<TestPaper> getPapersByState(int state) {
		// TODO Auto-generated method stub
		String sql = "select * from testpaper where state=?";
		Object args[] = new Object[] {state};
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		final List<TestPaper> paperlist = new ArrayList<TestPaper>();
		jdbcTemplate.query(sql, args, new RowCallbackHandler(){
	    	 public void processRow(ResultSet rs) throws SQLException {
	 
	    		 do {
		    			 TestPaper p = new TestPaper();
			    		 
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
			    		 
			    		 paperlist.add(p);
		    		 
	    		 }while(rs.next());
	    	 }
	     });

		return paperlist;
	}
	
}
