<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic/sample4</title>
</head>
<body>
	<h1>스크립틀릿 사용하기</h1>
	
	<%
		int orderNo = 100;
		String productName = "노트";
		int price = 2000;
		int amount = 10;
		boolean membership = true;
		
		double depositRate = 0.01;
	%>
	
	<h3>포인트 적립현황</h3>
	<table border="1" style="width:100;">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>상품명</th>
				<th>가격</th>
				<th>구매수량</th>
				<th>구매가격</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
			<tr>
				<td><%=orderNo %></td>
				<td><%=productName %></td>
				<td><%=price %></td>
				<td><%=amount %></td>
				<td><%=price * amount %></td>
			</tr>
		</tbody>
		<tfoot>
		<% 
			if (membership) {
				if (price * amount > 10000) {
		%>
			<tr>
				<td colspan="4">포인트 적립액</td>
				<td><%=(int) (price * amount * depositRate) %></td>
			</tr>
		<% 
				} else {
		%>	
			<tr>
				<td colspan="5">구매금액이 10,000원 이하인 경우 포인트가 적립되지 않습니다.</td>
			</tr>
		<%
				}
			} else {
		%>
			<tr>
				<td colspan="5">회원이 아닌 경우 포인트가 적립되지 않습니다.</td>
			</tr>
		<%
			}
		%>
		</tfoot>
	</table>
	
</body>
</html>