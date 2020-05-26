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
		
		<%
			OrderDAO orderDao = new OrderDAO();
			String genre = StringUtil.nullToBlank(request.getParameter("genre"));
		%>
		<div class="body">
			<div>
				<div>
					<form action="all.jsp" method="GET">
						<label>구분</label>
						<select name="genre">
							<option value="" <%="".equals(genre) ? "selected" : "" %>>전체</option>
							<option value="소설" <%="소설".equals(genre) ? "selected" : "" %>>소설</option>
							<option value="시" <%="시".equals(genre) ? "selected" : "" %>>시</option>
							<option value="수필" <%="수필".equals(genre) ? "selected" : "" %>>수필</option>
							<option value="희곡" <%="희곡".equals(genre) ? "selected" : "" %>>희곡</option>
							<option value="고전문학" <%="고전문학".equals(genre) ? "selected" : "" %>>고전문학</option>
							<option value="인문" <%="인문".equals(genre) ? "selected" : "" %>>인문</option>
							<option value="경제" <%="경제".equals(genre) ? "selected" : "" %>>경제</option>
							<option value="자연과학/공학" <%="자연과학/공학".equals(genre) ? "selected" : "" %>>자연과학/공학</option>
							<option value="IT" <%="IT".equals(genre) ? "selected" : "" %>>IT</option>
							<option value="외국어" <%="외국어".equals(genre) ? "selected" : "" %>>외국어</option>
							<option value="교재/수험서" <%="교재/수험서".equals(genre) ? "selected" : "" %>>교재/수험서</option>
						</select>
						<button type="submit">검색</button>
					</form>
				</div>
				<h3>모든 주문 정보</h3>
				
				<table class="table bordered">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>구매자명</th>
							<th>도서명</th>
							<th>도서가격</th>
							<th>주문수량</th>
							<th>결제금액</th>
							<th>주문일자</th>
						</tr>
					</thead>
					
						<tbody>
				<%
						List<OrderDTO> orders;
						if ("".equals(genre)) {
							orders = orderDao.getAllOrders();
						} else {
							orders = orderDao.getOrdersByGenre(genre);
						}
						
						if (!orders.isEmpty()) {
							for (OrderDTO order : orders) {
								ReviewDAO reviewDao = new ReviewDAO();

				%>
						<tr>
							<td><%=order.getNo() %></td>
							<td><a href="../order/list.jsp?userid=<%=order.getUserId() %>"><%=order.getUserName() %></a></td>
							<td><a href="../book/detail.jsp?bookno=<%=order.getBookNo() %>"><%=order.getBookTitle() %></a></td>
							<td><%=NumberUtil.numberWithComma(order.getPrice()) %> 원</td>
							<td><%=NumberUtil.numberWithComma(order.getAmount()) %> 권</td>
							<td><%=NumberUtil.numberWithComma(order.getPrice() * order.getAmount()) %> 원</td>
							<td><%=order.getRegisteredDate() %></td>
				<% 
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