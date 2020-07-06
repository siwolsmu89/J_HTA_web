package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.service.UserService;
import com.simple.vo.User;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class UserController {
	
	private JSONView jsonView = new JSONView();
	private UserService userService = new UserService();
	
	@RequestMapping("/register.hta")
	public ModelAndView registerUser(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		User user = new User();
		user.setId(req.getParameter("id"));
		user.setName(req.getParameter("name"));
		user.setPassword(req.getParameter("pwd"));
		user.setEmail(req.getParameter("email"));
		
		boolean result = userService.addNewUser(user);
		mav.addAttribute("result", result);
		mav.setView(jsonView); // 클라이언트에 jsonText 응답을 제공
		// {"result" : true} 혹은 {"result" : false} JSON Text가 응답으로 제공된다.
		
		return mav;
	}
	
	@RequestMapping("/login.hta")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		User loginUser = userService.loginCheck(id, pwd);
		boolean result = loginUser == null ? false : true;
		
		mav.addAttribute("result", result);
		if (result) {
			req.getSession().setAttribute("loginUser", loginUser);
		}
		
		mav.setView(jsonView);
		
		return mav;
	}
}
