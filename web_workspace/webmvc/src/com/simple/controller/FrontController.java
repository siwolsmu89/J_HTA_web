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
		
		// 클라이언트의 요청 분석하기
		String requestURI = req.getRequestURI();
		requestURI = requestURI.replace("/webmvc", "");
		System.out.println("요청 URI: " + requestURI);
		
		try {
			Controller controller = null;
			
			// 요청 URI에 해당하는 요청을 처리할 적절한 컨트롤러 객체 생성하기
			if ("/home.hta".equals(requestURI)) {
				controller = new HomeController();
			} else if ("/list.hta".equals(requestURI)) {
				controller = new ListController();
			} else if ("/detail.hta".equals(requestURI)) {
				controller = new DetailController();
			} else {
				controller = new EmptyController();
			}
			
			// xxxController의 process(req, resp) 메소드를 실행해 요청을 처리하고 이동할 뷰 페이지 이름을 제공받기
			String path = controller.process(req, resp);
			
			// 내부 이동시키기
			req.getRequestDispatcher("WEB-INF/views/" + path).forward(req, resp);
			
		} catch(Exception e) {
			throw new ServletException(e);
		}

	}
}
