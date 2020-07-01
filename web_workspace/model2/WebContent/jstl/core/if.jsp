<%@page import="com.sample.vo.Book"%>
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
			<h1>if 태그</h1>
		</div>
	</div>
	
	<%
		Book book = new Book();
		book.setNo(1001);
		book.setTitle("자바의 정석");
		book.setWriter("남궁성");
		book.setPrice(35000);
		book.setDiscountRate(0.1);
		book.setStock(10);
		book.setSoldOut(false);
		
		request.setAttribute("book", book);
	%>
	
	<div class="row">
		<div class="col-12">
			<table class="table table-bordered">
				<tr>
					<th>제목</th>
					<td><c:out value="${book.title }" /></td>
					<th>저자</th>
					<td><c:out value="${book.writer }" /></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><c:out value="${book.price }" /></td>
					<th>할인가격</th>
					<td>
						<c:if test="${book.discountRate > 0 }">
							${book.price - book.price * book.discountRate } 원
						</c:if>
					</td>
				</tr>
				<tr>
					<th>구매 가능 수량</th>
					<td>
						<c:if test="${book.stock gt 0 }">
							${book.stock } 권 가능
						</c:if>
						<c:if test="${book.stock le 0 }">
							재고 없음
						</c:if>
					</td>
					<th>절판여부</th>
					<td>
						<c:if test="${book.soldOut }">
							<strong class="text-danger">절판</strong>
						</c:if>
						<c:if test="${not book.soldOut }">
							<strong class="text-success">판매중</strong>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>