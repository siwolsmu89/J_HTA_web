<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (!"Y".equals(loginedYn)) {
		response.sendRedirect("/simple-board/user/loginform.jsp?error=deny");
		return;
	}
%>