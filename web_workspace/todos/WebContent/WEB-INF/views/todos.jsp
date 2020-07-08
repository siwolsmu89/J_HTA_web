<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<fmt:bundle basename="com.simple.resources.message">
<div class="container">
	<c:set var="position" value="todos"></c:set>
	<%@ include file="nav.jsp" %>
	
	<!-- Content -->
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header">나의 일정 <button class="btn btn-primary btn-sm float-right" onclick="openTodoFormModal()">새 일정</button></div>
				<div class="card-body">
					<form id="list-form" method="get" action="list.hta">
						<div class="row mb-3">
							<div class="col-6 pt-2">
								<input type="hidden" name="pageNo" />
								<strong class="mr-3">처리완료 : <span class="bg-success text-white py-1 px-3">3</span></strong>
								<strong>미처리 : <span class="bg-primary text-white py-1 px-3">3</span></strong>
							</div>
							<div class="col-6 d-flex justify-content-end">
								<select class="form-control mr-3" style="width: 100px; " name="rows" onchange="refreshList(1)">
									<option value="5" ${param.rows eq 5 ? "selected" : "" }> 5개씩</option>
									<option value="10" ${param.rows eq 10 ? "selected" : "" }> 10개씩</option>
									<option value="20" ${param.rows eq 20 ? "selected" : "" }> 20개씩</option>
								</select>
								<select class="form-control " style="width: 120px;" name="status" onchange="refreshList(1)">
									<option value="전체" ${param.status eq "전체" ? "selected" : "" }> 전체</option>
									<option value="처리예정" ${param.status eq "처리예정" ? "selected" : "" }> 처리예정</option>
									<option value="처리중" ${param.status eq "처리중" ? "selected" : "" }> 처리중</option>
									<option value="보류" ${param.status eq "보류" ? "selected" : "" }> 보류</option>
									<option value="삭제" ${param.status eq "삭제" ? "selected" : "" }> 삭제</option>
									<option value="처리완료" ${param.status eq "처리완료" ? "selected" : "" }> 처리완료</option>
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
										<c:forEach items="${todos }" var="todo">
											<tr>
												<td>${todo.no }</td>
												<td>${todo.title }</td>
												<td>${todo.day }</td>
												<td>${todo.status }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-6 ">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#" onclick="refreshList(${pagenation.begin - 1}, event)">이전</a></li>
									<c:forEach var="num" begin="${pagination.begin }" end="${pagination.end }">
										<li class="page-item ${param.pageNo eq num ? 'active' : ''}"><a class="page-link" href="#" onclick="refreshList(${num}, event)">${num }</a></li>
									</c:forEach>
									<li class="page-item"><a class="page-link" href="#">다음</a></li>
								</ul>
							</div>
							<div class="col-6 text-right">
								<input type="text" class="form-control" style="width: 250px; display: inline-block;" name="keyword" value="${param.keyword }">
								<button type="button" class="btn btn-dark" style="margin-top: -5px;" onclick="refreshList(1)">검색</button> 
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 등록 모달창 -->
	<div class="modal" id="modal-todo-form">
		<div class="modal-dialog modal-lg">
		<form method="post" action="add.hta">
 			<div class="modal-content">
   				<div class="modal-header">
     				<h4 class="modal-title">새 일정 등록폼</h4>
     				<button type="button" class="close" data-dismiss="modal">&times;</button>
   				</div>
   				<div class="modal-body">
     				<div class="row">
     					<div class="col-12">
     						<div class="card">
     							<div class="card-body">
     								<div class="form-group">
     									<label>제목</label>
     									<input type="text" class="form-control" name="name" />
     								</div>
     								<div class="form-group">
     									<label>처리 예정일</label>
     									<input type="date" class="form-control" name="day" />
     								</div>
     								<div class="form-group">
     									<label>내용</label>
     									<textarea rows="3" class="form-control" name="content"></textarea>
     								</div>
     							</div>
     						</div>
     					</div>
     				</div>
   				</div>
   				<div class="modal-footer">
     				<button type="button" class="btn btn-success btn-sm" onclick="addTodo()">등록</button>
     				<button type="button" class="btn btn-outline-dark btn-sm" data-dismiss="modal">닫기</button>
   				</div>
 			</div>
 		</form>
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
</fmt:bundle>
<script>

	function refreshList(pageNo, event) {
		if (event) {
			// <a>태그를 클릭한 경우에만 event가 undefined가 아니다.
			event.preventDefault();
		}
		// <form> 안의 <input type="hidden" name="pageNo" />의 값을 설정한다.
		// 페이지 번호를 클릭한 경우만 1이 아닌 다른 값이 들어간다.
		document.querySelector("input[name=pageNo]").value = pageNo;
		
		// <form>안의 row, status, keyword, pageNo 입력요소의 값을 서버로 제출한다.
		document.querySelector("#list-form").submit();
	}

	function openTodoFormModal() {
		$("#modal-todo-form").modal('show');
	}
	
	function addTodo() {
		
	}
</script>
</body>
</html>
