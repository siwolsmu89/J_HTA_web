package com.simple.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("FrontController.service(req, res) 실행됨...");
		
		String requestURI = req.getRequestURI();
		requestURI = requestURI.replace("/webmvc", "");
		System.out.println("요청 URI: " + requestURI);
		
		String viewPage = null;
		if ("/home.hta".equals(requestURI)) {
			viewPage = "home.jsp";
		} else if ("/list.hta".equals(requestURI)) {
			viewPage = "list.jsp";
		} else if("/detail.hta".equals(requestURI)) {
			viewPage = "detail.jsp";
		} 
		
		if (viewPage != null) {
			// 지정된 viewPage로 내부이동하기
			req.getRequestDispatcher(viewPage).forward(req, resp);
		}

	}
}
