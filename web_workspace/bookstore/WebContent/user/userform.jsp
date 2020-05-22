<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/userform</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<% String position = "user"; %>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>사용자</h1>
		</div>
		
		<div class="body">
			<h3>사용자 등록 폼</h3>
			<form class="form-group" action="adduser.jsp" method="post">
				<div>
					<label>ID</label>
					<input type="text" name="id" />
				</div>
				<div>
					<label>이름</label>
					<input type="text" name="name" />
				</div>
				<div>
					<label>E-mail</label>
					<input type="text" name="email" />
				</div>
				<div class="text-right">
					<button type="submit">등록</button>
				</div>
			</form>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>