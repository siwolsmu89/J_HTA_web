<%@page import="com.sample.dao.UserDAO"%>
<%@page import="com.sample.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request/userregister</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("userid");
		String password = request.getParameter("password");
		String name = request.getParameter("username");
		String email = request.getParameter("useremail");
		
		User user = new User();
		user.setId(id);
		user.setPassword(password);
		user.setName(name);
		user.setEmail(email);
		
		UserDAO userDao = new UserDAO();
		userDao.insertUser(user);
	%>
	<h1>회원 등록완료</h1>
	<p>축하드립니다. 회원가입이 완료되었습니다.</p>
	
	<h3>가입 시 입력한 정보</h3>
	<div>
		<dl>
			<dt>아이디</dt>
			<dd><%=id %></dd>
		</dl>
		<dl>
			<dt>비밀번호</dt>
			<dd><%=password %></dd>
		</dl>
		<dl>
			<dt>이름</dt>
			<dd><%=name %></dd>
		</dl>
		<dl>
			<dt>메일주소</dt>
			<dd><%=email %></dd>
		</dl>
	</div>
</body>
</html>