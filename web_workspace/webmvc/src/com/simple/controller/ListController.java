package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListController implements Controller {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("ListController.process(req, resp) 실행됨...");
		
		return "list.jsp"; // 내부 이동할 뷰 페이지
	}
}
