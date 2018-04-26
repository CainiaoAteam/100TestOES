package com.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.SingleQuestion;
import com.oes.dao.SingleDao;

public class SingleDaoImpl extends JdbcDaoSupport implements SingleDao {
	
	/**
	 * 保存单选题
	 */
	public boolean saveSingleQuestion(SingleQuestion singleQuestion) {
		// TODO Auto-generated method stub
		
		String sql = "insert into singlequestion(tid,sqno,squestion,schoiceA,schoiceB,"
				+ "schoiceC,schoiceD,sanswer,sexplanation,difficulty)values(?,?,?,?,?,?,?,?,?,?)";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		Object args[] = new Object[] {singleQuestion.getTid(),singleQuestion.getSqno(),singleQuestion.getSquestion(),
				singleQuestion.getSchoiceA(),singleQuestion.getSchoiceB(),singleQuestion.getSchoiceC(),
				singleQuestion.getSchoiceD(),singleQuestion.getSanswer(),singleQuestion.getSexplanation(),singleQuestion.getDifficulty()};
		int temp = jdbcTemplate.update(sql,args);
		
		if( temp>0) {
			return true;
		}
		
		return false;
	}
	
	/**
	 * 根据老师的id获取所有单选题
	 */
	public List<SingleQuestion> getSinglesByTid(int tid) {
		// TODO Auto-generated method stub
		String sql = "select * from singlequestion where tid=?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {tid};
		
		final List<SingleQuestion> sqlist = new ArrayList<SingleQuestion>();
		
		jdbcTemplate.query(sql, args,new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				
				do {
					SingleQuestion sq = new SingleQuestion();
					sq.setSqid(rs.getInt("sqid"));
					sq.setTid(rs.getInt("tid"));
					sq.setSqno(rs.getString("sqno"));
					sq.setSquestion(rs.getString("squestion"));
					sq.setSchoiceA(rs.getString("schoiceA"));
					sq.setSchoiceB(rs.getString("schoiceB"));
					sq.setSchoiceC(rs.getString("schoiceC"));
					sq.setSchoiceD(rs.getString("schoiceD"));
					sq.setSanswer(rs.getString("sanswer"));
					sq.setSexplanation(rs.getString("sexplanation"));
					sq.setDifficulty(rs.getString("difficulty"));
					
					sqlist.add(sq);
					
				}while(rs.next());			
			}
		});
		
		return sqlist;
	}
	
	/**
	 * 获取单选题目数目
	 * 
	 */
	public int getSinglesCountByTid(int tid) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from singlequestion where tid=?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		Object args[] = new Object[] {tid};
		int count = jdbcTemplate.queryForObject(sql, args, Integer.class);
		
		return count;
	}
	
	/**
	 * 已经实现
	 */
	public SingleQuestion getSingleBySqid(int sqid) {
		String sql = "select * from singlequestion where sqid=?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		Object args[] = new Object[] {sqid};
		
		final SingleQuestion sq = new SingleQuestion();
		jdbcTemplate.query(sql, args,new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				
				do {
					sq.setSqid(rs.getInt("sqid"));
					sq.setTid(rs.getInt("tid"));
					sq.setSqno(rs.getString("sqno"));
					sq.setSquestion(rs.getString("squestion"));
					sq.setSchoiceA(rs.getString("schoiceA"));
					sq.setSchoiceB(rs.getString("schoiceB"));
					sq.setSchoiceC(rs.getString("schoiceC"));
					sq.setSchoiceD(rs.getString("schoiceD"));
					sq.setSanswer(rs.getString("sanswer"));
					sq.setSexplanation(rs.getString("sexplanation"));
					sq.setDifficulty(rs.getString("difficulty"));
					
				}while(rs.next());
				
			}
		});
		
		return sq;
	}
	
	public boolean updateSingleBySno(SingleQuestion sq) {
		// TODO Auto-generated method stub
		String sql = "update singlequestion set tid=?,squestion=?,schoiceA=?,schoiceB=?,"
				+ "schoiceC=?,schoiceD=?,sanswer=?,sexplanation=?,difficulty=? where sqno=?";
		
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		Object args[] = new Object[] {sq.getTid(),sq.getSquestion(),sq.getSchoiceA(),
				sq.getSchoiceB(),sq.getSchoiceC(),sq.getSchoiceD(),sq.getSanswer(),sq.getSexplanation(),sq.getDifficulty(),sq.getSqno() };
		
		int temp = jdbcTemplate.update(sql, args);
		if( temp>0 ) {
			return true;
		}		
		return false;
	}

	public boolean updateSingleBySid(SingleQuestion sq) {
		// TODO Auto-generated method stub
		String sql = "update singlequestion set tid=?,sqno=?,squestion=?,schoiceA=?,schoiceB=?,"
				+ "schoiceC=?,schoiceD=?,sanswer=?,sexplanation=?,difficulty=? where sqno=?";
		
		JdbcTemplate jdbcTemplate = getJdbcTemplate();
		
		Object args[] = new Object[] {sq.getTid(),sq.getSqno(),sq.getSquestion(),sq.getSchoiceA(),
				sq.getSchoiceB(),sq.getSchoiceC(),sq.getSchoiceD(),sq.getSanswer(),sq.getSexplanation(),sq.getDifficulty(),sq.getSqid() };
		
		int temp = jdbcTemplate.update(sql, args);
		if( temp>0 ) {
			return true;
		}		
		return false;
	}

	public List<SingleQuestion> getSQByTidAndDiff(Integer tid, String difficulty) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
