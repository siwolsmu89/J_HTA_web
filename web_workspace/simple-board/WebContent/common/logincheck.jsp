<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (!"Y".equals(session.getAttribute("logined_yn"))) {
		response.sendRedirect("/simple-board/user/loginform.jsp?error=deny");
		return;
	}
	
	String userId = (String) session.getAttribute("logined_user_id");
	String userName = (String) session.getAttribute("logined_user_name");
%>