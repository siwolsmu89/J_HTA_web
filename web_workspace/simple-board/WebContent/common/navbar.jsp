<%@page import="com.simple.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="navibar">

<%
	String logined_yn = StringUtil.nullToBlank((String) session.getAttribute("logined_yn"));
	String logined_userId = "";
	String logined_userName = "";
	String display = "none";
	if ("Y".equals(logined_yn)) {
		logined_userId = (String) session.getAttribute("logined_user_id");
		logined_userName = (String) session.getAttribute("logined_user_name");
		display = "";
	}
%>

	<ul>
		<li><a href="/simple-board/home.jsp">홈</a></li>
		<li><a href="/simple-board/board/list.jsp">게시판</a></li>
		<li><a href="/simple-board/user/my.jsp">내 정보</a></li>
	<%
		if ("Y".equals(logined_yn)) {
	%>		
		<li class="right"><a href="/simple-board/user/logout.jsp">로그아웃</a></li>
	<%
		} else {
	%>		
		<li class="right"><a href="/simple-board/user/loginform.jsp">로그인</a></li>
		<li class="right"><a href="/simple-board/user/form.jsp">회원가입</a></li>
	<%
		}
	%>
	</ul>
	
	<p style="display: <%=display %>"><%=logined_userName %>님, 환영합니다.</p>
</div>