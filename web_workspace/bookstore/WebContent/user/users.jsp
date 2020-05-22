<%@page import="com.bookstore.dao.UserDAO"%>
<%@page import="com.bookstore.vo.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/users</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "user";
			%>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>사용자</h1>
		</div>
		
		<%
			UserDAO userDao = new UserDAO();
			List<User> allUsers = userDao.getAllUsers();
		%>
		
		<div class="body">
			<div>
				<h3>사용자 리스트</h3>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>이름</th>
							<th>이메일</th>
							<th>포인트</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (!allUsers.isEmpty()) {
								for (User user : allUsers) {
						%>
							<tr>
								<td><%=user.getId() %></td>
								<td><%=user.getName() %></td>
								<td><%=user.getEmail() %></td>
								<td><%=user.getPoint() %></td>
								<td><%=user.getRegisteredDate() %></td>
							</tr>								
						<%			
								}
							} else {
						%>
							<tr>
								<td colspan="5">등록된 사용자가 없습니다.</td>
							</tr>
						<%		
							}
						%>
					</tbody>
				</table>
			</div>
			<div class="text-right">
				<button type="button"><a href="form.jsp"><strong>신규 등록</strong></a></button>
			</div>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>