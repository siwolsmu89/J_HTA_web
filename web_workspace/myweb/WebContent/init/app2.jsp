<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹 애플리케이션 자원 이용하기</title>
</head>
<body>
	<h1>ServletContext로 웹애플리케이션이 실행중인 환경의 자원 조회하기</h1>
	
	<h3>ServletContext의 자원 접근 메소드 사용하기</h3>
	<%
		String realPath = application.getRealPath("/app2.jsp");
	%>
	<dl>
		<dt>지정된 폴더의 실제 경로 조회하기</dt>
		<dd><%=realPath %></dd>
	</dl>
	
	<h3>ServletContext의 자원 접근 메소드 사용하기</h3>
	<%
		InputStream in = application.getResourceAsStream("/data/sample.txt");
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		
		String text = br.readLine();
		br.close();
	%>
	
	<dl>
		<dt>지정된 경로의 파일 데이터를 읽어오기</dt>
		<dd><%=text %></dd>
	</dl>
	
</body>
</html>