<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/loginform</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "login";
			%>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>로그인</h1>
		</div>
		
		<div class="body">
		
		<% 
			String err = request.getParameter("err");
		
			if ("fail".equals(err)) {
		%>
			<div>
				<p style="color: red; font-style: italic;"><strong>아이디 혹은 비밀번호가 올바르지 않습니다.</strong></p>
			</div>
		<%		
			}
		%>
		
		
			<p>로그인 정보를 입력하세요</p>
			<div class="well">
				<form method="post" action="login.jsp">
					<div class="form-group">
						<label>아이디</label>
						<div>
							<input type="text" name="userid" />
						</div>
					</div>
					
					<div class="form-group">
						<label>비밀번호</label>
						<div>
							<input type="password" name="password" />
						</div>
					</div>
					<div class="text-right">
						<button type="submit">로그인</button>
					</div>
				</form>
			</div>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>