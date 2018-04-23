package com.oes.utils;

import java.util.List;

import com.oes.bean.FillQuestion;
import com.oes.bean.MutipleQuestion;
import com.oes.bean.SingleQuestion;

/**
 * 考试工具类
 * 
 * @author Hking
 *
 */
public class ExamUtils {
	
	/**
	 * 根据单选答案封装单选题目
	 * 
	 * @param slist
	 * @param sAnswer
	 * @return
	 */
	public static List<SingleQuestion>  packageSingleQuestion(List<SingleQuestion> slist,String sAnswer) {
		String[] sArr = sAnswer.split("-");
		
		for(int i = 0; i<sArr.length;i++) {
			if(sArr[i].equals("")) {
				slist.get(i).setAnswer("没有作答！");
			}else {
				slist.get(i).setAnswer(sArr[i]);
			}
			
			if(sArr[i].equals(slist.get(i).getSanswer())) {
				slist.get(i).setIstrue(1);
			}else {
				slist.get(i).setIstrue(0);
			}
			
		}
		return slist;
		
	}
	
	/**
	 * 根据双选答案封装双题目
	 * 
	 * @param mlist
	 * @param sAnswer
	 * @return
	 */
	public static List<MutipleQuestion>  packageMutipleQuestion(List<MutipleQuestion> mlist,String mAnswer) {
		String[] mArr = mAnswer.split("-");
		
		for(int i = 0; i<mArr.length;i++) {
			if(mArr[i].equals("")) {
				mlist.get(i).setAnswer("没有作答！");
			}else {
				mlist.get(i).setAnswer(mArr[i]);
			}
			
			if(mArr[i].equals(mlist.get(i).getManswer())) {
				mlist.get(i).setIstrue(1);
			}else if(mlist.get(i).getManswer().indexOf(mArr[i])>=0 && mArr[i].length() < mlist.get(i).getManswer().length()){
				mlist.get(i).setIstrue(0.5);
			}else {
				mlist.get(i).setIstrue(0);
			}
			
		}
		return mlist;
		
	}
	/**
	 * 根据填空答案封装填空题目
	 * 
	 * @param flist
	 * @param sAnswer
	 * @return
	 */
	public static List<FillQuestion>  packageFillQuestion(List<FillQuestion> flist,String fAnswer) {
		String[] fArr = fAnswer.split("-");
		
		for(int i = 0; i<fArr.length;i++) {
			if(fArr[i].equals("")) {
				flist.get(i).setAnswer("没有作答！");
			}else {
				flist.get(i).setAnswer(fArr[i]);
			}
			
			if(fArr[i].equals(flist.get(i).getFanswer())) {
				flist.get(i).setIstrue(1);
			}else {
				flist.get(i).setIstrue(0);
			}
		}
		
		return flist;
		
	}

}
