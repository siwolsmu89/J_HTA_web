<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>To Do</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<%@ include file="nav.jsp" %>
	
	<!-- Content -->
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header">나의 일정</div>
				<div class="card-body">
					<form method="get" action="todos.jsp">
					<div class="row mb-3">
						<div class="col-6 pt-2">
							<strong class="mr-3">처리완료 : <span class="bg-success text-white py-1 px-3">3</span></strong>
							<strong>미처리 : <span class="bg-primary text-white py-1 px-3">3</span></strong>
						</div>
						<div class="col-6 d-flex justify-content-end">
							<select class="form-control mr-3" style="width: 100px; " name="rows">
								<option value="5"> 5개씩</option>
								<option value="10"> 10개씩</option>
								<option value="20"> 20개씩</option>
							</select>
							<select class="form-control " style="width: 120px;" name="status">
								<option value=""> 전체</option>
								<option value="1"> 처리예정</option>
								<option value="2"> 처리중</option>
								<option value="3"> 보류</option>
								<option value="4"> 삭제</option>
								<option value="5"> 처리완료</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<table class='table'>
								<colgroup>
									<col width="10%">
									<col width="*">
									<col width="15%">
									<col width="15%">
								</colgroup>
								<thead>
									<tr>
										<th>순번</th>
										<th>제목</th>
										<th>날짜</th>
										<th>처리상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>프로젝트 일정관련 회의</td>
										<td>2020.7.12</td>
										<td>처리완료</td>
									</tr>
									<tr>
										<td>2</td>
										<td>프로젝트 일정관련 회의</td>
										<td>2020.7.12</td>
										<td>처리완료</td>
									</tr>
									<tr>
										<td>3</td>
										<td>프로젝트 일정관련 회의</td>
										<td>2020.7.12</td>
										<td>처리완료</td>
									</tr>
									<tr>
										<td>4</td>
										<td>프로젝트 일정관련 회의</td>
										<td>2020.7.12</td>
										<td>처리완료</td>
									</tr>
									<tr>
										<td>5</td>
										<td>프로젝트 일정관련 회의</td>
										<td>2020.7.12</td>
										<td>처리완료</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-6 ">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">이전</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item active"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">다음</a></li>
							</ul>
						</div>
						<div class="col-6 text-right">
							<input type="text" class="form-control" style="width: 250px; display: inline-block;" name="keyword">
							<button type="button" class="btn btn-dark" style="margin-top: -5px;">검색</button> 
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상세정보 모달창 -->
	<div class="modal" id="modal-todo-detail">
		<div class="modal-dialog modal-lg">
 			<div class="modal-content">
   				<div class="modal-header">
     				<h4 class="modal-title">상세 정보</h4>
     				<button type="button" class="close" data-dismiss="modal">&times;</button>
   				</div>
   				<div class="modal-body">
     				<div class="row">
     					<div class="col-12">
     						<table class="table table-bordered table-sm">
     							<colgroup>
     								<col width="15%">
     								<col width="35%">
     								<col width="15%">
     								<col width="35%">
     							</colgroup>
     							<tbody>
     								<tr>
     									<th>제목</th>
     									<td colspan="3">프로젝트 일정 회의</td>
     								</tr>
     								<tr>
     									<th>작성자</th>
     									<td>홍길동</td>
     									<th>등록일</th>
     									<td>2020-06-12</td>
     								</tr>
     								<tr>
     									<th>상태</th>
     									<td>처리예정</td>
     									<th>예정일</th>
     									<td>2020-07-12</td>
     								</tr>
     								<tr>
     									<th style="vertical-align: middle;">내용</th>
     									<td colspan="3"><small>내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 </small></td>
     								</tr>
     							</tbody>
     						</table>
     					</div>
     				</div>
   				</div>
   				<div class="modal-footer">
     				<button type="button" class="btn btn-success btn-sm">처리완료</button>
     				<button type="button" class="btn btn-info btn-sm">처리중</button>
     				<button type="button" class="btn btn-secondary btn-sm">보류</button>
     				<button type="button" class="btn btn-danger btn-sm">취소</button>
     				<button type="button" class="btn btn-outline-dark btn-sm" data-dismiss="modal">닫기</button>
   				</div>
 			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>	
</div>
</body>
</html>
