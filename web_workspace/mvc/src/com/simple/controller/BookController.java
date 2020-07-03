package com.simple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.dto.BookDetailDto;
import com.simple.service.BookService;
import com.simple.util.NumberUtil;
import com.simple.vo.Book;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;

@Controller
public class BookController {
	
	private BookService bookService = new BookService();
	
	@RequestMapping("/book/list.hta")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		List<Book> books = bookService.getAllBooks();
		
		mav.setViewName("book/list.jsp");
		mav.addAttribute("books", books);
		
		return mav;
	}
	
	@RequestMapping("/book/detail.hta")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int bookNo = NumberUtil.stringToInt(req.getParameter("bookno"));
		
		BookDetailDto bookDetailDto  = bookService.getBookDetailByNo(bookNo);
		
		mav.setViewName("book/detail.jsp?bookno=" + bookNo);
		mav.addAttribute("book", bookDetailDto.getBook());
		mav.addAttribute("reviews", bookDetailDto.getReviews());
		
		return mav;
	}
		
}
