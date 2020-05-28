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
			ReplyDAO replyDao = new ReplyDAO();
			List<Reply> replys = replyDao.getReplysByBoardNo(boardNo);
		%>
		<div class="body">
			<div>
				<h3>글 내용</h3>
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="10%">
						<col width="40%">
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="3"><%=board.getTitle() %></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><%=board.getWriter() %></td>
							<th>작성일</th>
							<td><%=board.getRegisteredDate() %></td>
						</tr>
						<tr>
							<th>조회수</th>
							<td><%=board.getHit() %></td>
							<th>댓글수</th>
							<td><%=replys.size() %></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">
								<%=StringUtil.strWithBr(board.getContent()) %>
							</td>
						</tr>
					</tbody>
				</table>
				<hr>
				<div class="text-right">
					<a href="modifyform.jsp?boardno=<%=boardNo %>"><strong>[수정]</strong></a>
					<a href="deleteform.jsp?boardno=<%=boardNo %>"><strong>[삭제]</strong></a>
					<a href="list.jsp"><strong>[목록으로 가기]</strong></a>
				</div>
			</div>
			
			<div>
				<h3>댓글보기</h3>
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="10%">
						<col width="40%">
					</colgroup>
			<%
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
						<th>내용</th>
						<td colspan="3">
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
				<div class="well">
				<form action="reply.jsp?boardno=<%=boardNo %>" method="post">
					<div class="form-group">
						<label>작성자</label>
						<%
							String writer = (String) session.getAttribute("username");
						
							if (writer==null) {
						%>
						<input type="text" name="writer" placeholder="작성자를 입력해주세요" />
						<%		
							} else {
						%>
						<input type="text" name="writer" value="<%=writer %>" readonly />
						<%
							}
						%>						
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" name="password" maxlength="4" placeholder="비밀번호를 4자리 숫자로 입력해주세요(0으로 시작할 수 없음)"/>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="4" name="content"></textarea>
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