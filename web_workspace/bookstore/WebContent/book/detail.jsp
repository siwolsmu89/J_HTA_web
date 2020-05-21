<%@page import="com.bookstore.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dto.BookDetailDTO"%>
<%@page import="com.bookstore.dao.ReviewDAO"%>
<%@page import="com.bookstore.vo.Review"%>
<%@page import="com.bookstore.vo.Book"%>
<%@page import="com.bookstore.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book/detail</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css">
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>책 상세 정보</h1>
		</div>
		
		<div class="body">
			<div>
				<h3>책 정보</h3>
				
				<%
					BookDAO bookDao = new BookDAO();
					ReviewDAO reviewDao = new ReviewDAO();
					int bookNo = Integer.parseInt(request.getParameter("bookno"));
					BookDetailDTO book = bookDao.getBookByNo(bookNo);
					List<ReviewDTO> reviews = reviewDao.getReviewsByBookNo(bookNo);
				%>
				
				<table class="table">
						<tr>
							<th>제목</th>
							<td colspan="3"><%=book.getTitle() %></td>
						</tr>
						<tr>
							<th>저자</th>
							<td><%=book.getWriter() %></td>
							<th>출판사</th>
							<td><%=book.getPublisher() %></td>
						</tr>
						<tr>
							<th>평점</th>
							<td><%=book.getPoint() %></td>
							<th>리뷰개수</th>
							<td><%=book.getReviewCount() %></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><%=book.getPrice() %></td>
							<th>할인가격</th>
							<td><%=book.getDiscountPrice() %></td>
						</tr>
						<tr>
							<th>추천수</th>
							<td><%=book.getLikes() %></td>
							<th>재고</th>
							<td><%=book.getStock() %></td>
						</tr>
				</table>
			</div>
			
			<div>
				<h3>이 책의 리뷰</h3>
				<table class="table">
					<tbody>
						<% 
							for (ReviewDTO review : reviews) {
						%>
						<tr>
							<th>작성자</th>
							<td><%=review.getUserName() %></td>
							<th>평점</th>
							<td><%=review.getPoint() %></td>
							<th>작성일</th>
							<td><%=review.getRegisteredDate() %></td>
						</tr>
						<tr>
							<td rowspan="3" colspan="6"><%=review.getContent() %></td>
						</tr>
						<%
							}
						
						%>
					</tbody>
				</table>
			</div>
		</div>
	
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>