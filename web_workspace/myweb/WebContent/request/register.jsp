<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request/register</title>
</head>
<body>
	<h1>요청 파라미터 조회하기</h1>
	
	<%
		// 값을 꺼내기 전에 폼 입력값이 인코딩된 방식을 지정해야 함(디코딩에 사용하기 위해)
		request.setCharacterEncoding("UTF-8");
	
		String name = request.getParameter("username");
		String email = request.getParameter("useremail");
		String password = request.getParameter("password");
		String city = request.getParameter("usercity");
		String sex = request.getParameter("usersex");
		String profile = request.getParameter("userprofile");
		String agreement = request.getParameter("useragreement");
	%>
	
	<h3>회원가입 정보</h3>
	<dl>
		<dt>이름</dt>
		<dd><%=name %></dd>
	</dl>
	<dl>
		<dt>비밀번호</dt>
		<dd><%=password %></dd>
	</dl>
	<dl>
		<dt>이메일</dt>
		<dd><%=email %></dd>
	</dl>
	<dl>
		<dt>거주지</dt>
		<dd><%=city %></dd>
	</dl>
	<dl>
		<dt>성별</dt>
		<dd><%=sex %></dd>
	</dl>
	<dl>
		<dt>자기소개</dt>
		<dd><%=profile %></dd>
	</dl>
	<dl>
		<dt>개인정보 제공 동의</dt>
		<dd><%=agreement %></dd>
	</dl>
</body>
</html>