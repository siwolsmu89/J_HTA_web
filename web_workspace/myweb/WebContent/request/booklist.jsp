<%@page import="com.sample.dao.BookDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request/booklist</title>
</head>
<body>
	<h1>모든 책 정보 조회하기</h1>
	
	<%
		BookDAO bookDao = new BookDAO();
		List<Book> allBooks = bookDao.getAllBooks();
		
		int size = allBooks.size();
		int index = 1;
	%>
	<div style="padding-left: 150px;">
		<p>- 전체 <span style="color: red;"><%=size %>건</span>의 도서 정보 조회</p>
	</div>
	
	<h3>전체 도서 정보</h3>
	<div>
		<table border="1" style="width:100%;">
			<thead>
				<tr>
					<th>순번</th>
					<th>책번호</th>
					<th>제목</th>
					<th>작가</th>
					<th>장르</th>
					<th>출판사</th>
					<th>가격</th>
					<th>할인가</th>
					<th>등록일</th>
					<th>재고</th>
					<th>평점</th>
					<th>추천</th>
				</tr>
			</thead>
			<tbody>
				<% for (Book book : allBooks) { %>
					<tr>
						<td><%=index %></td>
						<td><%=book.getNo() %></td>
						<td><%=book.getTitle() %></td>
						<td><%=book.getWriter() %></td>
						<td><%=book.getGenre() %></td>
						<td><%=book.getPublisher() %></td>
						<td><%=book.getPrice() %></td>
						<td><%=book.getDiscountPrice() %></td>
						<td><%=book.getRegisteredDate() %></td>
						<td><%=book.getStock() %></td>
						<td><%=book.getPoint() %></td>
						<td><%=book.getLikes() %></td>
					</tr>
				<% 
						index++;
					} 
				%>
			</tbody>
		</table>
	</div>
	
	
	
</body>
</html>