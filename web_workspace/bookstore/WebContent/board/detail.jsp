<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.vo.Reply"%>
<%@page import="com.bookstore.dao.ReplyDAO"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.vo.Board"%>
<%@page import="com.bookstore.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/detail</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<% String position = "board"; %>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		
		<div class="header">
			<h1>게시판</h1>
		</div>
		<%
			int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
			BoardDAO boardDao = new BoardDAO();
			Board board = boardDao.getBoardByNo(boardNo);
		%>
		<div class="body">
			<div>
				<h3>글 내용</h3>
				<table class="table boardered">
					<tr>
						<th>제목</th>
						<td><%=board.getTitle() %></td>
						<th>작성자</th>
						<td><%=board.getWriter() %></td>
						<th>작성일</th>
						<td><%=board.getRegisteredDate() %></td>
					</tr>
					<tr>
						<td colspan="6">
							<%=board.getContent() %>
						</td>
					</tr>
									
				</table>
			</div>
			
			<div>
				<h3>댓글보기</h3>
				<table class="table boardered">
			<%
				ReplyDAO replyDao = new ReplyDAO();
				List<Reply> replys = replyDao.getReplysByBoardNo(boardNo); 
				if (!replys.isEmpty()) {
					for (Reply reply : replys) {
			%>
					<tr>
						<th>작성자</th>
						<td><%=reply.getWriter() %></td>
						<th>작성일</th>
						<td><%=reply.getRegisteredDate() %></td>
					</tr>
					<tr>
						<td colspan="6">
							<%=StringUtil.strWithBr(reply.getContent()) %>
						</td>
					</tr>
			<%			
					}
				} else {
					
			%>
					<tr>
						<td>댓글이 없습니다.</td>
					</tr>
			<%		
				}
			%>
				</table>
			</div>
			
			<div>
				<h3>댓글작성</h3>
				<div class="well">
				<form action="reply.jsp?boardno=<%=boardNo %>" method="post">
					<div  class="form-group">
						<label>작성자</label>
						<input type="text" name="writer" />
					</div>
					<div  class="form-group">
						<label>비밀번호</label>
						<input type="password" name="password" maxlength="4" />
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="3" cols="10" name="content"></textarea>
					</div>
					<div class="text-right">
						<button type="submit">등록</button>
					</div>
				</form>
			</div>
			</div>
		</div>
		
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>