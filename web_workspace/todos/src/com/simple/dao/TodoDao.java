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

	// 정적변수 self에 TodoDao 객체를 담아둔다. (정적변수는 클래스 로딩 시 하나만 생성된다)
	private static TodoDao self = new TodoDao(); 
	
	// 생성자의 외부 접근을 차단한다.
	private TodoDao() {} 
	
	// 미리 생성된 TodoDao를 제공하는 기능이다. 객체 외부의 접근을 허용하기 위해 static으로 지정한다.
	public static TodoDao getInstance() {
		return self;
	}
	
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
	
	public int getTotalRowsOfConditions(String userId, String status, String keyword) throws SQLException {
		int totalRows = 0;
		
		String sql = "SELECT count(*) AS cnt FROM sample_todos ";
		sql += "WHERE user_id = '" + userId + "' ";
		if (!"전체".equals(status)) {
			sql += "AND todo_status = '" + status + "' ";
		}
		if (!"".equals(keyword)) {
			sql += "AND todo_title LIKE '%' || '" + keyword + "' || '%' ";
		}
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			totalRows = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return totalRows;
	}
	
	public List<TodoDto> getTodosOfConditionsByRange(String userId, String status, String keyword, int beginIndex, int endIndex) throws SQLException {
		List<TodoDto> todosOfCondition = new ArrayList<TodoDto>();
		
		String sql = "SELECT * FROM (SELECT T.*, U.user_name, ROW_NUMBER() OVER(ORDER BY todo_no DESC) AS RN ";
		sql += "FROM sample_todos T, sample_todo_users U ";
		sql += "WHERE U.user_id = '" + userId + "' ";
		if (!"전체".equals(status)) {
			sql += "AND T.todo_status = '" + status + "' ";
		}
		if (!"".equals(keyword)) {
			sql += "AND T.todo_title LIKE '%' || '" + keyword + "' || '%' ";
		}
		sql += ") WHERE RN BETWEEN " + beginIndex + " AND " +endIndex + " ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			TodoDto todoDto = resultSetToTodoDto(rs);
			todosOfCondition.add(todoDto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return todosOfCondition;
	}
	
}
