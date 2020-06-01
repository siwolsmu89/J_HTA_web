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
			EmployeeDAO empDao = new EmployeeDAO();
			List<Employee> employees = empDao.getAllEmployees();
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
			<div class="pagination">
				<a href="">&laquo;</a>
				<a href="" class="active" >1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">5</a>
				<a href="">&raquo;</a>
			</div>
		</div>
	</div>
</body>
</html>