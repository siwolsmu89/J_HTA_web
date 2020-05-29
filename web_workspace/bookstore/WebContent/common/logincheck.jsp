<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String loginedYn = null;
	String loginedUserId = null;
	String loginedUserName = null;

	loginedYn = (String) session.getAttribute("login");
	loginedUserId = (String) session.getAttribute("userid");
	loginedUserName = (String) session.getAttribute("username");
	
	if (loginedYn == null) {
		response.sendRedirect("/bookstore/user/loginform.jsp?err=deny");
		return;
	}
%>