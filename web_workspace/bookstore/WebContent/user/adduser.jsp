<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");	

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	response.sendRedirect("/bookstore/user/users.jsp");
%>