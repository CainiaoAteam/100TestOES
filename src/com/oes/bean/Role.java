package com.oes.bean;

/**
 * 所有角色的父类
 * @author Hking
 *
 */
public abstract class Role {
	
	/**
	 * 子类需要实现的抽象登录方法
	 * 
	 * @param name
	 * @param password
	 * @return
	 */
	abstract public Role login(String name, String password);
}
