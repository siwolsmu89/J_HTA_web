<%@page import="com.bookstore.vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%@ include file="../common/navibar.jsp" %>		
		</div>
		
		<div class="header">
			<h1>도서</h1>
		</div>
		<%
			BookDAO bookDao = new BookDAO();
			List<Book> allBooks = bookDao.getAllBooks();
		%>
		<div class="body">
			<div>
				<h3>전체 도서 목록</h3>
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작가</th>
							<th>장르</th>
							<th>출판사</th>
							<th>가격</th>
							<th>할인가격</th>
							<th>평점</th>
							<th>추천수</th>
							<th>재고</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (!allBooks.isEmpty()) {
								for (Book book : allBooks) {
						%>
						<tr>
							<td><%=book.getNo() %></td>
							<td><%=book.getTitle() %></td>
							<td><%=book.getWriter() %></td>
							<td><%=book.getGenre() %></td>
							<td><%=book.getPublisher() %></td>
							<td><%=book.getPrice() %></td>
							<td><%=book.getDiscountPrice() %></td>
							<td><%=book.getPoint() %></td>
							<td><%=book.getLikes() %></td>
							<td><%=book.getStock() %></td>
							<td><%=book.getRegisteredDate() %></td>
						</tr>
						<% 
								}
							} else {
						%>
						<tr>
							<td colspan="11">현재까지 등록된 책이 없습니다.</td>
						</tr>
						<%							
							} 
						%>
					</tbody>
				</table>
			</div>
			<div style="margin-top: 20px; text-align: right;">
				<button type="button"><a href="bookform.jsp">신규</a></button>
			</div>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>