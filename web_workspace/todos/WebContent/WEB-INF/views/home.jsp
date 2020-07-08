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
<body onload="goLast(${param.pageno })">
<fmt:bundle basename="com.simple.resources.message">
<div class="container">
	<c:set var="position" value="home" />
	<%@ include file="nav.jsp" %>
	<!-- Content -->
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header"><fmt:message key="home.title" /></div>
				<div class="card-body">
					<div class="row">
						<c:forEach items="${todoDtos }" var="todoDto">
							<div class="col-4 mb-2">
								<div class="card">
									<div class="card-header d-flex justify-content-between">
										<div>${todoDto.title }</div> 
										<div><span id="todo-${todoDto.no }-status-badge" class="badge ${todoDto.statusClass }">${todoDto.status }</span></div>
									</div>
									<div class="card-body">
										<div class="row mb-3">
											<div class="col-9">
												<small>${todoDto.content }</small>
											</div>
											<div class="col-3">
												<button type="button" class="btn btn-outline-secondary btn-sm" onclick="openTodoDetailModal(${todoDto.no})">
													<fmt:message key="button.label.detail" />
												</button>
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
						<div class="col-12 text-center">
							<button id="more-btn" class="btn btn-outline-dark btn" onclick="getMoreTodos(${param.pageno })">
								<fmt:message key="button.label.more" />
							</button>
						</div>
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
     									<th>번호</th>
     									<td id="modal-todo-no"></td>
     									<th>제목</th>
     									<td id="modal-todo-title" colspan="3"></td>
     								</tr>
     								<tr>
     									<th>작성자</th>
     									<td id="modal-todo-user">홍길동</td>
     									<th>등록일</th>
     									<td id="modal-todo-createday">2020-06-12</td>
     								</tr>
     								<tr>
     									<th>상태</th>
     									<td id="modal-todo-status">처리예정</td>
     									<th id="modal-todo-day-head">예정일</th>
     									<td id="modal-todo-day-body">2020-07-12</td>
     								</tr>
     								<tr>
     									<th style="vertical-align: middle;">내용</th>
     									<td id="modal-todo-content" colspan="3"><small>내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 </small></td>
     								</tr>
     							</tbody>
     						</table>
     					</div>
     				</div>
   				</div>
   				<div class="modal-footer" id="modal-todo-status-modify" style="display: none;">
     				<button id="modal-todo-처리완료-btn" type="button" class="btn btn-success btn-sm" onclick="changeTodoStatus('처리완료')">처리완료</button>
     				<button id="modal-todo-처리중-btn" type="button" class="btn btn-info btn-sm" onclick="changeTodoStatus('처리중')">처리중</button>
     				<button id="modal-todo-보류-btn" type="button" class="btn btn-secondary btn-sm" onclick="changeTodoStatus('보류')">보류</button>
     				<button id="modal-todo-삭제-btn" type="button" class="btn btn-danger btn-sm" onclick="changeTodoStatus('삭제')">삭제</button>
     				<button type="button" class="btn btn-outline-dark btn-sm" data-dismiss="modal">닫기</button>
   				</div>
 			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
</div>
</fmt:bundle>

<script type="text/javascript">

	function goLast(pageNo) {
		if (pageNo) {
			document.querySelector("#more-btn").scrollIntoView();
		}
	}

	function changeDisabledBtn(status) {
		var buttons = document.querySelectorAll("#modal-todo-status-modify button");
		var currentId = "modal-todo-" + status + "-btn";
		for (var i = 0; i < buttons.length; i++) {
			if (buttons[i].id == currentId) {
				buttons[i].setAttribute("disabled", "disabled");
			} else {
				buttons[i].removeAttribute("disabled");
			}
		}
	}

	function setTodoDetailModal(todono) {
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var text = xhr.responseText;
				var jsonObj = JSON.parse(text);
					
				document.querySelector("#modal-todo-no").textContent = todono;
				document.querySelector("#modal-todo-title").textContent = jsonObj.title;
				document.querySelector("#modal-todo-user").textContent = jsonObj.userName;
				document.querySelector("#modal-todo-createday").textContent = jsonObj.createdDate;
				document.querySelector("#modal-todo-status").textContent = jsonObj.status;
				if (jsonObj.status == "처리완료") {
					document.querySelector("#modal-todo-day-head").textContent = "완료일";
					document.querySelector("#modal-todo-day-body").textContent = jsonObj.completedDay;
				} else {
					document.querySelector("#modal-todo-day-head").textContent = "예정일";
					document.querySelector("#modal-todo-day-body").textContent = jsonObj.day;
				}
				document.querySelector("#modal-todo-content").textContent = jsonObj.content;
				
				if (jsonObj.canModify) {
					document.querySelector("#modal-todo-status-modify").style.display="";
				}
				
				changeDisabledBtn(jsonObj.status);
			}
		}

		xhr.open("GET", "todo/detail.hta?todono=" + todono);
		
		xhr.send();
	}
	
	function openTodoDetailModal(todono) {
		$("#modal-todo-detail").modal('show');
		setTodoDetailModal(todono);
	}
	
	function changeTodoStatus(todoStatus) {
		var todoNo = document.querySelector('#modal-todo-no').textContent;
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var text = xhr.responseText;
				var jsonObj = JSON.parse(text);
				document.querySelector("#modal-todo-status").textContent = todoStatus;
				document.querySelector("#todo-" + todoNo + "-status-badge").textContent = todoStatus;
				document.querySelector("#todo-" + todoNo + "-status-badge").setAttribute("class", "badge " + jsonObj.statusClass);
				changeDisabledBtn(todoStatus);
				// 이거 하다가 감
				if (todoStatus == "처리완료") {
					document.querySelector("#modal-todo-day-head").textContent = "완료일";
					document.querySelector("#modal-todo-day-body").textContent = jsonObj.completedDay;
				} else {
					document.querySelector("#modal-todo-day-head").textContent = "예정일";
					document.querySelector("#modal-todo-day-body").textContent = jsonObj.day;
				}
			}
		}

		xhr.open("GET", "todo/status.hta?todono=" + todoNo + "&status=" + todoStatus);
		
		xhr.send();
	}
	
	function getMoreTodos(pageNo) {
		
		if (!pageNo) {
			pageNo = 1;
		}
		var nextPage = 1 + pageNo;
		
		location.href="home.hta?pageno=" + nextPage;
	}
</script>
</body>
</html>
