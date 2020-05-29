<%@page import="com.simple.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%@ include file="../common/navbar.jsp" %>
		</div>

		<div class="header">
			<h1>심플한 커뮤니티 게시판</h1>
		</div>

		<div class="body">
		<%
			String error = StringUtil.nullToBlank(request.getParameter("error"));
			if ("failed".equals(error)) {
		%>
			<p style="color: red;"><strong>오류 발생</strong> : 아이디 혹은 비밀번호 오류</p>
		<%		
			}
			
			if ("deny".equals(error)) {
		%>
			<p style="color: red;"><strong>오류 발생</strong> : 로그인이 필요한 서비스</p>
		<%
			}
		%>
			<p>로그인 정보를 입력하세요</p>
			<div class="well">
				<form action="login.jsp" method="post">
					<div class="form-group">
						<label>아이디</label>
						<input type="text" name="id" />
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" name="pwd" />
					</div>
					<div class="form-group">
						<input type="submit" />
					</div>
				</form>
			</div>
		</div>
		<div class="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</body>
</html>