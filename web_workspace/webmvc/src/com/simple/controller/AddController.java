package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.dao.BookDao;
import com.simple.util.NumberUtil;
import com.simple.vo.Book;

public class AddController implements Controller{
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("AddController.process(req, res) 실행됨");
		
		// 입력폼의 입력값 조회하기
		String title = req.getParameter("title");
		String writer = req.getParameter("writer");
		String genre = req.getParameter("genre");
		String publisher = req.getParameter("publisher");
		int price = NumberUtil.stringToInt(req.getParameter("price"));
		int discountPrice = NumberUtil.stringToInt(req.getParameter("discountPrice"));
		
		// Book객체 생성해서 입력값 담기
		Book book = new Book();
		book.setTitle(title);
		book.setWriter(writer);
		book.setGenre(genre);
		book.setPublisher(publisher);
		book.setPrice(price);
		book.setDiscountPrice(discountPrice);
		
		// DB에 책정보 저장하기
		BookDao bookDao = new BookDao();
		bookDao.insertBook(book);
		
		// 재요청할 URI를 반환
		return "redirect:list.hta";
	}
}
