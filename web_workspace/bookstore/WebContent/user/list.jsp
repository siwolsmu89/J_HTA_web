<%@page import="com.bookstore.dto.OrderDTO"%>
<%@page import="com.bookstore.dao.OrderDAO"%>
<%@page import="com.bookstore.dto.ReviewDTO"%>
<%@page import="com.bookstore.dao.ReviewDAO"%>
<%@page import="com.bookstore.dao.UserDAO"%>
<%@page import="com.bookstore.vo.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/users</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "user";
			%>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>사용자</h1>
		</div>
		
		<%
			UserDAO userDao = new UserDAO();
			List<User> allUsers = userDao.getAllUsers();
			OrderDAO orderDao = new OrderDAO();
		%>
		
		<div class="body">
			<div>
				<h3>전체 사용자 목록</h3>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>이름</th>
							<th>이메일</th>
							<th>누적포인트</th>
							<th>가입일</th>
							<th>리뷰보기</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (!allUsers.isEmpty()) {
								for (User user : allUsers) {
									
						%>
							<tr>
						<%
										List<OrderDTO> orders = orderDao.getOrdersById(user.getId());
										if (!orders.isEmpty()) {
						%>
								<td><a href="../order/list.jsp?userid=<%=user.getId() %>"><%=user.getId() %></a></td>
								<td><a href="../order/list.jsp?userid=<%=user.getId() %>"><%=user.getName() %></a></td>
						<%
										} else {
						%>
								<td><%=user.getId() %></td>
								<td><%=user.getName() %></td>
						<% 
										}
						%>
								<td><%=user.getEmail() %></td>
								<td><%=user.getPoint() %></td>
								<td><%=user.getRegisteredDate() %></td>
						<%
									ReviewDAO reviewDao = new ReviewDAO();
									List<ReviewDTO> reviews = reviewDao.getReviewsByUserId(user.getId());
									if (!reviews.isEmpty()){
						%>
								<td><a href="../review/list.jsp?userid=<%=user.getId() %>"><button type="button">리뷰 (<%=reviews.size() %>)</button></a></td>
						<%
									} else {
						%>
								<td><button type="button" style="color: red;" disabled>리뷰 (0)</button></td>
							</tr>								
						<%			
									}
								}
							} else {
						%>
							<tr>
								<td colspan="5">등록된 사용자가 없습니다.</td>
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