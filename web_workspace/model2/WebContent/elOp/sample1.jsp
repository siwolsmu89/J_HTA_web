<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>EL의 연산자 사용하기 - 사칙연산</h1>
		</div>
	</div>
	
	
	<%	
		request.setAttribute("name1", "마우스");
		request.setAttribute("price1", 25000);
		request.setAttribute("amount1", 3);
		
		request.setAttribute("name2", "키보드");
		request.setAttribute("price2", 55000);
		request.setAttribute("amount2", 1);
	%>
	
	<div class="row">
		<div class="col-12">
			<div>총 갯수 : ${amount1 + amount2 }개</div>
			<table class="table">
				<thead>
					 <tr>
					 	<th>상품명</th>
					 	<th>가격</th>
					 	<th>구매수량</th>
					 	<th>구매가격</th>
					 </tr>
				</thead>
				<tbody>
					<tr>
						<td>${name1 }</td>
						<td>${price1 }</td>
						<td>${amount1 }</td>
						<td>${price1*amount1 }</td>
					</tr>
					<tr>
						<td>${name2 }</td>
						<td>${price2 }</td>
						<td>${amount2 }</td>
						<td>${price2*amount2 }</td>
					</tr>
				</tbody>
			</table>
			
			<div>
				<strong class="display-4">결재금액 :</strong> <span class="display-4">${price2*amount2 + price1*amount1 }</span>
			</div>
			<div>2인 구매시 각자 부담금액 : ${(price2*amount2 + price1*amount1)/2 }</div>
			<div>2인 구매시 각자 부담금액 : ${(price2*amount2 + price1*amount1) div 2 }</div>
		</div>
	</div>
	
</div>
</body>
</html>