<%@page import="com.sample.vo.User"%>
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
			<h1>choose, when, otherwise 태그</h1>
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
		
		request.setAttribute("orderBook", book);
		request.setAttribute("orderAmount", 10);
		
		User user = new User();
		user.setId("hong");
		user.setName("홍길동");
		user.setGrade("silver");
		user.setPoint(1000);
		
		session.setAttribute("loginedUser", user);
		session.invalidate();
	%>
	<c:choose>
		<c:when test="${not empty loginedUser }">
			<div class="row">
				<div class="col-12">
					<table class="table table-bordered">
						<tr>
							<th>구매한 도서명</th>
							<td><c:out value="${orderBook.title }" ></c:out></td>
							<th>도서 가격</th>
							<td><c:out value="${orderBook.price } 원" ></c:out></td>
						</tr>
						<tr>
							<th>구매 수량</th>
							<td><c:out value="${orderAmount } 권" ></c:out></td>
							<th>구매 가격</th>
							<td><c:out value="${orderBook.price * orderAmount } 원" ></c:out></td>
						</tr>
						<tr>
							<th>현재 포인트</th>
							<td><c:out value="${loginedUser.point } 점" ></c:out></td>
							<th>적립되는 포인트</th>
							<td>
								<c:choose>
									<c:when test="${loginedUser.grade == 'gold' }">
										${orderBook.price * orderAmount * 0.1 } 점
									</c:when>
									<c:when test="${loginedUser.grade == 'silver' }">
										${orderBook.price * orderAmount * 0.05 } 점
									
									</c:when>
									<c:when test="${loginedUser.grade == 'bronze' }">
										${orderBook.price * orderAmount * 0.03 } 점
									
									</c:when>
									<c:otherwise>
										${orderBook.price * orderAmount * 0.01 } 점
									
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="col-12">
					<div class="alert alert-danger">
						<strong>로그인 필수</strong> 로그인 정보가 없습니다.
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>