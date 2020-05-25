<%@page import="com.bookstore.vo.User"%>
<%@page import="com.bookstore.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");	

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	User user = new User();
	user.setId(id);
	user.setPassword(password);
	user.setName(name);
	user.setEmail(email);
	
	UserDAO userDao = new UserDAO();
	userDao.addUser(user);

	response.sendRedirect("/bookstore/user/list.jsp");
%>