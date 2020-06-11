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
		<div class="col-6">
	  		<h1>To Do List <span class="badge badge-secondary">10개</span></h1>
	  		<h2>To Do List <span class="badge badge-secondary">10개</span></h2>
	  		<h3>To Do List <span class="badge badge-secondary">10개</span></h3>
	  		<h4>To Do List <span class="badge badge-secondary">10개</span></h4>
	  		<h5>To Do List <span class="badge badge-secondary">10개</span></h5>
	  		<h6>To Do List <span class="badge badge-secondary">10개</span></h6>
	  	</div>
	  	<div class="col-6">
	  		<h3>버튼에 표시되는 배지</h3>
	  		<button class="btn btn-primary">
	  			알림 <span class="badge badge-light">4</span>
	  		</button>
	  	</div>
	</div>
	<div class="row">
		<div class="col-4">
			<h3>문맥적 의미를 갖는 배지</h3>
			<span class="badge badge-primary">Primary</span>
			<span class="badge badge-secondary">Secondary</span>
			<span class="badge badge-success">Success</span>
			<span class="badge badge-warning">Warning</span>
			<span class="badge badge-danger">Danger</span>
			<span class="badge badge-info">Info</span>
			<span class="badge badge-light">Light</span>
			<span class="badge badge-dark">Dark</span>
		</div>
		<div class="col-4">
			<h3>모서리가 라운딩처리된 배지</h3>
			<span class="badge badge-pill badge-primary">Primary</span>
			<span class="badge badge-pill badge-secondary">Secondary</span>
			<span class="badge badge-pill badge-success">Success</span>
			<span class="badge badge-pill badge-warning">Warning</span>
			<span class="badge badge-pill badge-danger">Danger</span>
			<span class="badge badge-pill badge-info">Info</span>
			<span class="badge badge-pill  badge-light">Light</span>
			<span class="badge badge-pill badge-dark">Dark</span>
		</div>
		<div class="col-4">
			<h3>링크를 배지로 표현하기</h3>
			<a href="#" class="badge badge-primary">중요한 링크</a>
			<a href="#" class="badge badge-secondary">덜 중요한 링크</a>
			<a href="#" class="badge badge-success">좋은 일이 생기는 링크</a>
			<a href="#" class="badge badge-warning">경고를 해주고 싶은 링크</a>
			<a href="#" class="badge badge-danger">나쁜 일이 생기는 링크</a>
			<a href="#" class="badge badge-info">변경된 정보를 보여주는 링크</a>
			<a href="#" class="badge badge-light">하얀 링크</a>
			<a href="#" class="badge badge-dark">까만 링크</a>
		</div>
	</div>
</div>
</body>
</html>