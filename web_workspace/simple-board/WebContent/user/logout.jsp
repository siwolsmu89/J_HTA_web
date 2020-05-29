<%@page import="com.simple.util.StringUtil"%>
<%@page import="com.simple.dao.UserDAO"%>
<%@page import="com.simple.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	session.invalidate();
	
	response.sendRedirect("/simple-board/home.jsp");
%>