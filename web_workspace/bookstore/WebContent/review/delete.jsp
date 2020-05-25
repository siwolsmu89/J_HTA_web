<%@page import="com.bookstore.dao.BookDAO"%>
<%@page import="com.bookstore.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	
	
	int bookNo = Integer.parseInt(request.getParameter("bookno"));
	String userId = request.getParameter("userid");
	
	ReviewDAO reviewDao = new ReviewDAO();
	reviewDao.deleteReview(bookNo, userId);
	
	BookDAO bookDao = new BookDAO();
	// bookDao.updatePoint();
	
	String redirect = "../book/detail.jsp?bookno=" + bookNo;
	response.sendRedirect(redirect);
%>