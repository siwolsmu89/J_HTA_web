<%@page import="com.bookstore.vo.Board"%>
<%@page import="com.bookstore.dao.BoardDAO"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	BoardDAO boardDao = new BoardDAO();
	
	Board board = boardDao.getBoardByNo(boardNo);
	int hit = board.getHit();
	board.setHit(hit + 1);
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?boardno="+boardNo);
%>