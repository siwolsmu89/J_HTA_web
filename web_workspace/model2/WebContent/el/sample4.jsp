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
			<h1>폼 입력값 표현하기</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<h3>폼 입력값</h3>
			<div><strong>이름</strong> : ${param.username}</div>
			<div><strong>연락처</strong> : ${param.usertel}</div>
			<div><strong>이름과 연락처</strong> : ${param.username} ${param.usertel}</div>
		</div>
	</div>
</div>
</body>
</html>