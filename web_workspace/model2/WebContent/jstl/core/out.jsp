<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>out 태그</h1>
		</div>
	</div>
	
	<%
		// 이런 부분의 작업은 model2에서 원래 다른 파일로 빠지는 부분. 편의상 한 파일에 작성한 것뿐이다.
		String text = "안녕하세요";
		request.setAttribute("message", text);
		String content = "";
		content += "<script>";
		content += " function 나쁜짓() {";
		content += " alert('시스템 다 망가트릴꺼야!!!');";
		content += "}";
		content += "</script>";
		content += "<button onclick='나쁜짓()'>클릭</button>";
		request.setAttribute("content", content);
		
		String title = "<html> 하루에 끝내기";
		request.setAttribute("bookTitle", title);
	%>
	
	<div class="row">
		<div class="col-12">
			<h3>EL을 사용해서 표현하기</h3>
			<p>${message }</p>
			<p>${content }</p>
			<p>${bookTitle }</p>
			
			<h3>out 태그를 사용해서 표현하기</h3>
			<p><c:out value="${message }" /></p>
			<p><c:out value="${content }" /></p>
			<p><c:out value="${bookTitle }" /></p>
		</div>
	</div>
</div>
</body>
</html>