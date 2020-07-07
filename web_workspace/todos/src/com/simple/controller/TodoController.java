package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.simple.dto.TodoDto;
import com.simple.service.TodoService;
import com.simple.vo.User;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

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
		
		String statusClass = todoService.setTodoStatus(todoNo, status);
		mav.addAttribute("statusClass", statusClass);
		mav.setView(new JSONView());
		
		return mav;
	}
	
	
}
