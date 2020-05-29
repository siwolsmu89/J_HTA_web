<%@page import="javax.websocket.SendResult"%>
<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="com.bookstore.dto.BookDetailDTO"%>
<%@page import="com.bookstore.dao.BookDAO"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.dao.ReviewDAO"%>
<%@page import="com.bookstore.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/logincheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order/all</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
<style>
	label {
		font-weight: bold;
	}
	select {
		display: inline-block;
		width: 200px;
		height: 37px;
	}
	button {
		height: 35px;
		
	}
</style>
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
		
		<div class="body">
		
		<%
			OrderDAO orderDao = new OrderDAO();
			List<OrderDTO> orders = orderDao.getOrdersById(loginedUserId);
			
			if (orders.isEmpty()) {
		%>
			<div>
				<p> 회원님의 주문정보가 없습니다.</p>
			</div>
		<%
			} else {
		%>
			<div>
				<p><strong><%=loginedUserName %></strong> 회원님, 주문 정보를 확인하세요.</p>
				
				<table class="table bordered">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>도서명</th>
							<th>도서가격</th>
							<th>주문수량</th>
							<th>결제금액</th>
							<th>주문일자</th>
						</tr>
					</thead>
					<tbody>
		<%
				for (OrderDTO order : orders) {
		%>			
						<tr>
							<td><%=order.getNo() %></td>
							<td><a href="../book/detail.jsp?bookno=<%=order.getBookNo() %>"><%=order.getBookTitle() %></a></td>
							<td><%=order.getPrice() %></td>
							<td><%=order.getAmount() %></td>
							<td><%=(order.getPrice() * order.getAmount()) %></td>
							<td><%=order.getRegisteredDate() %></td>
						</tr>
		<%
				}
		%>
					</tbody>
				</table>
			</div>
		<%
			}
		%>
		</div>
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>