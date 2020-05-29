<%@page import="com.simple.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%@ include file="../common/navbar.jsp" %>
		</div>

		<div class="header">
			<h1>게시판</h1>
		</div>

		<div class="body">
			<% 
				BoardDAO  boardDao = new BoardDAO();
				List<Board> allBoards = boardDao.getAllBoards();
			
				if (allBoards.isEmpty()) {
			%>
				<div>
					<p> 현재 작성된 글이 없습니다 </p>
				</div>
			<%
				} else {
			%>
				<div>
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="*">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center">번호</th>
								<th>제목</th>
								<th class="text-center">작성자</th>
								<th class="text-center">조회수</th>
								<th class="text-center">댓글수</th>
								<th class="text-center">등록일</th>
							</tr>
						</thead>
						<tbody>
			<%
					for (Board board : allBoards) {
						if (!board.isDeleted()) {
			%>						
							<tr>
								<td class="text-center"><%=board.getNo() %></td>
								<td><a href="detail.jsp?boardno=<%=board.getNo() %>"><%=board.getTitle() %></a></td>
								<td class="text-center"><a href="writers.jsp?writer=<%=board.getWriter() %>"><%=board.getWriter() %></a></td>
								<td class="text-center"><%=board.getHit() %></td>
								<td class="text-center"><%=board.getReplyCnt() %></td>
								<td class="text-center"><%=board.getCreatDate() %></td>
							</tr>
			<%
						} else {
			%>
							<tr>
								<td class="text-center"><%=board.getNo() %></td>
								<td class="text-center" colspan="4" style="text-decoration: line-through;">삭제된 글입니다.</td>
								<td class="text-center"><%=board.getCreatDate() %></td>
							</tr>							
			<%
						}	
					}
			%>			
						</tbody>
					</table>				
				</div>
			<%
				}
			%>
			<div class="text-right">
				[<a href="form.jsp">글 쓰기</a>]
			</div>
		</div>

		<div class="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</body>
</html>