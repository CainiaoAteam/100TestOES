package com.oes.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.oes.bean.Student;
import com.oes.dao.StudentDao;

public class StudentDaoImpl extends JdbcDaoSupport implements StudentDao {

	/**
	 * 这里只要使用学号获取用户即可，因为学号是唯一的
	 * 
	 */
	public boolean isExitBySno(String sno) {
		String sql = "select count(*) from student where sno = ?";

		JdbcTemplate jdbcTemplate = getJdbcTemplate();

		Object args[] = new Object[] { sno };

		int count = jdbcTemplate.queryForObject(sql, args, Integer.class);
		if (count > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 判断用户密码是否正确
	 * 
	 */
	public boolean checkPasswordBySnoPsw(String sno, String password) {
		// TODO Auto-generated method stub

		String sql = "select count(*) from student where sno = ? and password=?";

		JdbcTemplate jdbcTemplate = getJdbcTemplate();

		Object args[] = new Object[] { sno, password };

		int count = jdbcTemplate.queryForObject(sql, args, Integer.class);
		if (count > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 获取学生信息
	 */
	public Student getStudent(String sno, String password) {

		String sql = "select * from student where sno = ? and password=?";

		JdbcTemplate jdbcTemplate = getJdbcTemplate();

		final Student s = new Student();
		final Object args[] = new Object[] { sno, password };

		jdbcTemplate.query(sql, args, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {

				System.out.println("=========" + rs.getString("sname"));
				s.setSno(rs.getString("sno"));
				s.setPassword(rs.getString("password"));
				s.setSname(rs.getString("sname"));
				s.setGender(rs.getString("gender"));
				s.setIdcardnum(rs.getString("idcardnum"));
				s.setDepartment(rs.getString("department"));
				s.setGrade(rs.getString("grade"));
				s.setPhone(rs.getString("phone"));

			}
		});

		return s;
	}

	/**
	 * 更新密码,完成，但修改密码后界面有瑕疵
	 */
	public boolean updatePassword(String sno, String newPassword) {
		/**
		 * 键入更新密码的操作
		 */
		String sql = "update student set password=? where sno=?";
		JdbcTemplate jdbcTemplate = getJdbcTemplate();

		// final Student s = new Student();
		final Object args[] = new Object[] { newPassword, sno };
		jdbcTemplate.update(sql, args);
		return true;
	}

	public Student getStudentById(Integer sid) {
		
	}

}
