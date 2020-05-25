<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/form</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" >
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "board";
			%>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>게시글 작성 폼</h1>
		</div>
		
		<div class="body">
			<h3>새 글 쓰기</h3>
			<div class="well">
				<form action="register.jsp" method="post">
					<div  class="form-group">
						<label>제목</label>
						<input type="text" name="title" />
					</div>
					<div  class="form-group">
						<label>작성자</label>
						<input type="text" name="writer" />
					</div>
					<div  class="form-group">
						<label>비밀번호</label>
						<input type="password" name="password" />
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="50" cols="10" name="content"></textarea>
					</div>
					<div class="text-right">
						<button type="submit">등록</button>
					</div>
				</form>
			</div>
		</div>
		<%@ include file="../common/footer.jsp" %>		
	</div>
</body>
</html>