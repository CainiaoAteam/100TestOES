package com.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.FillQuestion;
import com.oes.bean.MutipleQuestion;
import com.oes.dao.FillDao;

public class FillDaoImpl extends JdbcDaoSupport implements FillDao {
	/**
	 * 保存填空题
	 */
	public boolean save(FillQuestion fillQuestion) {
		// TODO Auto-generated method stub
		String sql = "insert into fillquestion(tid,fqno,fquestion,"
				+ "fanswer,fexplanation,difficulty)values(?,?,?,?,?,?)";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		Object args[] = new Object[] {fillQuestion.getTid(),fillQuestion.getFqno(),fillQuestion.getFquestion(),
				fillQuestion.getFanswer(),fillQuestion.getFexplanation(),fillQuestion.getDifficulty()};
		int temp = jdbcTemplate.update(sql,args);
		
		if( temp>0) {
			return true;
		}
		
		return false;
	}
	/**
	 * 根据老师id获取填空题
	 * 
	 */
	public List<FillQuestion> getFillsByTid(int tid) {
		// TODO Auto-generated method stub
		String sql = "select * from fillquestion where tid=?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {tid};
		
		final List<FillQuestion> fqlist = new ArrayList<FillQuestion>();
		
		jdbcTemplate.query(sql, args,new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				
				do {
					FillQuestion fq = new FillQuestion();
					fq.setFqid(rs.getInt("fqid"));
					fq.setTid(rs.getInt("tid"));
					fq.setFqno(rs.getString("fqno"));
					fq.setFquestion(rs.getString("fquestion"));
					fq.setFanswer(rs.getString("fanswer"));
					fq.setFexplanation(rs.getString("fexplanation"));
					fq.setDifficulty(rs.getString("difficulty"));
					
					fqlist.add(fq);
					
				}while(rs.next());
				
			}
		});
		
		return fqlist;
	}
	/**
	 * 获取双选题目数量
	 */
	public int getFillsCountByTid(int tid) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from fillquestion where tid=?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		Object args[] = new Object[] {tid};
		int count = jdbcTemplate.queryForObject(sql, args, Integer.class);
		return count;
	}

	public FillQuestion getFillQuestionById(int id) {
		String sql = "select * from fillquestion where fqid=?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {id};
		
		final FillQuestion fq = new FillQuestion();
		jdbcTemplate.query(sql, args,new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				
				do {
					fq.setFqid(rs.getInt("fqid"));
					fq.setTid(rs.getInt("tid"));
					fq.setFqno(rs.getString("fqno"));
					fq.setFquestion(rs.getString("fquestion"));
					fq.setFanswer(rs.getString("fanswer"));
					fq.setFexplanation(rs.getString("fexplanation"));
					fq.setDifficulty(rs.getString("difficulty"));
					
					
				}while(rs.next());
				
			}
		});
		
		return fq;
	}
	public boolean updateFillByFno(FillQuestion fill) {
		// TODO Auto-generated method stub
		String sql = "update fillquestion set tid=?,fquestion=?,"
				+ "fanswer=?,fexplanation=?,difficulty=? where fqno=?";
		
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		Object args[] = new Object[] {fill.getTid(),fill.getFquestion(),
				fill.getFanswer(),fill.getFexplanation(),fill.getDifficulty(),fill.getFqno() };
		
		int temp = jdbcTemplate.update(sql, args);
		if( temp>0 ) {
			return true;
		}		
		return false;
	}
	public boolean updateFillByMid(FillQuestion fill) {
		// TODO Auto-generated method stub
		String sql = "update fillquestion set tid=?,fqno=?,fquestion=?,"
				+ "fanswer=?,fexplanation=?,difficulty=? where fqid=?";
		
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		Object args[] = new Object[] {fill.getTid(),fill.getFqno(),fill.getFquestion(),
				fill.getFanswer(),fill.getFexplanation(),fill.getDifficulty(),fill.getFqid() };
		
		int temp = jdbcTemplate.update(sql, args);
		if( temp>0 ) {
			return true;
		}		
		return false;
	}
	
}
