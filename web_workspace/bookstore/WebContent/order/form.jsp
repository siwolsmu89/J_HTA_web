<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.dto.BookDetailDTO"%>
<%@page import="com.bookstore.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order/form</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<% String position = "order"; %>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>주문</h1>
		</div>
		
		<%
			int bookNo = Integer.parseInt(request.getParameter("bookno"));
			BookDAO bookDao = new BookDAO();
			BookDetailDTO book = bookDao.getBookByNo(bookNo);
			
			int amount = Integer.parseInt(request.getParameter("amount"));
		%>
		
		<div class="body">
			<h4>주문정보를 확인하세요.</h4>
			<div>
				<table class="table bordered">
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
							<th>가격</th>
							<td><%=NumberUtil.numberWithComma(book.getPrice())+" 원" %></td>
							<th>할인가격</th>
							<td><%=NumberUtil.numberWithComma(book.getDiscountPrice())+" 원" %></td>
						</tr>
				</table>
			</div>
			
			<div class="well">
				<form action="order.jsp" method="post">
					<div class="form-group">
						<label>구매가격</label>
						<input type="text" value="<%=NumberUtil.numberWithComma(book.getDiscountPrice())%> 원" disabled />
					</div>
					<div class="form-group">
						<label>주문수량</label>
						<input type="text" value="<%=amount %> 권" disabled />
					</div>
					<div>
						<input type="hidden" name="amount" value=<%=amount %> />
						<input type="hidden" name="orderprice" value="<%=book.getDiscountPrice() %>" />
						<input type="hidden" name="bookno" value=<%=bookNo %> />
					</div>
					<div class="text-right">
						<button type="submit">주문</button>
					</div>
				</form>
			</div>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>