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
		<h3>page1.jsp로 입력값을 제출하는 폼</h3>
		<form method="post" action="page1.jsp">
			<div>
				<label>PageContext에 저장할 값을 입력하세요</label>
				<div>
					<input type="text" name="value1" />
				</div>
			</div>
			<div>
				<label>HttpServletRequest에 저장할 값을 입력하세요</label>
				<div>
					<input type="text" name="value2" />
				</div>
			</div>
			<div>
				<label>HttpSession에 저장할 값을 입력하세요</label>
				<div>
					<input type="text" name="value3" />
				</div>
			</div>
			<div>
				<label>HttpServletContext에 저장할 값을 입력하세요</label>
				<div>
					<input type="text" name="value4" />
				</div>
			</div>
			<div>
				<button type="submit">page1에 제출</button>
			</div>
		</form>
		<div>
			<p><a href="page2.jsp">page2로 이동하기</a></p>	
			<p><a href="page3.jsp">page3로 이동하기</a></p>	
		</div>
	</div>

	<div>
		<h3>page4.jsp로 입력값을 제출하는 폼</h3>
		<form method="post" action="page4.jsp">
			<div>
				<label>PageContext에 저장할 값을 입력하세요</label>
				<div>
					<input type="text" name="value1" />
				</div>
			</div>
			<div>
				<label>HttpServletRequest에 저장할 값을 입력하세요</label>
				<div>
					<input type="text" name="value2" />
				</div>
			</div>
			<div>
				<label>HttpSession에 저장할 값을 입력하세요</label>
				<div>
					<input type="text" name="value3" />
				</div>
			</div>
			<div>
				<label>HttpServletContext에 저장할 값을 입력하세요</label>
				<div>
					<input type="text" name="value4" />
				</div>
			</div>
			<div>
				<button type="submit">page4에 제출</button>
			</div>
		</form>
	</div>
</body>
</html>