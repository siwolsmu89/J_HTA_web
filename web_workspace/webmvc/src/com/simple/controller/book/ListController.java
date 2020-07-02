package com.simple.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.controller.Controller;
import com.simple.dao.BookDao;
import com.simple.vo.Book;

public class ListController implements Controller {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("HomeController.process(req, res) 실행됨");
		
		// 모든 책 정보 획득하기
		BookDao bookDao = new BookDao();
		List<Book> books = bookDao.getAllBooks();
		
		// 획득한 책정보를 뷰페이지에 전달하기 위해서 Request에 속성으로 저장하기
		req.setAttribute("books", books);
		
		// 내부이동할 뷰페이지의 이름을 반환하기
		
		return "book/list.jsp";
	}
	
}
