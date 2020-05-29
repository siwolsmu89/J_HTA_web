<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Board</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
<div class="wrapper">
	<div class="navi">
		<%@ include file="../common/navbar.jsp" %>
	</div>
	<div class="header">
		<h1>새 게시글 작성</h1>
	</div>
	<div class="body">
		<p>게시글 정보를 입력하세요</p>
		<div class="well">
			<form method="post" action="register.jsp">
				<div class="form-group">
					<label>제목</label>
					<div><input type="text" name="title" /></div>
				</div>
				<div class="form-group">
					<label>내용</label>
					<div><textarea rows="12" name="content"></textarea></div>
				</div>
				<div class="text-right">
					<button type="submit">등록</button>
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