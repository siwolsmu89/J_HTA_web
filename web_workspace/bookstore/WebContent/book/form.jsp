<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book/form</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" >
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
			<h1>신규도서 정보 입력 폼</h1>
		</div>
		
		<div class="body">
			<h3>신규등록할 도서의 정보를 입력하세요</h3>
			<div class="well">
				<form action="register.jsp" method="post">
					<div  class="form-group">
						<label>제목</label>
						<input type="text" name="title" />
					</div>
					<div  class="form-group">
						<label>저자</label>
						<input type="text" name="writer" />
					</div>
					<div  class="form-group">
						<label>장르</label> 
						<div>
							<select name="genre">
								<option disabled selected> -- 선택하세요 -- </option>
								<option value="소설">소설</option>
								<option value="시">시</option>
								<option value="수필">수필</option>
								<option value="희곡">희곡</option>
								<option value="고전문학">고전문학</option>
								<option value="인문">인문</option>
								<option value="경제">경제</option>
								<option value="자연과학/공학">자연과학/공학</option>
								<option value="IT">IT</option>
								<option value="외국어">외국어</option>
								<option value="교재/수험서">교재/수험서</option>
							</select>
						</div>
					</div>
					<div  class="form-group">
						<label>출판사</label>
						<input type="text" name="publisher" />
					</div>
					<div  class="form-group">
						<label>가격</label>
						<input type="number" name="price" />
					</div>
					<div  class="form-group">
						<label>할인가</label>
						<input type="number" name="discountprice" />
					</div>
					<div  class="form-group">
						<label>수량</label>
						<div>
							<select name="stock">
								<option disabled selected> -- 선택하세요 -- </option>
								<option value="10">10</option>				
								<option value="30">30</option>				
								<option value="50">50</option>				
								<option value="100">100</option>				
								<option value="200">200</option>				
							</select>
						</div>
					</div>
					<div class="text-right">
						<button type="submit">등록</button>
					</div>
				</form>
			</div>
		</div>
		<%@ include file="../common/footer.jsp" %>		
	</div>
</body>
</html>