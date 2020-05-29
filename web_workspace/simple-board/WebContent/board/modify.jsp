<%@page import="com.simple.dao.BoardDAO"%>
<%@page import="com.simple.vo.Board"%>
<%@page import="com.simple.util.StringUtil"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int boardNo = NumberUtil.stringToInt(request.getParameter("no"));
	String title = StringUtil.nullToBlank(request.getParameter("title"));
	String content = StringUtil.nullToBlank(request.getParameter("content"));
	
	BoardDAO boardDao = new BoardDAO();
	
	Board board = boardDao.getBoardByNo(boardNo);
	board.setTitle(title);
	board.setContent(content);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?boardno="+boardNo);

%>