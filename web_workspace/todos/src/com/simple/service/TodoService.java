package com.simple.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.simple.dao.TodoDao;
import com.simple.dto.TodoDto;
import com.simple.vo.Todo;

import kr.co.jhta.util.pagination.Pagination;

public class TodoService {
	
	private TodoDao todoDao = TodoDao.getInstance();
	
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

	public Map<String, Object> getTodoList(String userId, int pageNo, int rows, String status, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 전체 일정 수 조회하기
		int totalRows = todoDao.getTotalRowsOfConditions(userId, status, keyword);
		
		// 페이지네이션 객체 생성하기 (현재 페이지 번호, 표시할 행 수, 전체 데이터 수가 필요함)
		Pagination pagination = new Pagination(pageNo, rows, totalRows);
		int beginIndex = (pageNo - 1) * rows + 1;
		int endIndex = pageNo * rows;
		
		// 조회 조건을 만족하는 일정 목록 조회하기
		List<TodoDto> todoList = todoDao.getTodosOfConditionsByRange(userId, status, keyword, beginIndex, endIndex);
		
		map.put("todos", todoList);
		map.put("pagination", pagination);
		
		return map;
	}
	
}
