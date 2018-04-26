package com.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.MutipleQuestion;
import com.oes.bean.SingleQuestion;
import com.oes.dao.MutipleDao;

/**
 * 注意：在这个dao当中，封装答案，或者获取答案的话都是用到字段manswer,不要用manswers数组那个字段
 * 
 * @author Hking
 *
 */
public class MutipleDaoImpl extends JdbcDaoSupport implements MutipleDao {
	
	/**
	 * 保存双选题
	 */
	public boolean save(MutipleQuestion mutipleQuestion) {
		// TODO Auto-generated method stub
		String sql = "insert into multipquestion(tid,mqno,mquestion,mchoiceA,mchoiceB,"
				+ "mchoiceC,mchoiceD,manswer,mexplanation,difficulty)values(?,?,?,?,?,?,?,?,?,?)";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		Object args[] = new Object[] {mutipleQuestion.getTid(),mutipleQuestion.getMqno(),mutipleQuestion.getMquestion(),
				mutipleQuestion.getMchoiceA(),mutipleQuestion.getMchoiceB(),mutipleQuestion.getMchoiceC(),
				mutipleQuestion.getMchoiceD(),mutipleQuestion.getManswer(),mutipleQuestion.getMexplanation(),mutipleQuestion.getDifficulty()};
		int temp = jdbcTemplate.update(sql,args);
		
		if( temp>0) {
			return true;
		}
		
		return false;
	}
	/**
	 * 根据老师id获取双选题
	 */
	public List<MutipleQuestion> getMutiplesByTid(int tid) {
		// TODO Auto-generated method stub
		String sql = "select * from multipquestion where tid=?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {tid};
		
		final List<MutipleQuestion> mqlist = new ArrayList<MutipleQuestion>();
		
		jdbcTemplate.query(sql, args,new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				
				do {
					MutipleQuestion mq = new MutipleQuestion();
					mq.setMqid(rs.getInt("mqid"));
					mq.setTid(rs.getInt("tid"));
					mq.setMqno(rs.getString("mqno"));
					mq.setMquestion(rs.getString("mquestion"));
					mq.setMchoiceA(rs.getString("mchoiceA"));
					mq.setMchoiceB(rs.getString("mchoiceB"));
					mq.setMchoiceC(rs.getString("mchoiceC"));
					mq.setMchoiceD(rs.getString("mchoiceD"));
					mq.setManswer(rs.getString("manswer"));
					mq.setMexplanation(rs.getString("mexplanation"));
					mq.setDifficulty(rs.getString("difficulty"));
					
					mqlist.add(mq);
					
				}while(rs.next());
				
			}
		});
		
		return mqlist;
	}
	/**
	 * 获取双选题目数量
	 */
	public int getMutiplesCountByTid(int tid) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from multipquestion where tid=?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		Object args[] = new Object[] {tid};
		int count = jdbcTemplate.queryForObject(sql, args, Integer.class);
		
		return count;
	}

	public MutipleQuestion getMutipleById(int id) {
		String sql = "select * from multipquestion where mqid=?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {id};
		
		final MutipleQuestion mq = new MutipleQuestion();
		jdbcTemplate.query(sql, args,new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				
				do {
					mq.setMqid(rs.getInt("mqid"));
					mq.setTid(rs.getInt("tid"));
					mq.setMqno(rs.getString("mqno"));
					mq.setMquestion(rs.getString("mquestion"));
					mq.setMchoiceA(rs.getString("mchoiceA"));
					mq.setMchoiceB(rs.getString("mchoiceB"));
					mq.setMchoiceC(rs.getString("mchoiceC"));
					mq.setMchoiceD(rs.getString("mchoiceD"));
					mq.setManswer(rs.getString("manswer"));
					mq.setMexplanation(rs.getString("mexplanation"));
					mq.setDifficulty(rs.getString("difficulty"));
					
				}while(rs.next());
				
			}
		});
		return mq;
	}
	public boolean updateMutipleByMno(MutipleQuestion mq) {
		// TODO Auto-generated method stub
		String sql = "update multipquestion set tid=?,mquestion=?,mchoiceA=?,mchoiceB=?,"
				+ "mchoiceC=?,mchoiceD=?,manswer=?,mexplanation=?,difficulty=? where mqno=?";
		
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		Object args[] = new Object[] {mq.getTid(),mq.getMquestion(),mq.getMchoiceA(),
				mq.getMchoiceB(),mq.getMchoiceC(),mq.getMchoiceD(),mq.getManswer(),mq.getMexplanation(),mq.getDifficulty(),mq.getMqno() };
		
		int temp = jdbcTemplate.update(sql, args);
		if( temp>0 ) {
			return true;
		}		
		return false;
	}
	public boolean updateMutipleByMid(MutipleQuestion mq) {
		// TODO Auto-generated method stub
		String sql = "update multipquestion set tid=?,mqno=?,mquestion=?,mchoiceA=?,mchoiceB=?,"
				+ "mchoiceC=?,mchoiceD=?,manswer=?,mexplanation=?,difficulty=? where mqid=?";
		
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		Object args[] = new Object[] {mq.getTid(),mq.getMqno(),mq.getMquestion(),mq.getMchoiceA(),
				mq.getMchoiceB(),mq.getMchoiceC(),mq.getMchoiceD(),mq.getManswer(),mq.getMexplanation(),mq.getDifficulty(),mq.getMqid() };
		
		int temp = jdbcTemplate.update(sql, args);
		if( temp>0 ) {
			return true;
		}		
		return false;
	}
	public List<MutipleQuestion> getMQByTidAndDiff(Integer tid, String difficulty) {
		// TODO Auto-generated method stub
		return null;
	}

}
