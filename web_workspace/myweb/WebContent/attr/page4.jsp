<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String value1 = request.getParameter("value1");
	String value2 = request.getParameter("value2");
	String value3 = request.getParameter("value3");
	String value4 = request.getParameter("value4");

	// PageContext 객체에 속성값 담기
	pageContext.setAttribute("p", value1);
	request.setAttribute("r", value2);
	session.setAttribute("s", value3);
	application.setAttribute("a", value4);
	
	// PageContext에 저장된 속성값 꺼내기
	String savedValue1 = (String) pageContext.getAttribute("p");
	String savedValue2 = (String) request.getAttribute("r");
	String savedValue3 = (String) session.getAttribute("s");
	String savedValue4 = (String) application.getAttribute("a");

	System.out.println("page1.jsp의 PageContext에서 조회한 값: " + savedValue1);
	System.out.println("page1.jsp의 HttpServletRequest에서 조회한 값: " + savedValue2);
	System.out.println("page1.jsp의 HttpSession에서 조회한 값: " + savedValue3);
	System.out.println("page1.jsp의 ServletContext에서 조회한 값: " + savedValue4);
	
	// page5.jsp로 내부이동시킨다.
	// RequestDispatcher는 클라이언트의 요청을 다른 JSP로 이동시키는 기능을 가진 객체다.
	RequestDispatcher dispatcher = request.getRequestDispatcher("page5.jsp");
	dispatcher.forward(request, response);
%>