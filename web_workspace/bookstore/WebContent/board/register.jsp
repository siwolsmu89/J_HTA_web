<%@page import="com.bookstore.dao.BoardDAO"%>
<%@page import="com.bookstore.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	Board board = new Board();
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	board.setTitle(title);
	board.setWriter(writer);
	board.setPassword(password);
	board.setContent(content);
	
	BoardDAO boardDao = new BoardDAO();
	boardDao.addBoard(board);

	response.sendRedirect("list.jsp");
%>