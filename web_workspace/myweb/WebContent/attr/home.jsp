<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속성과 스코프</title>
</head>
<body>
	<h1>속성과 스코프 연습하기</h1>
	
	<div>
		<h3>PageContext</h3>
		<form method="post" action="page1.jsp">
			<div>
				<label>PageContext에 저장할 값을 입력하세요</label>
				<div>
					<input type="text" name="value1" />
				</div>
			</div>
			<div>
				<button type="submit">제출</button>
			</div>
		</form>
	</div>
</body>
</html>