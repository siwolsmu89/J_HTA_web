<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request/parameterview</title>
</head>
<body>
	<h1>요청 파라미터의 값을 조회하기</h1>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		String genre = request.getParameter("genre");
		String keyword = request.getParameter("keyword");
	%>
	
	<h3>조회된 요청파라미터 값</h3>
	<p>장르 : <%=genre %></p>
	<p>검색어 : <%=keyword %></p>
	
</body>
</html>