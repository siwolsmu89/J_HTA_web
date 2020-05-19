<%@page import="com.sample.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic/sample2</title>
</head>
<body>
	<h1>스크립틀릿 사용하기</h1>
	
	<%
		// 객체를 생성하고, 고객 정보를 Person 객체에 저장
		Person person = new Person();
		person.setName("김유신");
		person.setAge(50);
		person.setTel("010-1234-5678");
		
		// 고객 정보를 출력결과에 포함시켜라!!!!
	%>
	
	<h3>고객 정보</h3>
	<dl>
		<dt>고객명</dt>
		<dd><%=person.getName() %>></dd>
	</dl>
	<dl>
		<dt>연락처</dt>
		<dd><%=person.getTel() %></dd>
	</dl>
	<dl>
		<dt>나이</dt>
		<dd><%=person.getAge() %></dd>
	</dl>
</body>
</html>