<%@page import="com.simple.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.dao.BoardDAO"%>
<%@page import="com.simple.vo.User"%>
<%@page import="com.simple.dao.UserDAO"%>
<%@page import="com.simple.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Board</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
<div class="wrapper">
	<div class="navi">
		<%@ include file="../common/navbar.jsp" %>
	</div>
	
	<%
		String userId = StringUtil.nullToBlank(request.getParameter("writer"));
		UserDAO userDao = new UserDAO();
		User user = userDao.getUserById(userId);
		BoardDAO boardDao = new BoardDAO();
		List<Board> myBoards = boardDao.getMyBoards(userId);
	%>
	
	<div class="header">
		<h1><small style="font-weight: normal;"><%=user.getName() %></small>님의 게시글</h1>
	</div>
	<div class="body">
		
		<%
			if (myBoards.isEmpty()) {
		%>	
		<p>작성된 글이 없습니다.</p>
		<%
			} else {
		%>
		<p>게시글 목록을 확인하세요</p>
		
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
					for (Board board : myBoards) {
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
					}
				%>	
				</tbody>
			</table>
		</div>
		<%
			}
		%>
	</div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>