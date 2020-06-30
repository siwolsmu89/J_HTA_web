<%@page import="com.sample.vo.Car"%>
<%@page import="com.sample.vo.Customer"%>
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
			<h1>다른 객체를 포함하고 있는 객체를 속성으로 저장하기</h1>
		</div>
	</div>
	<%
		Car car = new Car();
		car.setName("제네시스 G80");
		car.setPrice(98000000);
		car.setMaker("현대자동차");
		
		Customer customer = new Customer();
		customer.setName("홍길동");
		customer.setTel("010-1234-5678");
		customer.setMyCar(car);
		
		request.setAttribute("myCustomer", customer);
		
		request.getRequestDispatcher("sample10.jsp").forward(request, response);
	%>
</div>
</body>
</html>