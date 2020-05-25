<%@page import="com.bookstore.util.NumberUtil"%>
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
							<a href="all.jsp"><button type="button">전체목록</button></a>
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
							<th>리뷰</th>
							<th>추천</th>
						</tr>
					</thead>
					<tbody>
				<%
						OrderDAO orderDao = new OrderDAO();
						List<OrderDTO> orders = orderDao.getOrdersById(userId);
						if (!orders.isEmpty()) {
							for (OrderDTO order : orders) {
								ReviewDAO reviewDao = new ReviewDAO();
				%>
						<tr>
							<td><%=order.getNo() %></td>
							<td><a href="../book/detail.jsp?bookno=<%=order.getBookNo() %>"><%=order.getBookTitle() %></a></td>
							<td><%=NumberUtil.numberWithComma(order.getPrice()) %> 원</td>
							<td><%=NumberUtil.numberWithComma(order.getAmount()) %> 권</td>
							<td><%=NumberUtil.numberWithComma(order.getPrice() * order.getAmount()) %> 원</td>
							<td><%=order.getRegisteredDate() %></td>
				<%
								if (order.getReviewNo() != -1) {
				%>
							<td>
								<button type="button" disabled>완료</button>
							</td>				
				<%					
								} else {
				%>			
							<td>
								<a href="/bookstore/review/form.jsp?bookno=<%=order.getBookNo()%>&userid=<%=order.getUserId()%>"><button type="button">작성</button></a>
							</td>
				<% 
								}
				
							   int likes = order.getLike();
							   if (likes!=0) {
				%>
								   <td><button type="button" disabled>완료</button></td>
								   
				<%			   } else {
				%>
									<td><a href="../book/like.jsp?bookno=<%=order.getBookNo() %>&userid=<%=order.getUserId() %>"><button type="button">추천</button></a></td>
				<%
							   }
				
							}
				%>
						</tr>
				<%			
						} else {
				%>		
						<tr>
							<td colspan="8">주문 내역이 없습니다.</td>
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