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
		<div class="col-4">
			<h3>기본 리스트 그룹</h3>
			<ul class="list-group">
				<li class="list-group-item">인사부</li>
				<li class="list-group-item">총무부</li>
				<li class="list-group-item">관리부</li>
				<li class="list-group-item">영업부</li>
				<li class="list-group-item">기술부</li>
			</ul>
		</div>
		<div class="col-4">
			<h3>활성화된 리스트 그룹</h3>
			<ul class="list-group">
				<li class="list-group-item">인사부</li>
				<li class="list-group-item">총무부</li>
				<li class="list-group-item active">관리부</li>
				<li class="list-group-item">영업부</li>
				<li class="list-group-item">기술부</li>
			</ul>
		</div>
		<div class="col-4">
			<h3>비활성화된 리스트 그룹</h3>
			<ul class="list-group">
				<li class="list-group-item">인사부</li>
				<li class="list-group-item disabled">총무부</li>
				<li class="list-group-item">관리부</li>
				<li class="list-group-item active">영업부</li>
				<li class="list-group-item">기술부</li>
			</ul>
		</div>
	</div>  
	<div class="row">
		<div class="col-4">
			<h3>가로 방향 리스트 그룹</h3>
			<ul class="list-group list-group-horizontal">
				<li class="list-group-item">인사부</li>
				<li class="list-group-item">총무부</li>
				<li class="list-group-item">관리부</li>
			</ul>
		</div>
		<div class="col-4">
			<h3>문맥적 의미가 있는</h3>
			<ul class="list-group">
				<li class="list-group-item list-group-item-primary">Primary</li>
				<li class="list-group-item list-group-item-seconday">Secondary</li>
				<li class="list-group-item list-group-item-success">Success</li>
				<li class="list-group-item list-group-item-danger">Danger</li>
				<li class="list-group-item list-group-item-warning">Warning</li>
				<li class="list-group-item list-group-item-info">Info</li>
				<li class="list-group-item list-group-item-light">Light</li>
				<li class="list-group-item list-group-item-dark">Dark</li>
			</ul>
		</div>
		<div class="col-4">
			<h3>링크로 만든 리스트 그룹</h3>
			<div class="list-group">
				<a class="list-group-item list-group-item-action" href="#">인사부</a>
				<a class="list-group-item list-group-item-action" href="#">총무부</a>
				<a class="list-group-item list-group-item-action" href="#">관리부</a>
				<a class="list-group-item list-group-item-action" href="#">영업부</a>
				<a class="list-group-item list-group-item-action" href="#">기술부</a>
			</div>
		</div>
	</div>  
	<div class="row">
		<div class="col-4">
			<h3>배지를 가지는 리스트</h3>
			<ul class="list-group">
				<li class="list-group-item d-flex justify-content-between align-items-center">
					미처리 건수<span class="badge badge-fill badge-danger">10</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					처리중 건수<span class="badge badge-fill badge-info">10</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					처리완료 건수<span class="badge badge-fill badge-success">10</span>
				</li>
			</ul>
		</div>
		<div class="col-8">
			<h3>복잡한 리스트 그룹</h3>
			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action">
					<div class="d-flex w-100 justify-content-between">
						<h5 class="mb-1">프로젝트 공지</h5>
						<small>3일전</small>
					</div>
					<p class="mb-1">
						프로젝트 일정이 변경되었습니다. 
						6월 12일 금요일부터 2주간 실시하겠습니다.
						각 조별로 일정조정하시고, 내용은 메일로 작성해서 PM에서 발송바랍니다. 
					</p>
					<small>홍길동</small>
				</a>
				<a href="#" class="list-group-item list-group-item-action">
					<div class="d-flex w-100 justify-content-between">
						<h5 class="mb-1">프로젝트 공지</h5>
						<small>3일전</small>
					</div>
					<p class="mb-1">
						프로젝트 일정이 변경되었습니다. 
						6월 12일 금요일부터 2주간 실시하겠습니다.
						각 조별로 일정조정하시고, 내용은 메일로 작성해서 PM에서 발송바랍니다. 
					</p>
					<small>홍길동</small>
				</a>
				<a href="#" class="list-group-item list-group-item-action">
					<div class="d-flex w-100 justify-content-between">
						<h5 class="mb-1">프로젝트 공지</h5>
						<small>3일전</small>
					</div>
					<p class="mb-1">
						프로젝트 일정이 변경되었습니다. 
						6월 12일 금요일부터 2주간 실시하겠습니다.
						각 조별로 일정조정하시고, 내용은 메일로 작성해서 PM에서 발송바랍니다. 
					</p>
					<small>홍길동</small>
				</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>