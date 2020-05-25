<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class = "wrapper">
		<div class="navi">
			<% String position = "board"; %>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>게시판</h1>
		</div>
		
		<div class="body">
			<div>
				<h3>전체 글 목록</h3>
				
				<table class="table bordered" >
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a href="detail.jsp?boardno=<%=1%>">게시글임시</a></td>
							<td>임시인</td>
							<td>1건</td>
							<td>2020-05-26</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="text-right">
				<a href="form.jsp"><button type="button">글쓰기</button></a>
			</div>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>