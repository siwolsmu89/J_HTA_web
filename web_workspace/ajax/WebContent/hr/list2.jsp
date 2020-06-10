<%@page import="com.sample.hr.vo.Department"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.hr.dao.EmployeeDAO"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HR</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css" />
<style type="text/css">
	#popup {
		display: none;
		position: fixed;
		left: 550px;
		top: 250px;
		width: 600px;
		border: 1px solid #ddd;
		padding-left: 10px;
		padding-right: 10px;
		background-color: white;
		z-index: 999;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<div id="navibar">
				<ul>
					<li><a href="/ajax/home.jsp">홈</a>
					<li><a href="/ajax/hr/list1.jsp">직원조회</a></li>				
					<li class="active"><a href="/ajax/hr/list2.jsp">직원조회(Ajax)</a></li>				
				</ul>
			</div>
		</div>

		<div class="header">
			<h1>직원조회 시스템</h1>
		</div>
	
		<div class="body">
			<p>부서별 직원정보를 조회해보세요.</p>
			
			<div> 
				<form action="">
					<label>부서명</label>
					<select name="deptid" style="height: 30px">
						<option value="">---부서명을 선택하세요---</option>
			<%
				EmployeeDAO empDao = new EmployeeDAO();
				List<Department> allDepts = empDao.getAllDepartments();
				
				for (Department dept : allDepts) {
			%>	
						<option value="<%=dept.getId() %>"><%=dept.getName() %></option>
			<%
				}
			%>								
					</select>
					<button type="button" onclick="getEmployees()">조회</button>
				</form>
			</div>
			<table class="table">
				<colgroup>
					<col width="33%">
					<col width="33%">
					<col width="34%">
				</colgroup>
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody id="employee-body"></tbody>
			</table>
		</div>
		
		<div id="popup"> 
			<h3>사원 상세 정보</h3>
			
			<table class="table bordered">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tbody>
					<tr>
						<th>Id</th>
						<td id="id-cell"></td>
						<th>Hire Date</th>
						<td id="hire-cell"></td>
					</tr>
					<tr>
						<th>Name</th>
						<td id="name-cell"></td>
						<th>Phone Number</th>
						<td id="phone-cell"></td>
					</tr>
					<tr>
						<th>Job Id</th>
						<td id="job-cell"></td>
						<th>Salary</th>
						<td id="salary-cell"></td>
					</tr>
				</tbody>
			</table>
			<hr/>
			<div class="text-right">
				<button onclick="closePopup()">닫기</button>
			</div>
		</div>
		
		<div class="footer">
			<p>짱좋은 주식회사</p>
		</div>
	</div>
	<script type="text/javascript">
		function openPopup(event) {
			// 링크 클릭시 페이지가 이동되는 기본 동작이 발생하지 않도록 방해함
			event.preventDefault();
			// 사원정보를 표시할 팝업을 화면에 표시함
			document.querySelector("#popup").style.display = "block";
			
			// event.target에는 지금 클릭한 <a>태그에 대한 엘리먼트 객체가 들어있음
			// 해당 엘리먼트에서 href속성값을 조회함  <-- "data2.jsp?id=사원아이디" 정보
			var url = event.target.getAttribute("href");
			
			// AJAX 처리 시작
			// XHR 객체 생성
			var xhr = new XMLHttpRequest();
			
			// XHR에 콜백함수 등록 <-- onreadystatechange 이벤트 발생 시 실행할 함수임
			// onreadystatechange는 XHR의 readyState 값이 변할 때마다 발생하는 이벤트임
			xhr.onreadystatechange = function () {
				// 콜백함수가 4번 실행되기는 하지만, 실질적인 작업이 구현된 아래의 소스는 하나의 XHR에 대해서 한 번만 실행됨
				if (xhr.readyState == 4 && xhr.status == 200) {
					// 서버가 보낸 응답데이터 조회 <-- XHR의 rseponseText는 응답데이터를 보관함
					var text = xhr.responseText;
					// 응답데이터가 JSON 텍스트라면 JSON.parse(json표기법의 텍스트) 메소드를 실행해서 텍스트데이터를 자바스크립트 배열이나 객체로 변환할 수 있음
					var emp = JSON.parse(text);
					
					document.querySelector("#id-cell").textContent = emp.id;
					document.querySelector("#hire-cell").textContent = emp.hireDate;
					document.querySelector("#name-cell").textContent = emp.firstName;
					document.querySelector("#phone-cell").textContent = emp.phoneNumber;
					document.querySelector("#job-cell").textContent = emp.jobId;
					document.querySelector("#salary-cell").textContent = emp.salary;
				}
			}
			
			// XHR 초기화, url에는 클릭한 <a>태그의 href 속성에서 조회한 jsp 경로가 들어있음
			xhr. open("GET", url);
			xhr.send();
		}
	
		function closePopup() {
			document.querySelector("#popup").style.display = "none";
		}
	
		function getEmployees() {
			var departmentId = document.querySelector("select[name=deptid]").value;
			
			// XHR 객체 생성
			var xhr = new XMLHttpRequest();
			
			// XHR 객체에서 응답데이터 가져오기
			// * XHR 객체의 readyState의 요청처리의 각 과정에 따라서 0~4로 값이 변해간다.
			// * XHR 객체는 readyState 값이 변할 때마다 onreadystatechange 이벤트를 발생시킨다.
			// * XHR 객체의 onreadystatechange 이벤트에, 이벤트 발생시 실행될 함수를 등록한다.
			// * XHR 객체의 readyState값이 4면 응답을 받은 것이다.
			// * XHR 객체의 status 값이 200이면 성공적인 응답을 받은 것이다.
			// * 서버가 보낸 응답데이터는 XHR 객체의 responseText에 보관되어 있다.
			// * 서버가 보낸 응답데이터가 JSON 형식의 데이터라면 JSON.parse() 함수를 사용해서 javascript의 배열이나 객체로 변환할 수 있다.
			// * 배열이나 객체로 변환되었다면 자바스크립트 문법을 사용해서 값을 조회하고, 조회된 값을 이용해서 HTML 컨텐츠를 만든 다음, 특정 태그에 부착시켜서 화면에 표시되게 한다.
			xhr.onreadystatechange = function () { 
				if (xhr.readyState ==4 && xhr.status == 200) {
					var text = xhr.responseText;
					var employees = JSON.parse(text);
	
					var rows = "";
					for (var i=0; i<employees.length; i++) {
						var emp = employees[i];
						rows += "<tr>";
						rows += "<td>" + emp.id + "</td>";
						rows += "<td><a onclick='openPopup(event)' href='data2.jsp?id="+emp.id+"'>" + emp.firstName + "</a></td>";
						rows += "<td>" + emp.phoneNumber + "</td>";
						rows += "</tr>";
					}
					document.querySelector("#employee-body").innerHTML = rows;
				}
			};
			
			// XHR 초기화
			xhr.open("GET", "data.jsp?deptid="+departmentId);
			// 서버로 요청보내기
			xhr.send();
		}
	</script>
</body>
</html>