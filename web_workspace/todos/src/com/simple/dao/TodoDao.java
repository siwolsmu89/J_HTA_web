package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Todo;

public class TodoDao {

	public void insertTodo(Todo todo) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("todo.insertTodo"));
		pstmt.setString(1, todo.getTitle());
		pstmt.setString(2, todo.getContent());
		pstmt.setDate(3, new java.sql.Date(todo.getDay().getTime()));
		pstmt.setDate(4, new java.sql.Date(todo.getCompletedDay().getTime()));
		pstmt.setString(5, todo.getStatus());
		pstmt.setString(6, todo.getUserId());
	}
	
	public Todo resultSetToTodo(ResultSet rs) throws SQLException {
		Todo todo = new Todo();
		
		todo.setNo(rs.getInt("todo_no"));
		todo.setTitle(rs.getString("todo_title"));
		todo.setContent(rs.getString("todo_content"));
		todo.setDay(rs.getDate("todo_day"));
		todo.setCompletedDay(rs.getDate("todo_completed_day"));
		todo.setStatus(rs.getString("todo_status"));
		todo.setUserId(rs.getString("user_id"));
		todo.setCreatedDate(rs.getDate("todo_created_date"));
		
		return todo;
	}
	
	public List<Todo> getTodosByUserId(String userId) throws SQLException {
		List<Todo> todos = new ArrayList<Todo>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("todo.getTodosByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Todo todo = resultSetToTodo(rs);
			todos.add(todo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
				
		return todos;
	}
}
