<%@page import="com.bookstore.dto.BookDetailDTO"%>
<%@page import="com.bookstore.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review/form</title>
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
			BookDAO bookDao = new BookDAO();
			BookDetailDTO book = bookDao.getBookByNo(bookNo);
			String userId = request.getParameter("userid");
		%>
		
		<div class="body">
			<h3>리뷰 작성 폼</h3>
			<form action="register.jsp" method="post">
				<div class="form-group">
					<label>책 제목</label>
					<input type="text" value="<%=book.getTitle() %>" disabled />
				</div>
				<div class="form-group">
					<label>작성자 ID</label>
					<input type="text" value="<%=userId %>" disabled />
				</div>
				<div class="form-group">
					<label>평점</label>
					<div>
						<label><input type="radio" name="point" value="0"> 0점</label>
						<label><input type="radio" name="point" value="1"> 1점</label>
						<label><input type="radio" name="point" value="2"> 2점</label>
						<label><input type="radio" name="point" value="3"> 3점</label>
						<label><input type="radio" name="point" value="4"> 4점</label>
						<label><input type="radio" name="point" value="5" checked> 5점</label>
					</div>
				</div>
				<div class="form-group">
					<label>리뷰 내용</label>
					<div>
						<textarea name="content" rows="6" placeholder="리뷰 작성에 참여해주셔서 감사합니다."></textarea>
					</div>
				</div>
				<div>
					<input type="hidden" name="bookno" value="<%=bookNo %>" />
					<input type="hidden" name="userid" value="<%=userId %>" />
				</div>
				<div class="text-right">
					<button type="submit">리뷰 등록</button>
				</div>
			</form>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>