<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h1>요청파라미터 표현</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<h3>EL로 표현하기</h3>
			<div>번호 : ${param.no}</div>
			<div>검색옵션 : ${param.opt}</div>
			<div>검색어 : ${param.keyword}</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<h3>표현식으로 표현하기</h3>
			<%
				String no = request.getParameter("no");
				String opt = request.getParameter("opt");
				String keyword = request.getParameter("keyword");
			%>
			<div>번호 : <%=no %></div>
			<div>검색옵션 : <%=opt %></div>
			<div>검색어 : <%=keyword %></div>
		</div>
	</div>
</div>
</body>
</html>