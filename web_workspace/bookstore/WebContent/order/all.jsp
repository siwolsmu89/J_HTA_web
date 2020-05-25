<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.dao.ReviewDAO"%>
<%@page import="com.bookstore.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order/all</title>
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>주문</h1>
		</div>
		
		<div class="body">
			<div>
				<h3>모든 주문 정보</h3>
				
				<table class="table bordered">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>사용자명</th>
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
						List<OrderDTO> orders = orderDao.getAllOrders();
						if (!orders.isEmpty()) {
							for (OrderDTO order : orders) {
								ReviewDAO reviewDao = new ReviewDAO();
				%>
						<tr>
							<td><%=order.getNo() %></td>
							<td><%=order.getUserName() %></td>
							<td><a href="../book/detail.jsp?bookno=<%=order.getBookNo() %>"><%=order.getBookTitle() %></a></td>
							<td><%=NumberUtil.numberWithComma(order.getPrice()) %> 원</td>
							<td><%=NumberUtil.numberWithComma(order.getAmount()) %> 권</td>
							<td><%=NumberUtil.numberWithComma(order.getPrice() * order.getAmount()) %> 원</td>
							<td><%=order.getRegisteredDate() %></td>
				<%
								if (order.getReviewNo() != -1) {
				%>
							<td>
								<button type="button" disabled style="color: crimson;">작성완료</button>
							</td>				
				<%					
								} else {
				%>			
							<td>
								<a href="/bookstore/review/form.jsp?bookno=<%=order.getBookNo()%>&userid=<%=order.getUserId()%>"><button type="button">리뷰작성</button></a>
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
			</div>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>