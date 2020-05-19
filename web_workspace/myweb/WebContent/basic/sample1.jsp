<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic/sample1</title>
</head>
<body>
	<h1>스크립틀릿 사용하기</h1>
	
	<%-- 
		스크립틀릿에서 변수 선언하기
	--%>
	
	<%
		String name = "홍길동";
		int age = 30;
		String tel = "010-1111-1234";
		String[] friends = {"김유신", "강감찬", "이순신"};
		
		// sysout 하면 브라우저에 안 찍히고 이클립스 콘솔창에 결과가 나옴
		// System.out.println("이름 : " + name);
	%>
	<h3>사용자 정보</h3>
	<dl>
		<dt>이름</dt> 
		<dd><%=name %></dd>
	</dl>
	<dl>
		<dt>나이</dt> 
		<dd><%=age %></dd>
	</dl>
	<dl>
		<dt>전화번호</dt>
		<dd><%=tel %></dd>
	</dl>	
	<dl>
		<dt>친구들</dt>
		<dd><% for (String friend : friends) { %> 
			<%=friend %>
			<% } %>
		</dd>
	</dl>
	
	
</body>
</html>