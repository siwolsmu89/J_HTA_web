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
  <style>
  	.row > div {padding: 5px; border: 1px solid gray;}
  </style>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-6 col-md-4 col-xl-3">컨텐츠</div>
		<div class="col-6 col-md-4 col-xl-3">컨텐츠</div>
		<div class="col-6 col-md-4 col-xl-3">컨텐츠</div>
		<div class="col-6 col-md-4 col-xl-3">컨텐츠</div>
	</div>  
	<!-- 
		화면크기			적용되는 열			한 줄에 표시되는 컨텐츠 개수
		-------------------------------------------------
		1200px 이상		col-xl-3		4개
		768px 이상		col-md-4		3개
		576px 이하		col-6			2개
	 -->
</div>
</body>
</html>