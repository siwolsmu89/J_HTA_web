<%@page import="com.simple.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>simple-board/user/form</title>
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
			if ("dup".equals(error)) {
		%>
			<p style="color: red;"><strong>회원가입 실패</strong> : 중복된 아이디</p>
		<%		
			}
		%>
			<p>사용자 정보를 입력하세요</p>
			<div class="well">
				<form action="register.jsp" method="post">
					<div class="form-group">
						<label>아이디</label>
						<input type="text" name="id" />
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" name="pwd" />
					</div>
					<div class="form-group">
						<label>이름</label>
						<input type="text" name="name" />
					</div>
					<div class="form-group">
						<label>이메일</label>
						<input type="text" name="email" />
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