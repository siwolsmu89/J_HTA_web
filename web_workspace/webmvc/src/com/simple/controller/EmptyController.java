package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmptyController implements Controller {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("EmptyController.process(req, resp) 실행됨...");
		
		req.setAttribute("message", "There's no accessible page with this address.");
		
		return "empty.jsp"; // 내부 이동할 뷰 페이지
	}
}
