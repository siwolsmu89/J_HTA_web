package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeController implements Controller {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("HomeController.process(req, resp) 실행됨...");
		
		req.setAttribute("message", "홈페이지 방문을 진심으로 환영합니다!!!");
		
		return "home.jsp";
	}
}
