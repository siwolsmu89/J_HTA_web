package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.User;

public class UserDAO {

	public User getUserById(String userId) throws SQLException {
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			user = new User();
			
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setPoint(rs.getInt("user_point"));
			user.setPassword(rs.getString("user_password"));
			user.setRegisteredDate(rs.getDate("user_registered_date"));
		}	
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	
	public List<User> getNewUsers() throws SQLException {
		List<User> newUsers = new ArrayList<User>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getNewUsers"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			User user = new User();
			
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setRegisteredDate(rs.getDate("user_registered_date"));
			
			newUsers.add(user);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return newUsers;
	}
	
	public List<User> getAllUsers() throws SQLException {
		List<User> allUsers = new ArrayList<User>();
		

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getAllUsers"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			User user = new User();
			
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setPoint(rs.getInt("user_point"));
			user.setRegisteredDate(rs.getDate("user_registered_date"));
			
			allUsers.add(user);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return allUsers;
	}
	
	public void addUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.addUser"));
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getPassword());
		pstmt.setString(3, user.getName());
		pstmt.setString(4, user.getEmail());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
}
