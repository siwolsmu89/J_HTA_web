<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="com.bookstore.vo.Board"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/deleteform</title>
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
			<h1>게시글 삭제 폼</h1>
		</div>
		
		<%
			int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
			String err = StringUtil.nullToBlank(request.getParameter("err"));
			if ("password".equals(err)) {
		%>
				<p style="color:red;"><strong> 비밀번호가 일치하지 않아 삭제에 실패했습니다. </strong></p>
		<%
			}
			BoardDAO boardDao = new BoardDAO();
			Board board = boardDao.getBoardByNo(boardNo);
		%>
		
		<div class="body">
			<h3>글 수정하기</h3>
			<div class="well">
				<form action="delete.jsp" method="post">
					<div  class="form-group">
						<label>제목</label>
						<input type="text" disabled value="<%=board.getTitle() %> " />
					</div>
					<div  class="form-group">
						<label>작성자</label>
						<input type="text" disabled value="<%=board.getWriter() %>" />
					</div>
					<div  class="form-group">
						<label>비밀번호</label>
						<input type="password" name="input" maxlength="4" />
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="50" cols="10" disabled><%=board.getContent() %></textarea>
					</div>
					<div>
						<input type="hidden" name="boardno" value="<%=boardNo %>" />
					</div>
					<div class="text-right">
						<button type="submit">수정</button>
					</div>
				</form>
			</div>
		</div>
		<%@ include file="../common/footer.jsp" %>		
	</div>
</body>
</html>