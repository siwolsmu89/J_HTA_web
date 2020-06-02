<%@page import="com.simple.util.StringUtil"%>
<%@page import="com.simple.dao.UserDAO"%>
<%@page import="com.simple.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = StringUtil.nullToBlank(request.getParameter("id"));
	String password = StringUtil.nullToBlank(request.getParameter("pwd"));

	UserDAO userDao = new UserDAO();
	User user = userDao.getUserById(userId);
	
	if (user==null) {
		response.sendRedirect("loginform.jsp?error=failed");
		return;
	}
	
	if (user.isDisabled()) {
		response.sendRedirect("loginform.jsp?error=disabled");
		return;
	}
	
	if (!password.equals(user.getPassword())) {
		response.sendRedirect("loginform.jsp?error=failed");
		return;
	}
	
	session.setAttribute("logined_user_id", userId);
	session.setAttribute("logined_user_name", user.getName());
	session.setAttribute("logined_yn", "Y");
	
	response.sendRedirect("/simple-board/home.jsp");
%>