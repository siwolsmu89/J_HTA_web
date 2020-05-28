<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 속성 조회하기 </h1>
	
	<%
		String p = (String) pageContext.getAttribute("p");
		String r = (String) request.getAttribute("r");
		String s = (String) session.getAttribute("s");
		String a = (String) application.getAttribute("a");
	%>
	
	<h3>각 스코프별 속성 조회하기</h3>
	<dl>
		<dt>pageContext</dt>
		<dd><%=p %></dd>
		<dt>request</dt>
		<dd><%=r %></dd>
		<dt>session</dt>
		<dd><%=s %></dd>
		<dt>application</dt>
		<dd><%=a %></dd>
	</dl>
</body>
</html>