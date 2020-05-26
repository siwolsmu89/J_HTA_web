<%@page import="com.bookstore.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.BoardDAO"%>
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
				<%
					BoardDAO boardDao = new BoardDAO();
					List<Board> boards = boardDao.getAllBoards();
				%>
					<tbody>
				<%
					if (!boards.isEmpty()) {
						for (Board board : boards) {
				%>
						<tr>
							<td><%=board.getNo() %></td>
				<%
							if(!board.isDeleted()) { 
				%>
							<td><a href="detail.jsp?boardno=<%=board.getNo() %>"><%=board.getTitle() %></a></td>
							<td><%=board.getWriter() %></td>
							<td><%=board.getHit() %></td>
							<td><%=board.getRegisteredDate() %></td>
				<%	
							} else {
				%>
							<td colspan="4" style="text-decoration: line-through;">삭제된 글입니다.</td>
				<%	
							}
				%>
						</tr>
				<%
						}
					} else {
				%>
						<tr>
							<td colspan="5">작성된 글이 없습니다.</td>
						</tr>
				<%
					}
				%>
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