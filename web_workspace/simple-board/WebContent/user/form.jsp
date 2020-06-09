<%@page import="com.simple.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>simple-board/user/form</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css" />
<style>
	.error {
		color: red;
		font-weight: bold;
		font-style: italic;
	}
	.field-error {
		border: 1px solid red;
	}
</style>
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
				<form action="register.jsp" method="post" onsubmit="checkField(event)">
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
	
	<script type="text/javascript">
		function checkField() {
			clearErrorField();

			var nameField = document.querySelector("input[name=name]");
			var emailField = document.querySelector("input[name=email]");
			var idField = document.querySelector("input[name=id]");
			var pwdField = document.querySelector("input[name=pwd]");
			
			var isPassed = true;
			if (!nameField.value) {
				nameField.classList.add("field-error");
				isPassed = false;
			}
			if (!emailField.value) {
				emailField.classList.add("field-error");
				isPassed = false;
			}
			if (!idField.value) {
				idField.classList.add("field-error");
				isPassed = false;
			}
			if (!pwdField.value) {
				pwdField.classList.add("field-error");
				isPassed = false;
			}
			
			if (!isPassed) {
				event.preventDefault();
			}
		}
		
		function clearErrorField() {
			var fields = document.querySelectorAll(".form-group input");
			for (var i=0; i<fields.length; i++) {
				var input = fields[i];
				input.classList.remove('field-error');
			}
		}
		
	</script>
</body>
</html>