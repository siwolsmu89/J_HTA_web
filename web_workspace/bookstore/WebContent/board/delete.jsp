<%@page import="com.bookstore.vo.Board"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String input = request.getParameter("input");
	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	BoardDAO boardDao = new BoardDAO();
	Board board = boardDao.getBoardByNo(boardNo);
	String password = board.getPassword();
	
	if (input.equals(password)) {
		board.setDeleted(true);		
		boardDao.updateBoard(board);
		
		response.sendRedirect("list.jsp");
	} else {
		response.sendRedirect("deleteform.jsp?boardno="+boardNo+"&err=password");
	}
%>