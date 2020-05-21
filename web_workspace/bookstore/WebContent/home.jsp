<%@page import="com.bookstore.vo.User"%>
<%@page import="com.bookstore.dao.UserDAO"%>
<%@page import="com.bookstore.dao.BookDAO"%>
<%@page import="com.bookstore.vo.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
<style type="text/css">
	.wrapper {
		box-sizing: border-box;
		width: 990px;
		margin: 5px auto;
	}
	
	.navi, .header, .body, .footer {
		margin-top: 10px;
	}
	
	.navi #navibar {
		list-style-type: none;
		margin: 0;
		padding: 0;
		overflow: hidden;
		background-color: #333;
	}
	.navi #navibar li {
		float: left;
	}
	.navi #navibar li a {
		display: block;
		color: white;
		text-align: center;
		padding: 14px 16px;
		text-decoration: none;
	}
	.navi #navibar li a:hover {
		background-color: #222;
	}
	
	.table {
		border-collapse: collapse;
		width: 100%;
	}
	.table th, .table td {
		padding: 8px;
		text-align: left;
	}
	.table th {
		border-bottom: 2px solid #555;
	}
	.table td {
		border-bottom: 1px solid #ddd;
	}
	
	.footer {
		width: 100%;
		margin-top: 25px;
		background-color: #333;
		color: white;
		padding: 14px 16px;
	}
	
</style>
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<ul id="navibar">
				<li><a href="home.jsp">홈</a></li>
				<li><a href="">도서</a></li>
				<li><a href="">사용자</a></li>
				<li><a href="">주문</a></li>
			</ul>
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
							<td><%=book.getTitle() %></td>
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
		
		<div class="footer">
			<p>북스토어 주식회사</p>
			<p>주소: 서울특별시 종로구 율곡로 10길 105 디아망빌딩 4층</p>
			<p>전화번호: 070-1234-5678</p>
		</div>
	</div>
</body>
</html>