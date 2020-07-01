package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DetailController implements Controller {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("DetailController.process(req, resp) 실행됨...");
		
		return "detail.jsp"; // 내부 이동할 뷰 페이지
	}
}
