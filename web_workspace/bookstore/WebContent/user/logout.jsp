<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("userid");
	session.removeAttribute("username");
	session.removeAttribute("login");

	response.sendRedirect("/bookstore/home.jsp");
%>