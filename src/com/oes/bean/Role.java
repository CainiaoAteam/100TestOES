package com.oes.bean;

/**
 * ���н�ɫ�ĸ���
 * @author Hking
 *
 */
public abstract class Role {
	
	/**
	 * ��¼
	 * 
	 * @param name
	 * @param password
	 * @return
	 */
	abstract public Role login(String name, String password);
}
