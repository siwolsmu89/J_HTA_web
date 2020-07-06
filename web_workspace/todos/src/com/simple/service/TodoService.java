package com.simple.service;

import java.sql.SQLException;
import java.util.List;

import com.simple.dao.TodoDao;
import com.simple.dto.TodoDto;

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
}
