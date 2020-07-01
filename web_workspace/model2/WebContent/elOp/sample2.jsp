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
			<h1>EL의 비교연산자</h1>
		</div>
	</div>
	
	<%
		request.setAttribute("num1", 30);
		request.setAttribute("num2", 15);
		
		request.setAttribute("name", "홍길동");
	%>
	<div class="row">
		<div class="col-12">
			<p>비교하기 : ${num1 > num2 } ${num1 gt num2 }</p>
			<p>비교하기 : ${num1 >= num2 } ${num1 gt num2 }</p>
			<p>비교하기 : ${num1 < num2 } ${num1 lt num2 }</p>
			<p>비교하기 : ${num1 <= num2 } ${num1 le num2 }</p>
			<p>비교하기 : ${num1 == num2 } ${num1 eq num2 }</p>
			<p>비교하기 : ${num1 != num2 } ${num1 ne num2 }</p>
		</div>
	</div>
	
	<div class="col-12">
		<h3>문자열 비교</h3>
		<p>비교하기 : ${name == '홍길동' } ${name eq '홍길동' }</p>
		<p>비교하기 : ${name != '홍길동' } ${name ne '홍길동' }</p>
	</div>
</div>
</body>
</html>