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
<div class="container">
	<%@ include file="nav.jsp" %>
	<!-- Content -->
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header">전체 일정</div>
				<div class="card-body">
					<div class="row">
						<c:forEach items="${todoDtos }" var="todoDto">
							<div class="col-4 mb-2">
								<div class="card">
									<div class="card-header d-flex justify-content-between">
										<div>${todoDto.title }</div> 
										<div><span class="badge ${todoDto.statusClass }">${todoDto.status }</span></div>
									</div>
									<div class="card-body">
										<div class="row mb-3">
											<div class="col-9">
												<small>${todoDto.content }</small>
											</div>
											<div class="col-3">
												<button type="button" class="btn btn-outline-secondary btn-sm" onclick="openTodoDetailModal(${todoDto.no})">상세</button>
											</div>
										</div>
										<div class="d-flex justify-content-between">
											<span class="text-secondary font-weight-bold">${todoDto.userName }</span>											
											<strong>${todoDto.createdDate }</strong>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="row">
						<div class="col-12 text-center"><button class="btn btn-outline-dark btn" onclick="getMoreTodos()"> 더보기 </button></div>
					</div>
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
     									<td class="todo-title" colspan="3"></td>
     								</tr>
     								<tr>
     									<th>작성자</th>
     									<td class="todo-user">홍길동</td>
     									<th>등록일</th>
     									<td class="todo-createday">2020-06-12</td>
     								</tr>
     								<tr>
     									<th>상태</th>
     									<td class="todo-status">처리예정</td>
     									<th>예정일</th>
     									<td class="todo-day">2020-07-12</td>
     								</tr>
     								<tr>
     									<th style="vertical-align: middle;">내용</th>
     									<td class="todo-content" colspan="3"><small>내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 </small></td>
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
<script type="text/javascript">
	function openTodoDetailModal(todono) {
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				$("#modal-todo-detail").modal('show');
				var text = xhr.responseText;
				var jsonObj = JSON.parse(text);
				console.log(jsonObj);
				
				document.querySelector(".todo-title").textContent = jsonObj.title;
				document.querySelector(".todo-user").textContent = jsonObj.userName;
				document.querySelector(".todo-createday").textContent = jsonObj.createdDate;
				document.querySelector(".todo-status").textContent = jsonObj.status;
				document.querySelector(".todo-day").textContent = jsonObj.day;
				document.querySelector(".todo-content").textContent = jsonObj.content;
			}
		}

		xhr.open("GET", "detailtodo.hta?todono=" + todono);
		
		xhr.send();
	}
	
</script>
</body>
</html>
