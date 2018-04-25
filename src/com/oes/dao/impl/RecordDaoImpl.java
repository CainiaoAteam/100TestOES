package com.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.Exam;
import com.oes.bean.Record;
import com.oes.bean.Student;
import com.oes.dao.RecordDao;

public class RecordDaoImpl extends JdbcDaoSupport implements RecordDao {

	/**
	 * 测试不通过，不知道是什么原因
	 * 
	 * 
	 */
	@Test
	public void run() {
		saveRecord(5,1,"5556",56);
	}
	
	public boolean saveRecord(Integer examid, Integer sid, String myanswer, double score) {
		// TODO Auto-generated method stub
		
		String sql = "insert into record(examid,sid,myanswer,score)values(?,?,?,?)";  
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {examid,sid,myanswer,score};
		
		int temp = jdbcTemplate.update(sql, args);
		if( temp>0 )
			return true;
		
		return false;
	}

	public Record getRecordById(Integer rid) {
		// TODO Auto-generated method stub
		
		String sql = "select * from record where rid = ?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		final Record record = new Record();
		
		Object args[] = new Object[] {rid};
		jdbcTemplate.query(sql, args, new RowCallbackHandler() {
			
			 public void processRow(ResultSet rs) throws SQLException {  
		      
		           record.setRid(rs.getInt("rid"));  
		           record.setScore(rs.getDouble("score"));
		           record.setMyanswer(rs.getString("myanswer"));
		           
		           Exam exam = new Exam();
		           int examid = rs.getInt("examid");         
		           exam.setExamid(examid);
		           record.setExam(exam);
		           
		           Student student = new Student();
		           int sid = rs.getInt("sid");
		           student.setSid(sid);
		           record.setStudent(student);
		       }  	
			});
		
		return record;
	}
	
	/**
	 * 返回对应的学生的考试记录列表
	 */
	public List<Record> getRecordBySid(Integer sid) {
		// TODO Auto-generated method stub
		String sql = "select * from record where sid = ?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {sid};
		
		final List<Record> recordlist = new ArrayList<Record>();
		jdbcTemplate.query(sql, args, new RowCallbackHandler() {
			
			 public void processRow(ResultSet rs) throws SQLException {  
		           
				 do {
					 
					   Record record = new Record();  
			           record.setRid(rs.getInt("rid"));  
			           record.setScore(rs.getDouble("score"));
			           record.setMyanswer(rs.getString("myanswer"));
			           
			           Exam exam = new Exam();
			           int examid = rs.getInt("examid");         
			           exam.setExamid(examid);
			           record.setExam(exam);
			           
			           Student student = new Student();
			           int sid = rs.getInt("sid");
			           student.setSid(sid);
			           record.setStudent(student);
			           
			           System.out.println("RecordDao获取考试记录：--------"+record);

			           recordlist.add(record); 
					 
				 }while(rs.next());
				    
		       }  	
			});
		
		return recordlist;

	}

	public List<Record> getRecordsByExamId(int examId) {
		// TODO Auto-generated method stub
		String sql = "select * from record where examid=?";
		Object args[] = new Object[] {examId};
		
		final List<Record> recordlist = new ArrayList<Record>();
		this.getJdbcTemplate().query(sql, args,new RowCallbackHandler() {
			
			 public void processRow(ResultSet rs) throws SQLException {  
		      
				 do {
						   Record re= new Record();
						   
						   re.setRid(rs.getInt("rid"));  
				           re.setScore(rs.getDouble("score"));
				           re.setMyanswer(rs.getString("myanswer"));
				           
				           Student student = new Student();
				           int sid = rs.getInt("sid");
				           student.setSid(sid);
				           re.setStudent(student);
				           
				           recordlist.add(re);
	         
				 }while(rs.next());    
		       }  	
			});
		
		return recordlist;
	}

	public Record getRecordByExamId(int ExamId) {
		// TODO Auto-generated method stub
		/*String sql = "select * from record where examid=?";
		Object args[] = new Object[] {ExamId};
		
		final Record record = new Record();
		this.getJdbcTemplate().query(sql, args,new RowCallbackHandler() {
			
			 public void processRow(ResultSet rs) throws SQLException {  
		      
		           record.setRid(rs.getInt("rid"));  
		           record.setScore(rs.getDouble("score"));
		           record.setMyanswer(rs.getString("myanswer"));
		           
		           Student student = new Student();
		           int sid = rs.getInt("sid");
		           student.setSid(sid);
		           record.setStudent(student);
		       }  	
			});
		*/
		return null;
	}

}
