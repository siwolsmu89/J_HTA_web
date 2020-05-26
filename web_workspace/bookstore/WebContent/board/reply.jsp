<%@page import="com.bookstore.dao.ReplyDAO"%>
<%@page import="com.bookstore.vo.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int boardNo = Integer.parseInt(request.getParameter("boardno"));
	String writer = request.getParameter("writer");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	
	Reply reply = new Reply();
	reply.setBoardNo(boardNo);
	reply.setWriter(writer);
	reply.setPassword(password);
	reply.setContent(content);
	
	ReplyDAO replyDao = new ReplyDAO();
	replyDao.addReply(reply);

	response.sendRedirect("detail.jsp?boardno="+ boardNo);
%>