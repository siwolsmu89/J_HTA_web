<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="com.bookstore.vo.User"%>
<%@page import="com.bookstore.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = StringUtil.nullToBlank(request.getParameter("userid"));
	String password = StringUtil.nullToBlank(request.getParameter("password"));
	
	UserDAO userDao = new UserDAO();
	User user = userDao.getUserById(userId);
	
	// 아이디에 해당하는 사용자정보가 없음
	if (user == null) {
		response.sendRedirect("loginform.jsp?err=fail");
		return;
	} 
	
	// 사용자 정보는 존재하지만 비밀번호가 일치하지 않음
	if  (!password.equals(user.getPassword())) {
		response.sendRedirect("loginform.jsp?err=fail");
		return;
	} 

	// 아이디에 해당하는 사용자 정보가 존재하고, 비밀번호도 일치할 경우에만 아래 수행문을 실행
	
	// 1. 우리 사이트에 가입한 회원이고, 그 회원이 직접 로그인한 것이 맞음.
	// 2. 회원이 다른 서비스를 사용하는동안 추가적인 회원정보 입력 없이 모든 서비스를 사용하도록 할 것
	// 3. 회원이 지금 사용하고 있는 브라우저만 접근할 수 있는 객체(세션객체)에 회원의 정보를 저장하고, 
	// 그 브라우저로 요청하는 모든 JSP 페이지에서 회원의 정보를 획득할 수 있도록 한다.
	session.setAttribute("userid", userId);
	session.setAttribute("username", user.getName());
	session.setAttribute("login", "Yes");
	response.sendRedirect("/bookstore/home.jsp");
	return;

%>