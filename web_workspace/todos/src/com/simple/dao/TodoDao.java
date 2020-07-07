package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.dto.TodoDto;
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
		pstmt.setString(4, todo.getUserId());
		
		pstmt.executeUpdate();

		pstmt.close();
		con.close();
	}
	
	public void updateTodo(Todo todo) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("todo.updateTodo"));
		pstmt.setString(1, todo.getTitle());
		pstmt.setString(2, todo.getContent());
		pstmt.setDate(3, new java.sql.Date(todo.getDay().getTime()));
		if (todo.getCompletedDay() != null) {
			pstmt.setDate(4, new java.sql.Date(todo.getCompletedDay().getTime()));
		} else {
			pstmt.setDate(4, null);
		}
		pstmt.setString(5, todo.getStatus());
		pstmt.setInt(6, todo.getNo());
		
		pstmt.executeUpdate();

		pstmt.close();
		con.close();
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
	
	public TodoDto resultSetToTodoDto(ResultSet rs) throws SQLException {
		TodoDto todoDto = new TodoDto();
		
		todoDto.setNo(rs.getInt("todo_no"));
		todoDto.setTitle(rs.getString("todo_title"));
		todoDto.setContent(rs.getString("todo_content"));
		todoDto.setDay(rs.getDate("todo_day"));
		todoDto.setCompletedDay(rs.getDate("todo_completed_day"));
		todoDto.setStatus(rs.getString("todo_status"));
		todoDto.setUserId(rs.getString("user_id"));
		todoDto.setUserName(rs.getString("user_name"));
		todoDto.setCreatedDate(rs.getDate("todo_created_date"));
		
		return todoDto;
	}
	
	public Todo getTodoByNo(int todoNo) throws SQLException {
		Todo todo = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("todo.getTodoByNo"));
		pstmt.setInt(1, todoNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			todo = resultSetToTodo(rs);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return todo;
	}
	
	public TodoDto getTodoDtoByNo(int todoNo) throws SQLException {
		TodoDto todoDto = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("todo.getTodoDtoByNo"));
		pstmt.setInt(1, todoNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			todoDto = resultSetToTodoDto(rs);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return todoDto;
	}
	
	public List<TodoDto> getRecentTodoDtos(int pageNo) throws SQLException {
		List<TodoDto> todoDtos = new ArrayList<TodoDto>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("todo.getRecentTodoDtos"));
		pstmt.setInt(1, 6 * pageNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			TodoDto todoDto = resultSetToTodoDto(rs);
			todoDtos.add(todoDto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return todoDtos;
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
