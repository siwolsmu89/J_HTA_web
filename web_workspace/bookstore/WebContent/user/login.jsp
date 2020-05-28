<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="com.bookstore.vo.User"%>
<%@page import="com.bookstore.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = StringUtil.nullToBlank(request.getParameter("userid"));
	String password = StringUtil.nullToBlank(request.getParameter("password"));
	
	UserDAO userDao = new UserDAO();
	User user = userDao.getUserById(userId);
	
	if (user == null) {
		response.sendRedirect("loginform.jsp?err=fail");
		return;
	} 
	
	if  (!password.equals(user.getPassword())) {
		response.sendRedirect("loginform.jsp?err=fail");
		return;
	} 

	session.setAttribute("userid", userId);
	session.setAttribute("username", user.getName());
	session.setAttribute("login", "Yes");
	response.sendRedirect("/bookstore/home.jsp");
	return;

%>