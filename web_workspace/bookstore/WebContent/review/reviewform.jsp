<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review/reviewform</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "book";
			%>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>리뷰 쓰기</h1>
		</div>
		
		<div class="body">
			<h3>리뷰 작성 폼</h3>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>