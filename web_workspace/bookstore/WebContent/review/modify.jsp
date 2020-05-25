<%@page import="com.bookstore.dao.ReviewDAO"%>
<%@page import="com.bookstore.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	int bookNo = Integer.parseInt(request.getParameter("bookno"));
	String userId = request.getParameter("userid");
	int point = Integer.parseInt(request.getParameter("point"));
	String content = request.getParameter("content");
	
	Review review = new Review();
	review.setBookNo(bookNo);
	review.setUserId(userId);
	review.setPoint(point);
	review.setContent(content);
	
	ReviewDAO reviewDao = new ReviewDAO();
	reviewDao.updateReview(review);
	
	String redirect = "../book/detail.jsp?bookno=" + bookNo;
	response.sendRedirect(redirect);
%>