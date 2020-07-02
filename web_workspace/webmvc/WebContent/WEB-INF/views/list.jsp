<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<h1>전체 등록된 책 목록</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
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
					<c:forEach var="book" varStatus="num" items="${books }">
						<tr>
							<td>${book.no }</td>
							<td><a  style="color: black;" href="detail.hta?bookno=${book.no }">${book.title }</a></td>
							<td>${book.writer }</td>
							<td><fmt:formatNumber value="${book.price }" pattern="#,###"/> 원</td>
							<td><fmt:formatDate value="${book.registeredDate }" pattern="yyyy.M.d"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="mt-3 text-right">
				<a href="form.hta" class="btn btn-primary">새 책</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>