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

	/**
	 * ResultSet 객체에 담긴 일정 정보를 Todo 객체로 변환한다.
	 * @param rs 일정 정보를 담고 있는 ResultSet 객체
	 * @return 일정 정보를 담고 있는 Todo 객체
	 * @throws SQLException
	 */
	public Todo resultSetToTodo(ResultSet rs) throws SQLException {
		Todo todo = new Todo();
		
		todo.setNo(rs.getInt("todo_no"));
		todo.setTitle(rs.getString("todo_title"));
		todo.setContent(rs.getString("todo_content"));
		todo.setStatus(rs.getString("todo_status"));
		todo.setDay(rs.getDate("todo_day"));
		todo.setCompletedDay(rs.getDate("todo_completed_day"));
		todo.setCreatedDate(rs.getDate("todo_created_date"));
		todo.setUserId(rs.getString("user_id"));
		
		return todo;
	}
	
	/**
	 * 새로 추가할 Todo의 시퀀스 번호를 조회한다.
	 * @return 시퀀스 번호
	 * @throws SQLException
	 */
	public int getTodoSequence() throws SQLException {
		int todoSequence = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("todo.getTodoSequence"));		
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			todoSequence = rs.getInt("seq");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return todoSequence;
	}
	
	/**
	 * 지정된 Todo객체의 정보를 DB에 저장한다.
	 * @param todo 새 일정 정보
	 * @throws SQLException
	 */
	public void insertTodo(Todo todo) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("todo.insertTodo"));
		pstmt.setInt(1, todo.getNo());
		pstmt.setString(2, todo.getTitle());
		pstmt.setString(3, todo.getContent());
		pstmt.setDate(4, new java.sql.Date(todo.getDay().getTime()));
		pstmt.setString(5, todo.getStatus());
		pstmt.setString(6, todo.getUserId());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	/**
	 * 지정된 일정 정보의 변경 내용을 DB에 반영한다.
	 * @param todo 변경된 정보를 포함하고 있는 일정 정보
	 * @throws SQLException
	 */
	public void updateTodo(Todo todo) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("todo.updateTodo"));
		pstmt.setString(1, todo.getTitle());
		pstmt.setString(2, todo.getContent());
		pstmt.setDate(3, new java.sql.Date(todo.getDay().getTime()));
		pstmt.setDate(4, new java.sql.Date(todo.getCompletedDay().getTime()));
		pstmt.setString(5, todo.getStatus());
		pstmt.setInt(6, todo.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	/**
	 * 지정된 일정 번호에 해당하는 일정 정보를 반환한다.
	 * @param todoNo 일정 번호
	 * @return 일정 정보
	 * @throws SQLException
	 */
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
	
	/**
	 * 지정된 사용자가 등록한 모든 일정을 일정번호의 역순으로 정렬해서 반환한다. 
	 * @param userId 사용자 아이디
	 * @return 해당 사용자가 등록한 모든 일정 정보
	 * @throws SQLException
	 */
	public List<Todo> getTodoListByUserId(String userId) throws SQLException {
		List<Todo> todoList = new ArrayList<Todo>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(QueryUtil.getSQL("todo.getTodoListByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Todo todo = resultSetToTodo(rs);
			todoList.add(todo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return todoList;
	}
}
