<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginedYn = (String) session.getAttribute("logined_yn");
	String loginedUserId = (String) session.getAttribute("logined_user_id");
	String loginedUserName = (String) session.getAttribute("logined_user_name");
%>