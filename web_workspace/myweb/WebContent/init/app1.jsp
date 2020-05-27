<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ServletContext</title>
</head>
<body>
	<h1>ServletContext의 초기화 파라미터 조회하기</h1>
	
	<h3>초기화 파라미터</h3>
	<p>WEB-INF/web.xml 파일에 context-param 태그를 사용해서 설정된 값을 말한다.</p>
	
	<%
		String size = application.getInitParameter("maxUploadFileSize");
		String count = application.getInitParameter("maxUploadFileCount");
	%>
	
	<dl>
		<dt>최대 파일 업로드 사이즈</dt>
		<dd><%=size %></dd>
		<dt>최대 파일 업로드 수</dt>
		<dd><%=count %></dd>
	</dl>
	
</body>
</html>