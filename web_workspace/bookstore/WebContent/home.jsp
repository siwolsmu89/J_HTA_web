<%@page import="com.bookstore.vo.User"%>
<%@page import="com.bookstore.dao.UserDAO"%>
<%@page import="com.bookstore.dao.BookDAO"%>
<%@page import="com.bookstore.vo.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
<link rel="stylesheet" type="text/css" href="css/bookstore.css">
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "home";
			%>
			<%@ include file="common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>북스토어</h1>
		</div>	
		
		<div class="body">
			<div>
				<h3>최근 입고된 책</h3>
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>저자</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<%
							BookDAO bookDao = new BookDAO();
							List<Book> newBooks = bookDao.getNewBooks();
							for (Book book : newBooks) {
						%>
							<tr>
								<td><%=book.getNo() %></td>
								<td><a href="/bookstore/book/detail.jsp?bookno=<%=book.getNo() %>"><%=book.getTitle() %></a></td>
								<td><%=book.getWriter() %></td>
								<td><%=book.getPrice() %></td>
							</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<div>
				<h3>최근 가입한 사용자</h3>
				<table class="table">
					<thead>
						<tr>
							<th>사용자명</th>
							<th>아이디</th>
							<th>이메일</th>
							<th>가입일</th>
						</tr>
					</thead>
					<tbody>
						<%
							UserDAO userDao = new UserDAO();
							List<User> newUsers = userDao.getNewUsers();
							
							for (User user : newUsers) {
						%>
						<tr>
							<td><%=user.getName() %></td>
							<td><%=user.getId() %></td>
							<td><%=user.getEmail() %></td>
							<td><%=user.getRegisteredDate() %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<%@ include file="common/footer.jsp" %>
	</div>
</body>
</html>