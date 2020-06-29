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
				<h1>el 연습</h1>
				<p>요청 파라미터값 표현하기</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<ul class="list-group">
					<li class="list-group-item"><a href="sample2.jsp?no=1">링크1</a></li>				
					<li class="list-group-item"><a href="sample2.jsp?no=2&opt=title&keyword=java">링크2</a></li>				
				</ul>
			</div>
		</div>
	</div>
</body>
</html>