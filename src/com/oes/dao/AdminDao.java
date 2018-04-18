package com.oes.dao;

import com.oes.bean.Admin;

public interface AdminDao {
	/**
	 * 检查管理员输入的编号
	 * 
	 * 
	 * @param adminNo
	 * @return
	 */
	boolean checkAdminNo(String adminNo);
	/**
	 * 检查管理员输入的密码
	 * @param adminNo
	 * @param password
	 * @return
	 */
	boolean checkAdminPassword(String adminNo, String password);
	/**
	 * 通过管理员编号和密码获取管理对象
	 * 
	 * @param adminNo
	 * @param password
	 * @return
	 */
	Admin getAdmin4NoPassword(String adminNo, String password);

}
