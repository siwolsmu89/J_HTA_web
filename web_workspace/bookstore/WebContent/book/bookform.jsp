<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book/bookform</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" >
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>신규도서 정보 입력 폼</h1>
		</div>
		
		<div class="body">
			<h3>신규등록할 도서의 정보를 입력하세요</h3>
			<form class="form-group" action="addbook.jsp" method="post">
				<div>
					<label>제목</label>
					<input type="text" name="title" />
				</div>
				<div>
					<label>저자</label>
					<input type="text" name="writer" />
				</div>
				<div>
					<label>장르</label>
					<select name="genre">
						<option value="소설">소설</option>
						<option value="시">시</option>
						<option value="수필">수필</option>
						<option value="희곡">희곡</option>
						<option value="고전문학">고전문학</option>
						<option value="비문학">비문학</option>
					</select>
				</div>
				<div>
					<label>출판사</label>
					<input type="text" name="publisher" />
				</div>
				<div>
					<label>가격</label>
					<input type="number" name="price" />
				</div>
				<div>
					<label>할인가</label>
					<input type="number" name="discountprice" />
				</div>
				<div>
					<label>수량</label>
					<input type="number" name="stock" />
				</div>
				<div>
					<button type="submit">등록</button>
				</div>
			</form>
		</div>
		<%@ include file="../common/footer.jsp" %>		
	</div>
</body>
</html>