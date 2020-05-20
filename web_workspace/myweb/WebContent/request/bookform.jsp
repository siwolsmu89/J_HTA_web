<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request/bookform</title>
</head>
<body>
	<h1>책정보 등록 폼</h1>
	
	<h3>신규 책 정보를 입력하세요</h3>
	<form action="bookregister.jsp" method="post">
		<!-- 
			제목, 저자, 장르, 출판사, 가격, 할인가격, 입고수량을 입력받는 폼을 만든다.
		 -->
		<div>
			<label>책 제목</label>
			<input type="text" name="booktitle" />
		</div>
		<div>
			<label>저자</label>
			<input type="text" name="bookwriter" />
		</div>
		<div>
			<label>장르</label>
			<select name="bookgenre">
				<option value="literature">문학
				<option value="others">비문학
			</select>
		</div>
		<div>
			<label>출판사</label>
			<input type="text" name="bookpublisher" />
		</div>
		<div>
			<label>가격</label>
			<input type="text" name="bookprice" />
		</div>
		<div>
			<label>할인가격</label>
			<input type="text" name="bookdiscountprice" />
		</div>
		<div>
			<label>입고수량</label>
			<input type="text" name="bookstock" />
		</div>
		<div>
			<button type="submit">등록</button>
		</div>
	</form>
</body>
</html>