package com.oes.test;

import java.util.Calendar;

import org.junit.Test;

public class MyTest {
	
	@Test
	public void run() {
		Calendar nowTime = Calendar.getInstance();
		//获取当前时间
		System.out.println(nowTime.getTime());
	}
}
