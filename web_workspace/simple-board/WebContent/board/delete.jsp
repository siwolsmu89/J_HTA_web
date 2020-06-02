<%@page import="com.simple.vo.Board"%>
<%@page import="com.simple.dao.BoardDAO"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);

	BoardDAO boardDao = new BoardDAO();
	
	Board board = boardDao.getBoardByNo(boardNo);
	
	if (!userId.equals(board.getWriter())) {
		response.sendRedirect("detail.jsp?boardno=" + boardNo + "&error=user");
		return;
	}
	
	board.setDeleted(true);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("list.jsp?page="+pageNo);

%>