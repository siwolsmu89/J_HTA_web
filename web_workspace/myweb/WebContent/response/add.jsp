<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String title =request.getParameter("title");
	String content = request.getParameter("contents");
	
	// 이하 생략된 코드 (DB에 폼 입력값을 저장)
	// Board board = new Board();
	// board.setTitle(title);
	// board.setContent(content);
	
	// BoardDAO boardDao = new BoardDAO();
	// boardDao.insertBoard(board);
	
	// 재요청할 URL을 클라이언트에 응답으로 보내기
	response.sendRedirect("list.jsp");
%>