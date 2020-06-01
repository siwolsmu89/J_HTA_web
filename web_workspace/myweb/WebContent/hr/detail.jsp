<%@page import="com.sample.util.NumberUtil"%>
<%@page import="com.sample.dao.EmployeeDAO"%>
<%@page import="com.sample.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>사원 정보</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<h1>사원 정보</h1>
		</div>
		
		<%
			int employeeId = NumberUtil.stringToInt(request.getParameter("empid"));
			int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
			EmployeeDAO employeeDao = new EmployeeDAO();
			Employee employee = employeeDao.getEmployeeById(employeeId);
		%>
		
		<div class="body">
			<p>사원 정보를 확인하세요</p>
			<table class="table bordered">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><%=employee.getId() %></td>
						<th>이름</th>
						<td><%=employee.getFirstName() %> <%=employee.getLastName() %></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><%=employee.getEmail() %></td>
						<th>전화번호</th>
						<td><%=employee.getPhoneNumber() %></td>
					</tr>
					<tr>
						<th>입사일</th>
						<td><%=employee.getHireDate() %></td>
						<th>직종</th>
						<td><%=employee.getJobId() %></td>
					</tr>
					<tr>
						<th>급여</th>
						<td><%=employee.getSalary() %></td>
						<th>커미션</th>
						<td><%=employee.getCommission_pct() %></td>
					</tr>
					<tr>
						<th>매니저</th>
						<td><%=employee.getManagerFirstName() %> <%=employee.getManagerLastName() %></td>
						<th>소속부서</th>
						<td><%=employee.getDepartmentName() %></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="text-right">
			<a href="modifyform.jsp?empid=<%=employee.getId() %>">수정</a>
			<a href="list.jsp?page=<%=pageNo %>">목록</a>
		</div>
	</div>
</body>
</html>