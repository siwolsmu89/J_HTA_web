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
			<h1>forEach 태그</h1>
		</div>
	</div>
	
	<%
		String[] names = {"김유신", "강감찬", "이순신", "류관순", "홍길동", "안중근", "김구"};
		request.setAttribute("employeeNames", names);
	%>
	
	<div class="row">
		<div class="col-12">
			<h3>배열의 값을 반복해서 출력하기</h3>
			<ul>
				<c:forEach var="name" items="${employeeNames }">
					<li>${name }</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	
	
	<div class="row">
		<div class="col-12">
		
		</div>
	</div>
</div>
</body>
</html>