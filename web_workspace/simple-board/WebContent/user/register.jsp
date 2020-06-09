<%@page import="com.simple.dao.UserDAO"%>
<%@page import="com.simple.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	User user = new User();
	user.setId(request.getParameter("id"));
	user.setPassword(request.getParameter("pwd"));
	user.setName(request.getParameter("name"));
	user.setEmail(request.getParameter("email"));
	
	UserDAO userDao = new UserDAO();
	
	User savedUser = userDao.getUserById(user.getId());
	
	if (savedUser != null) {
		response.sendRedirect("form.jsp?error=dup");
		return;
	}
	
	userDao.insertUser(user);
	response.sendRedirect("/simple-board/home.jsp");
%>