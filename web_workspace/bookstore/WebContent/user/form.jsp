<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/form</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<% String position = "register"; %>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>사용자</h1>
		</div>
		
		<div class="body">
			<h3>사용자 등록 폼</h3>
			<form action="add.jsp" method="post">
				<div class="form-group">
					<label>ID</label>
					<input type="text" name="id" />
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" name="password" />
				</div>
				<div class="form-group">
					<label>이름</label>
					<input type="text" name="name" />
				</div>
				<div class="form-group">
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