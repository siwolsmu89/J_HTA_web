<%@page import="com.simple.util.StringUtil"%>
<%@page import="com.simple.vo.Board"%>
<%@page import="com.simple.dao.BoardDAO"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
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
	<div class="header">
		<h1>게시글 수정</h1>
	</div>

	<%
		int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
		BoardDAO boardDao = new BoardDAO();
		Board board = boardDao.getBoardByNo(boardNo);
	%>
	<div class="body">
	<%
		String disabled = "";
		if (!userId.equals(board.getWriter())) {
	%>
		<p><strong style="color: red;">오류발생</strong> : 다른 사람의 글을 수정할 수 없습니다.</p>
		<p><a href="detail.jsp?boardno=<%=boardNo %>"><span style="color: red;">글정보로 돌아가기</span></a></p>
	<%			
			disabled="disabled";
		}
	%>
		<p>게시글 정보를 확인하고 수정하세요</p>
		<div class="well">
			<form method="post" action="modify.jsp">
				<!-- value에는 실제 글번호, 제목 내용이 들어가게 하세요 -->
				<input type="hidden" name="no" value="<%=board.getNo() %>" >
				<div class="form-group">
					<label>제목</label>
					<div><input type="text" name="title" value="<%=board.getTitle() %>" <%=disabled %> /></div>
				</div>
				<div class="form-group">
					<label>내용</label>
					<div><textarea rows="12" name="content" <%=disabled %> ><%=board.getContent() %></textarea></div>
				</div>
				<div class="text-right">
					<button type="submit" <%=disabled %>>수정</button>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>