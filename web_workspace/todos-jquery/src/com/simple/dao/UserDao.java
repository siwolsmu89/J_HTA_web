package com.simple.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.simple.vo.User;

public class UserDao {
	
	public User resultSetToUser(ResultSet rs) throws SQLException {
		User user = new User();
		
		user.setId(rs.getString("user_id"));
		user.setName(rs.getString("user_name"));
		user.setPassword(rs.getString("user_password"));
		user.setEmail(rs.getString("user_email"));
		user.setCreatedDate(rs.getDate("user_created_date"));
		
		return user;
	}
	
	public void insertUser(User user) throws SQLException {
		
	}

	public User getUserById(String userId) throws SQLException {
		User user = null;
		
		return user;
	}
}

