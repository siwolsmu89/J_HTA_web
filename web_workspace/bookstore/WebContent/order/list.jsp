<%@page import="com.bookstore.dao.ReviewDAO"%>
<%@page import="com.bookstore.dto.OrderDTO"%>
<%@page import="com.bookstore.vo.Order"%>
<%@page import="com.bookstore.dao.OrderDAO"%>
<%@page import="com.bookstore.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order/orders</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "order";
			%>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>주문</h1>
		</div>
		
		<%
			UserDAO userDao = new UserDAO();
			List<User> allUsers = userDao.getAllUsers();
		%>
		
		<div class="body">
			<div>
				<h3>회원별 주문 목록</h3>
					<form>
						<div class="form-group">
						<%
							if (!allUsers.isEmpty()) {
						%> 
							<select name="userid">
							<option selected disabled> -- 회원명(회원아이디) 선택 -- </option>
						<%
								for (User user : allUsers) {	
									String id = user.getId();
									String name = user.getName();
						%>
							<option value=<%=id %>><%=name %> (<%=id %>) </option>
						<%
								}
						%>
							</select>
						<%
							} else {
						%>
							<p>등록된 사용자가 없습니다.</p>
						<%
							}
						%>
						</div>
						<div class="text-right">
							<button type="submit">조회</button>
						</div>
					</form>
				
				<%
					String userId = request.getParameter("userid");
					if (userId != null) {
						User user = userDao.getUserById(userId);
				%>
				<h3>[<%=user.getName() %>] 회원님의 주문내역</h3>
				<p>누적포인트 : <strong><%=user.getPoint() %></strong> 점</p>
				
				<table class="table bordered">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>도서명</th>
							<th>도서가격</th>
							<th>주문수량</th>
							<th>결제금액</th>
							<th>주문일자</th>
							<th>리뷰작성</th>
						</tr>
					</thead>
					<tbody>
				<%
						OrderDAO orderDao = new OrderDAO();
						List<OrderDTO> orders = orderDao.getOrdersById(userId);
						if (!orders.isEmpty()) {
							for (OrderDTO order : orders) {
								ReviewDAO reviewDao = new ReviewDAO();
								boolean isExist = reviewDao.isReviewExist(order.getBookNo(), order.getUserId());
				%>
						<tr>
							<td><%=order.getNo() %></td>
							<td><a href="../book/detail.jsp?bookno=<%=order.getBookNo() %>"><%=order.getBookTitle() %></a></td>
							<td><%=order.getPrice() %></td>
							<td><%=order.getAmount() %></td>
							<td><%=order.getAmount() * order.getPrice() %></td>
							<td><%=order.getRegisteredDate() %></td>
				<%
								if (isExist) {
				%>
							<td>
								<button type="button" disabled style="color: crimson;">리뷰작성</button>
							</td>				
				<%					
								} else {
				%>			
							<td>
								<button type="button"><a href="/bookstore/review/form.jsp?bookno=<%=order.getBookNo()%>&userid=<%=order.getUserId()%>">리뷰작성</a></button>
							</td>
						</tr>
				<% 
								}
							}
						} else {
				%>
						<tr>
							<td colspan="7">주문 내역이 없습니다.</td>
				<%
						}  
				%>
					</tbody>
				</table>
				<%			
					} else {
				%>
					<p> 조회를 원하시는 회원 아이디를 선택해주세요 </p>
				<%
					}
				%>
			</div>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>