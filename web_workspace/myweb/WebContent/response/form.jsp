<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response/form</title>
</head>
<body>
	<h1>글쓰기</h1>
	
	<form method="post" action="add.jsp">
		<div>
			<label>제목</label>
			<div><input type="text" name="title" /></div>
		</div>
		<div>
			<label>내용</label>
			<div><textarea name="contents" rows="6" cols="50"></textarea></div>
		</div>
		<div>
			<button type="submit">등록</button>
		</div>
	</form>
</body>
</html>