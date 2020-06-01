<%@page import="com.sample.util.NumberUtil"%>
<%@page import="com.sample.vo.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.dao.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 리스트</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<h1>사원 리스트</h1>	
		</div>
		
		<%
			// 1. 한 화면에 표시할 행의 갯수
			int rowsPerPage = 10;
		
			// 2. 클라이언트가 요청한 페이지 번호 조회하기
			int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
			
			// 3. 시작과 끝번호 설정하기
			int beginRowNumber = (pageNo -1) *rowsPerPage + 1;
			int endRowNumber = pageNo * rowsPerPage;
			
			// 4. 화면에 표시할 목록 조회하기
			EmployeeDAO empDao = new EmployeeDAO();
			List<Employee> employees = empDao.getEmployeesByRange(beginRowNumber, endRowNumber);
		%>
		
		<div class="body">
			<p>사원 목록을 확인하세요</p>
			<table class="table">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>직종</th>
						<th>소속부서명</th>
					</tr>
				</thead>
				<tbody>
				
		<%
				if (employees.isEmpty()) {
		%>
					<tr>
						<td colspan="4">사원 정보가 없습니다.</td>
					</tr>
		<%			
				} else {
					for (Employee emp : employees) {
		%>
				
					<tr>
						<td><%=emp.getId() %></td>
						<td><a href="detail.jsp?empid=<%=emp.getId() %>"><%=emp.getFirstName() %> <%=emp.getLastName() %></a></td>
						<td><%=emp.getJobId() %></td>
						<td><%=emp.getDepartmentName() %></td>
					</tr>
					
		<%
					}
				}
		%>			
				</tbody>
			</table>
		</div>
		
		<div class="text-center">
		<%
			// 1. 전체 행의 개수를 조회한다.
			int rows = empDao.getEmployeesCount();
		
			// 2. 전체 페이지 수를 계산한다.
			int totalPages = (int) Math.ceil((double) rows/rowsPerPage);
		%>
			<div class="pagination">
				<a href="">&laquo;</a>
				<a href="list.jsp?page=1" class="<%=pageNo == 1 ? "active" : ""%>">1</a>
				<a href="list.jsp?page=2">2</a>
				<a href="list.jsp?page=3">3</a>
				<a href="list.jsp?page=4">4</a>
				<a href="list.jsp?page=5">5</a>
				<a href="">&raquo;</a>
			</div>
		</div>
	</div>
</body>
</html>