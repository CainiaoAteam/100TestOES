package com.oes.utils;

import java.util.List;
import java.util.UUID;

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
