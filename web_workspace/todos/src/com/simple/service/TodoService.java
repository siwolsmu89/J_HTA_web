package com.simple.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.simple.dao.TodoDao;
import com.simple.dto.TodoDto;
import com.simple.vo.Todo;

public class TodoService {
	
	private TodoDao todoDao = new TodoDao();
	
	public List<TodoDto> getRecentTodoDtos(int pageNo) throws SQLException {
		List<TodoDto> todoDtos = todoDao.getRecentTodoDtos(pageNo);
		
		return todoDtos;
	}
	
	public TodoDto getTodoDtoByNo(int todoNo) throws SQLException {
		TodoDto todoDto = todoDao.getTodoDtoByNo(todoNo);
		
		return todoDto;
	}
	
	public TodoDto setTodoStatus(int todoNo, String status) throws SQLException {
		Todo todo = todoDao.getTodoByNo(todoNo);
		if ("처리완료".equals(status)) {
			todo.setCompletedDay(new Date());
		} else {
			todo.setCompletedDay(null);
		} 
		todo.setStatus(status);
		todoDao.updateTodo(todo);
		
		TodoDto todoDto = todoDao.getTodoDtoByNo(todoNo);
		
		return todoDto;
	}
}
