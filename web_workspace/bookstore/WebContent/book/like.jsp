<%@page import="com.bookstore.dao.LikeDAO"%>
<%@page import="com.bookstore.vo.Like"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userid");
	int bookNo = Integer.parseInt(request.getParameter("bookno"));
	
	Like like = new Like();
	like.setUserId(userId);
	like.setBookNo(bookNo);
	
	LikeDAO likeDao = new LikeDAO();
	likeDao.addLike(like);
	
	response.sendRedirect("detail.jsp?bookno="+bookNo);

%>