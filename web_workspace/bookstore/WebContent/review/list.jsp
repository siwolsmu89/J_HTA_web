<%@page import="com.bookstore.vo.User"%>
<%@page import="com.bookstore.dao.UserDAO"%>
<%@page import="com.bookstore.vo.Review"%>
<%@page import="com.bookstore.dto.ReviewDTO"%>
<%@page import="com.bookstore.dao.ReviewDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review/list</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<% String position = "book"; %>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1> 도서 </h1>
		</div>
		
		<div class="body">
			<%
				String userId = request.getParameter("userid");
				ReviewDAO reviewDao = new ReviewDAO();
				List<ReviewDTO> myReviews = reviewDao.getReviewsByUserId(userId);
				UserDAO userDao = new UserDAO();
				User user = userDao.getUserById(userId);
			%>
			<h3>[<%=user.getName() %>] 회원님의 리뷰 목록</h3>
			
			<div>
				<%
					if (myReviews.isEmpty()){
				%>
				<p>등록된 리뷰가 없습니다.</p>
				<%		
					} else {
						for (ReviewDTO review : myReviews) {
				%>
				<br/>
				<table class="table bordered">
						<tr>
							<th>리뷰번호</th>
							<td><%=review.getNo() %></td>
							<th>책 번호</th>
							<td><%=review.getBookNo() %></td>
						</tr>
						<tr>
							<th>책 제목</th>
							<td><%=review.getBookTitle() %></td>
							<th>평점</th>
							<td><%=review.getPoint() %></td>
						</tr>
						<tr>
							<th colspan="6">리뷰내용</th>
						</tr>
						<tr>
							<td rowspan="3" colspan="6"><%=review.getContent() %></td>
						</tr>
				</table>
				<div class="text-right">
					<button type="button"><a href="form2.jsp?bookno=<%=review.getBookNo() %>&userid=<%=userId %>&point=<%=review.getPoint() %>">리뷰수정</a></button>
					<button type="button"><a href="delete.jsp?bookno=<%=review.getBookNo() %>&userid=<%=userId %>">리뷰삭제</a></button>
				</div>
				<%
						}
					}
				%>
			</div>
			<div class="text-right">
				<button type="button"><a href="../order/list.jsp?userid=<%=userId %>">내 주문목록</a></button>
			</div>
			
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>