<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<h1>formatDate태그</h1>
		</div>
	</div>
	
	<%
		Date now = new Date();
		request.setAttribute("today", now);
	%>
	<div class="row">
		<div class="col-12">
			<p>${today }</p>
			<p><fmt:formatDate value="${today }" /> </p>
			<p><fmt:formatDate value="${today }" pattern="yyyy-MM-dd" /> </p>
			<p><fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일" /> </p>
			<p><fmt:formatDate value="${today }" pattern="yyyy/MM/dd HH:mm:ss" /> </p>
			<p><fmt:formatDate value="${today }" pattern="a h시 m분 s초" /> </p>
		</div>
	</div>
</div>
</body>
</html>