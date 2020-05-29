<%@page import="com.simple.vo.Board"%>
<%@page import="com.simple.dao.BoardDAO"%>
<%@page import="com.simple.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title = StringUtil.nullToBlank(request.getParameter("title"));
	String content = StringUtil.nullToBlank(request.getParameter("content"));
	
	if ("".equals(title)) {
		response.sendRedirect("form.jsp?err=null");
		return;	
	} else if ("".equals(content)) {
		response.sendRedirect("form.jsp?err=null");
		return;
	}
	
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setWriter((String) session.getAttribute("logined_user_id"));
	
	BoardDAO boardDao = new BoardDAO();
	boardDao.addBoard(board);
	
	response.sendRedirect("list.jsp");
	
%>