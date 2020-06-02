<%@page import="com.simple.vo.Reply"%>
<%@page import="com.simple.dao.ReplyDAO"%>
<%@page import="com.simple.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>simple-board/user/form</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%@ include file="../common/navbar.jsp" %>
		</div>

		<div class="header">
			<h1>내 정보</h1>
		</div>

		<div class="body">
			<p><strong><%=loginedUserName %></strong>님, 환영합니다.</p>
			
			<div>
				<h3> 내가 쓴 글 목록 보기 </h3>
			<%
				BoardDAO boardDao = new BoardDAO();
				List<Board> myBoards = boardDao.getMyBoards(loginedUserId);
				
				if (myBoards.isEmpty()) {
			%>
				<p>내가 쓴 글이 없습니다.</p>
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
								<th class="text-center">조회수</th>
								<th class="text-center">댓글수</th>
								<th class="text-center">삭제여부</th>
								<th class="text-center">등록일</th>
							</tr>
						</thead>
						<tbody>
			<%
					for (Board board : myBoards) {
						String deleted = "";
						if (board.isDeleted()) {
							deleted = "O";
						} else {
							deleted = "X";
						}
						
			%>
							<tr>
								<td class="text-center"><%=board.getNo() %></td>
								<td><a href="../board/detail.jsp?boardno=<%=board.getNo() %>"><%=board.getTitle() %></a></td>
								<td class="text-center"><%=board.getHit() %></td>
								<td class="text-center"><%=board.getReplyCnt() %></td>
								<td class="text-center"><%=deleted %></td>
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
			
			<div>
				<h3> 내가 쓴 댓글 목록 보기 </h3>
				
				<%
				ReplyDAO replyDao = new ReplyDAO();
				List<Reply> myReplys = replyDao.getMyReplys(loginedUserId);
				
				if (myReplys.isEmpty()) {
			%>
				<p>내가 쓴 댓글이 없습니다.</p>
			<%
				} else {
			%>
				<div>
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="*">
							<col width="10%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center">번호(글)</th>
								<th>내용</th>
								<th class="text-center">삭제여부</th>
								<th class="text-center">등록일</th>
							</tr>
						</thead>
						<tbody>
			<%
					for (Reply reply : myReplys) {
						String deleted = "";
						if (reply.isDeleted()) {
							deleted = "O";
						} else {
							deleted = "X";
						}
			%>
							<tr>
								<td class="text-center"><%=reply.getNo() %> (<%=reply.getBoardNo() %>)</td>
								<td><%=reply.getContent() %></td>
								<td class="text-center"><%=deleted %></td>
								<td  class="text-center"><%=reply.getCreateDate() %></td>
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
		</div>
		
		<div class="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	</div>
</body>
</html>