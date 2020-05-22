<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order/order</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "order";
			%>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>주문</h1>
		</div>
		
		<div class="body">
			<div>
				<h3>회원조회</h3>
			</div>
			
			<div>
				<h3>주문내역</h3>
			</div>
			
			<div>
				<button type="button"><a href="http://localhost/bookstore/review/reviewform.jsp">리뷰쓰기</a></button>
			</div>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>