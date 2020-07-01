package com.simple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.dao.BookDao;
import com.simple.vo.Book;

public class HomeController implements Controller {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("HomeController.process(req, res) 실행됨");
		
		req.setAttribute("message", "홈페이지 방문을 진심으로 환영합니다!!!");
		
		// 요청처리를 위한 데이터 휙득
		// 최근 동록된 책 3권 조회
		BookDao bookDao = new BookDao();
		List<Book> recentBooks = bookDao.getRecentBooks();
		
		// 뷰페이지에 획득된 데이터를 전달하기 위해서
		// HttpServletRequest객체에 속성으로 저장
		req.setAttribute("recentBooks", recentBooks);
		
		// 내부이동할 뷰페이지 이름 반환
		return "home.jsp";
	}
	
}
