package com.simple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.dto.TodoDto;
import com.simple.service.TodoService;
import com.simple.vo.Todo;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class HomeController {
	
	private TodoService todoService = new TodoService();
	
	@RequestMapping("/home.hta")
	public ModelAndView home(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();

		int pageNo = req.getParameter("pageno") == null ? 1 : Integer.parseInt(req.getParameter("pageno"));
		List<TodoDto> todoDtos = todoService.getRecentTodoDtos(pageNo);
		
		req.setAttribute("todoDtos", todoDtos);
		mav.setViewName("home.jsp");
		
		return mav;
	}
	
	@RequestMapping("/detailtodo.hta")
	public ModelAndView detailTodo(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int todoNo = Integer.parseInt(req.getParameter("todono"));
		TodoDto todoDto = todoService.getTodoDtoByNo(todoNo);
		
		mav.addAttribute("todoDetail", todoDto);
		mav.setView(new JSONView());
		
		return mav;
	}
	
}
