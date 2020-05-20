<%@page import="com.sample.dao.UserDAO"%>
<%@page import="com.sample.vo.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request/userlist</title>
</head>
<body>
	<h1>전체 사용자 정보 조회</h1>
	
	<%
		UserDAO userDao = new UserDAO();
		List<User> allUsers = userDao.getAllUsers();
		
		int size = allUsers.size();
	%>
	
	<p> 총 <%=size %>명의 사용자 정보가 있습니다 </p>
	<div>
		<table border="1" style="width:100%">
			<thead>
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>메일주소</th>
					<th>포인트</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (User user : allUsers) {
				%>
					<tr>
						<td><%=user.getId() %></td>
						<td><%=user.getPassword() %></td>
						<td><%=user.getName() %></td>
						<td><%=user.getEmail() %></td>
						<td><%=user.getPoint() %></td>
						<td><%=user.getRegisteredDate() %></td>
					</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>