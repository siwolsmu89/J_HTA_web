package com.simple.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("FrontController.service(req, res) 실행됨...");
		
		// 한글처리를 위한 인코딩방식 지정하기
		req.setCharacterEncoding("utf-8");
		
		String requestURI = req.getRequestURI();
		requestURI = requestURI.replace("/webmvc", "");
		System.out.println("요청 URI: " + requestURI);

		try {
			Controller controller = null;
			if ("/home.hta".equals(requestURI)) {
				controller = new HomeController();
			} else if ("/list.hta".equals(requestURI)) {
				controller = new ListController();
			} else if ("/detail.hta".equals(requestURI)) {
				controller = new DetailController();
			} else if ("/form.hta".equals(requestURI)) {
				controller = new FormController();
			} else if ("/add.hta".equals(requestURI)) {
				controller = new AddController();
			} else {
				controller = new EmptyController();
			}
			
			
			// xxxController의 process(req, res) 메소드 실행해서 요청처리하고, 이동할 뷰페이지 이름 제공받기 
			String path = controller.process(req, resp);
			
			if (path.startsWith("redirect:")) {
				// 재요청 URI를 응답으로 제공
				path = path.replace("redirect:", "");
				resp.sendRedirect(path);
			} else {
				// JSP 페이지로 내부이동
				req.getRequestDispatcher("/WEB-INF/views/" + path).forward(req, resp);
			}
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
