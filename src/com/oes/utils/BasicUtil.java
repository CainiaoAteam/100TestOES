package com.oes.utils;

import java.util.List;
import java.util.UUID;

import org.junit.Test;

import com.oes.bean.Exam;
import com.oes.bean.FillQuestion;
import com.oes.bean.MutipleQuestion;
import com.oes.bean.SingleQuestion;

public class BasicUtil {
	
	/**
	 * 生成uuid
	 * @return
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString();
	}
	/**
	 * 字符串拼接
	 * @param js
	 * @param flag
	 * @return
	 */
	public static String join( int[] js , String flag ){  
        StringBuffer str_buff = new StringBuffer();  
        
        for(int i=0 , len=js.length ; i<len ; i++){  
            str_buff.append( String.valueOf( js[i] ) );  
            if(i<len-1)str_buff.append( flag );  
        }  
       
        return str_buff.toString();   
    }
	public static String join( String[] js , String flag ){  
        StringBuffer str_buff = new StringBuffer();  
        
        for(int i=0 , len=js.length ; i<len ; i++){  
            str_buff.append( String.valueOf( js[i] ) );  
            if(i<len-1)str_buff.append( flag );  
        }  
       
        return str_buff.toString();   
    }
	
	/**
	 * 合理化答案
	 * @param size	题目数目
	 * @param answer 题目拼接之后的答案 ----
	 */
	public static String packageAnwser(String answer) {
		//将字符串义-分割
		String[] split = answer.split("-");
		
		//改装字符串
		for(int i=0; i<split.length;i++) {
			//如果长度大于1说明有答案
			if(split[i].length() == 1) {
				split[i]="没有作答！";
			}else {
				//有答案,去掉*号
				split[i] = split[i].substring(1);
			}
		}
		
		//还原字符串
		return BasicUtil.join(split, "-");
	}
	public static String packageAnswerToDB(String answer) {
		String[] allAnswer = answer.split("##");
		allAnswer[0] = BasicUtil.packageAnwser(allAnswer[0]);
		allAnswer[1] = BasicUtil.packageAnwser(allAnswer[1]);
		
		System.out.println("单选："+allAnswer[0]);
		System.out.println("双选："+allAnswer[1]);
		System.out.println("填空："+allAnswer[2]);
		
		//组装保存到数据库中答案
		answer = BasicUtil.join(allAnswer, "##");
		
		return answer;
	}
	
	/**
	 * 计算考试分数
	 * 
	 * @param exam
	 * @return
	 */
	public static double calculateTotalScore(Exam exam) {
		double sTotal = 0.0;
		double mTotal = 0.0;
		double fTotal = 0.0;
		
		double total = 0.0;
		
		List<FillQuestion> fquestions = exam.getTestpaper().getFquestions();
		int score = exam.getTestpaper().getFquestionscore();
		for (FillQuestion fillQuestion : fquestions) {
			fTotal += (score*fillQuestion.getIstrue());
		}
		System.out.println("填空题得分："+fTotal);
		
		List<SingleQuestion> squestions = exam.getTestpaper().getSquestions();
		score = exam.getTestpaper().getSquestionscore();
		for (SingleQuestion singleQuestion : squestions) {
			sTotal += (score*singleQuestion.getIstrue());
		}
		System.out.println("单选题得分："+sTotal);
		
		List<MutipleQuestion> mquestions = exam.getTestpaper().getMquestions();
		score = exam.getTestpaper().getMquestionscore();
		for (MutipleQuestion mutipleQuestion : mquestions) {
			mTotal +=(score*mutipleQuestion.getIstrue());
		}
		System.out.println("双选题得分："+mTotal);
		
		total = sTotal+mTotal+fTotal;
		
		System.out.println("最后得分："+total);
		
		return total;
	}

}
