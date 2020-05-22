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
		
		<%
			int bookNo = Integer.parseInt(request.getParameter("bookno"));
			String userId = request.getParameter("userid");
		%>
		
		<div class="body">
			<h3>리뷰 작성 폼</h3>
			<form action="add.jsp" method="post">
				<div class="form-group">
					<label>책 번호</label>
					<input type="text" name="bookno" value="<%=bookNo %>" disabled>
				</div>
				<div class="form-group">
					<label>작성자 ID</label>
					<input type="text" name="userid" value="<%=userId %>" disabled>
				</div>
				<div class="form-group">
					<label>평점</label>
					<select name="point">
						<option value="5">5점</option>
						<option value="4">4점</option>
						<option value="3">3점</option>
						<option value="2">2점</option>
						<option value="1">1점</option>
						<option value="0">0점</option>
					</select>
				</div>
				<div class="form-group">
					<label>리뷰 내용</label>
					<textarea name="content" style="height: 150px;" placeholder="리뷰 작성에 참여해주셔서 감사합니다."></textarea>
				</div>
				<div class="form-group text-right">
					<button type="submit">리뷰 등록</button>
				</div>
			</form>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>