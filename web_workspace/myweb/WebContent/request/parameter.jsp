<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request/parameter</title>
</head>
<body>
	<h1>요청 파라미터 보내기</h1>
	
	<h3>POST방식으로 요청 파라미터 보내기</h3>
	<form method="post" action="parameterview.jsp">
		<div>
			<label>장르</label>
			<div><input type="text" name="genre" /></div>
		</div>
		<div>
			<label>검색어</label>
			<div><input type="text" name="keyword" /></div>
		</div>
		<div>
			<button type="submit">제출</button>
		</div>
	</form>
	
	<h3>GET방식으로 요청 파라미터 보내기</h3>
	<ul>
		<li><a href="parameterview.jsp?genre=IT&keyword=자바">자바</a></li>
		<li><a href="parameterview.jsp?genre=IT&keyword=spring">스프링프레임워크</a></li>
		<li><a href="parameterview.jsp?genre=IT&keyword=datascience">데이터과학</a></li>
		<li><a href="parameterview.jsp?genre=IT&keyword=deeplearning">딥러닝</a></li>
	</ul>
	
</body>
</html>