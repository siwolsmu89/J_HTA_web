<%@page import="java.util.List"%>
<%@page import="com.simple.vo.Board"%>
<%@page import="com.simple.dao.BoardDAO"%>
<%@page import="com.simple.vo.Reply"%>
<%@page import="com.simple.dao.ReplyDAO"%>
<%@page import="com.simple.util.StringUtil"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<%
	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	String content = StringUtil.nullToBlank(request.getParameter("content"));
	
	BoardDAO boardDao = new BoardDAO();
	ReplyDAO replyDao = new ReplyDAO();
		
	Reply reply = new Reply();
	reply.setBoardNo(boardNo);
	reply.setContent(content);
	reply.setWriter(userId);
	
	replyDao.addReply(reply);
	
	Board board = boardDao.getBoardByNo(boardNo);
	board.setReplyCnt(board.getReplyCnt()+1);
	boardDao.updateBoard(board);
	
	response.sendRedirect("../board/detail.jsp?boardno=" + boardNo);
%>