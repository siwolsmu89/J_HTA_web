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
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>새 책 입력폼</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<form method="post" action="add.hta">
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" name="title" />
				</div>
				<div class="form-group">
					<label>저자</label>
					<input type="text" class="form-control" name="writer" />
				</div>
				<div class="form-group">
					<label>출판사</label>
					<input type="text" class="form-control" name="publisher" />
				</div>
				<div class="form-group">
					<label>쟝르</label>
					<select class="form-control" name="genre">
						<option value="소설"> 소설</option>
						<option value="인문"> 인문</option>
						<option value="외국어"> 외국어</option>
						<option value="대학교재"> 대학교재</option>
						<option value="IT"> IT</option>
					</select>
				</div>
				<div class="form-group">
					<label>가격</label>
					<input type="number" class="form-control" name="price" />
				</div>
				<div class="form-group">
					<label>할인가격</label>
					<input type="number" class="form-control" name="discountPrice" />
				</div>
				<div class="text-right">
					<a href="list.hta" class="btn btn-secondary">취소</a>
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>












