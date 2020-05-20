<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request/userform</title>
</head>
<body>
	<h1>사용자 등록 폼</h1>
	
	<h3>신규 사용자 정보를 입력하세요.</h3>
	<div>
		<form action="userregister.jsp" method="post">
			<div>
				<label>아이디</label>
				<input type="text" name="userid" />
			</div>
			<div>
				<label>이름</label>
				<input type="text" name="username" />
			</div>
			<div>
				<label>비밀번호</label>
				<input type="password" name="password" />
			</div>
			<div>
				<label>이메일</label>
				<input type="text" name="useremail" />
			</div>
			<div>
				<button type="submit">가입하기</button>
			</div>
		</form>
	</div>
</body>
</html>