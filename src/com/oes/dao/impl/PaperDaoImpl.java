package com.oes.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.FillQuestion;
import com.oes.bean.MutipleQuestion;
import com.oes.bean.SingleQuestion;
import com.oes.bean.TestPaper;
import com.oes.dao.PaperDao;

public class PaperDaoImpl extends JdbcDaoSupport implements PaperDao {
	/**
	 * 不要实现该方法
	 * @param pid
	 * @return
	 */
	public TestPaper getPaperByPid(String pid) {
		// TODO Auto-generated method stub
		
		return null;
	}

	public TestPaper getPaperByPid(Integer pid) {
		TestPaper p = new TestPaper();
		p.setTpname("2018Test 测试 A 卷");

		SingleQuestion sq = new SingleQuestion();
		SingleQuestion sq1 = new SingleQuestion();
		MutipleQuestion mq = new MutipleQuestion();
		MutipleQuestion mq1 = new MutipleQuestion();
		FillQuestion fq = new FillQuestion();
		FillQuestion fq1 = new FillQuestion();
		
		sq.setSquestion("你的选择：");
		sq.setSchoiceA("选项1");
		sq.setSchoiceB("选项2");
		sq.setSchoiceC("选项3");
		sq.setSchoiceD("选项4");
		sq.setSanswer("A");
		sq.setSqid(1);
		
		sq1.setSquestion("你要选哪个？");
		sq1.setSchoiceA("选项1");
		sq1.setSchoiceB("选项2");
		sq1.setSchoiceC("选项3");
		sq1.setSchoiceD("选项4");
		sq1.setSanswer("D");
		sq1.setSqid(2);
		
		List<SingleQuestion> squestions = new ArrayList();
		squestions.add(sq);
		squestions.add(sq1);
		
		mq.setMquestion("你会选哪？");
		mq.setMchoiceA("选项1");
		mq.setMchoiceB("选项2");
		mq.setMchoiceC("选项3");
		mq.setMchoiceD("选项4");
		mq.setManswer("AD");
		mq.setMqid(1);
		
		mq1.setMquestion("你会选则哪？");
		mq1.setMchoiceA("选项1");
		mq1.setMchoiceB("选项2");
		mq1.setMchoiceC("选项3");
		mq1.setMchoiceD("选项4");
		mq1.setManswer("AB");
		mq1.setMqid(2);
		
		List<MutipleQuestion> mlist = new ArrayList();
		mlist.add(mq);
		mlist.add(mq1);
		
		fq.setFquestion("你是傻逼吗？");
		fq.setFanswer("不是");
		fq.setFqid(1);
		fq1.setFquestion("你是傻逼吗？");
		fq1.setFanswer("不是");
		fq1.setFqid(2);
		List<FillQuestion> flist = new ArrayList();
		flist.add(fq);
		flist.add(fq1);
		
		
		p.setFquestions(flist);
		p.setMquestions(mlist);
		p.setSquestions(squestions);
		
		p.setSquestionscore(3);
		p.setMquestionscore(5);
		p.setFquestionscore(10);
		
		p.setSquestionSize(p.getSquestions().size());
		p.setMquestionSize(p.getMquestions().size());
		p.setFquestionSize(p.getFquestions().size());
		
		p.setsTotal(p.getSquestionscore()*p.getSquestionSize());
		p.setmTotal(p.getMquestionSize()*p.getMquestionscore());
		p.setfTotal(p.getFquestionscore()*p.getFquestionSize());
		
		
		
		return p;
	}
	
}
