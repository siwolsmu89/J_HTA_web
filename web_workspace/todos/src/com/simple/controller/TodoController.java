package com.simple.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.simple.dto.TodoDto;
import com.simple.service.TodoService;
import com.simple.util.NumberUtil;
import com.simple.util.StringUtil;
import com.simple.vo.User;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.jhta.util.pagination.Pagination;

@Controller
public class TodoController {

	private TodoService todoService = new TodoService();

	@RequestMapping("/todo/detail.hta")
	public ModelAndView detailTodo(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int todoNo = Integer.parseInt(req.getParameter("todono"));
		TodoDto todoDto = todoService.getTodoDtoByNo(todoNo);
		
		HttpSession session = req.getSession(false);
		if (session == null) {
			todoDto.setCanModify(false);
		} else {
			User user = (User) session.getAttribute("loginUser");
			
			if (user == null) {
				todoDto.setCanModify(false);
			} else if (user.getId().equals(todoDto.getUserId())) {
				todoDto.setCanModify(true);
			}
		}
		
		mav.addAttribute("todoDetail", todoDto);
		mav.setView(new JSONView());
		
		return mav;
	}
	
	@RequestMapping("/todo/status.hta")
	public ModelAndView status(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int todoNo = Integer.parseInt(req.getParameter("todono"));
		String status = req.getParameter("status");
		
		TodoDto todoDto = todoService.setTodoStatus(todoNo, status);
		mav.addAttribute("todoDto", todoDto);
		mav.setView(new JSONView());
		
		return mav;
	}
	
	@RequestMapping("/todo/list.hta")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("todos.jsp");
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		
		int pageNo = NumberUtil.stringToInt(req.getParameter("pageNo"), 1);
		int rows = NumberUtil.stringToInt(req.getParameter("rows"), 5);
		String status = StringUtil.nullToValue(req.getParameter("status"), "전체");
		String keyword = StringUtil.nullToBlank(req.getParameter("keyword"));
		
		Map<String, Object> map = todoService.getTodoList(user.getId(), pageNo, rows, status, keyword);
		List<TodoDto> todos = (List<TodoDto>) map.get("todos");
		Pagination pagination = (Pagination) map.get("pagination"); 
		
		mav.addAttribute("todos", todos);
		mav.addAttribute("pagination", pagination);
		
		return mav;
	}
	
}
