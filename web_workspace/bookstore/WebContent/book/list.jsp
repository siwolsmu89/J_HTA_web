<%@page import="com.bookstore.vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book/books</title>
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
							<th>저자</th>
							<th>가격</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
							if (!allBooks.isEmpty()) {
								for (Book book : allBooks) {
						%>
						<tr>
							<td><%=book.getNo() %></td>
							<td><a href="/bookstore/book/detail.jsp?bookno=<%=book.getNo() %>"><%=book.getTitle() %></a></td>
							<td><%=book.getWriter() %></td>
							<td><%=book.getPrice() %></td>
							<td>
							<% 
									if (book.getStock()>0) {
							%>
										<a href="/bookstore/order/form.jsp?bookno=<%=book.getNo()%>&amount=1">바로구매</a>
							<%
									} else {
							%>
										<span style="color: crimson">재고없음</span>
							<%
									}
							%>
							</td>
						</tr>
						<% 
								}
							} else {
						%>
						<tr>
							<td colspan="4">현재까지 등록된 책이 없습니다.</td>
						</tr>
						<%							
							} 
						%>
					</tbody>
				</table>
			</div>
			<div class="text-right">
				<button type="button"><a href="form.jsp"><strong>신규 등록</strong></a></button>
			</div>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>