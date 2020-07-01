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
			<h1>다른 개체를 포함하고 있는 객체의 값 표현</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<table class="table">
				<tbody>
					<tr>
						<th>고객명</th>
						<td>${myCustomer.name }</td>
						<th>연락처</th>
						<td>${myCustomer.tel }</td>
					</tr>
					<tr>
						<th colspan="2">보유 자동차</th>
						<th>자동차명</th>
						<td>${myCustomer.myCar.name }</td>
					</tr>
					<tr>
						<th>제조사</th>
						<td>${myCustomer.myCar.maker }</td>
						<th>가격</th>
						<td>${myCustomer.myCar.price }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>