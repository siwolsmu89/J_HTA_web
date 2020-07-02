package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/home.hta")
	public String home(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		return "home.jsp";
	}
	
}
