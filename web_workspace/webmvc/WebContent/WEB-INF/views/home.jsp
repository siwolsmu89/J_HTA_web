<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>홈</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<%@ include file="common/nav.jsp" %>
	<div class="row">
		<div class="col-12">
			<h1>Home</h1>
			<p>${message }</p>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<h3>최근 등록된 책 <small><a class="float-right" href="book/list.hta">더보기</a></small></h3>
			<table class="table table-bordered mt-3">
				<thead>
					<tr>
						<th>순번</th>
						<th>제목</th>
						<th>저자</th>
						<th>가격</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" varStatus="num" items="${recentBooks }">
						<tr>
							<td>${num.count }</td>
							<td>${book.title }</td>
							<td>${book.writer }</td>
							<td><fmt:formatNumber value="${book.price }" pattern="#,###"/> 원</td>
							<td><fmt:formatDate value="${book.registeredDate }" pattern="yyyy.M.d"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>