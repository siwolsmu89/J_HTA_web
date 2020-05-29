package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.User;

public class UserDAO {

	public void addUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.addUser"));
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getName());
		pstmt.setString(3, user.getPassword());
		pstmt.setString(4, user.getEmail());
		
		pstmt.executeUpdate();

		pstmt.close();
		connection.close();
	}
	
	public void updateUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.updateUser"));
		
		String disabled;
		if (user.isDisabled()) {
			disabled = "Y";
		} else {
			disabled = "N";
		}
		
		pstmt.setString(1, user.getName());
		pstmt.setString(2, user.getPassword());
		pstmt.setString(3, user.getEmail());
		pstmt.setString(4, disabled);
		pstmt.setString(5, user.getId());
		
		pstmt.executeUpdate();

		pstmt.close();
		connection.close();
	}
	
	public User getUserById(String userId) throws SQLException {
		User user = new User();

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			user.setId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setDisabled("Y".equals(rs.getString("user_disabled")));
			user.setCreateDate(rs.getDate("user_create_date"));
		}
		
		return user;
	}
	
}
