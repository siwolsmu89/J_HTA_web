<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first.jsp</title>
</head>
<body>
	<h1>JSP 프로그램</h1>
	<% 
	int count = 0;
	for (int i = 0; i < 10; i++) {
	%>
	<p>JSP는 클라이언트의 요청을 처리해서 동적 웹 컨텐츠를 제공하는 프로그램이다.</p>
	<% 
	count ++;
	}
	%>
	<p><%=count %></p>
</body>
</html>