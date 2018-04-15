package com.oes.bean;

public class Student extends Role {
	
	
	@Override
	public Role login(String name, String password) {
		// TODO Auto-generated method stub
		System.out.println(name+":"+password);
		return null;
	}

}
