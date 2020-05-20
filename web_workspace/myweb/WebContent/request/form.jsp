<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request/form</title>
</head>
<body>
	<h1>입력 폼</h1>
	
	<h3>회원가입 정보를 입력하세요</h3>
	<form>
		<div>
			<label>이름</label>
			<div><input type="text" /></div>
		</div>
		<div>
			<label>이메일</label>
			<div><input type="text" /></div>
		</div>
		<div>
			<label>비밀번호</label>
			<div><input type="password" /></div>
		</div>
		<div>
			<label>거주지</label>
			<select>
				<option value="Seoul">서울</option>
				<option value="Gyeong-gi">경기</option>
				<option value="Incheon">인천</option>
			</select>
		</div>
		<div>
			<label>성별</label>
			<input type="radio" name="gender" value="male" /> 남자
			<input type="radio" name="gender" value="female" /> 여자
		</div>
		<div>
			<label>자기소개</label>
			<div>
				<textarea rows="5" cols="5"></textarea>
			</div>
		</div>
		<div>
			<label>개인정보 제공 동의</label>
			<div>
				<input type="checkbox" value="true" /> 동의합니다.
			</div>
		</div>
		<div>
			<button type="submit">회원가입</button>
		</div>
	</form>
	
</body>
</html>