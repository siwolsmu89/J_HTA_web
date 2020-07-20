<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	// 2초 지연...
	Thread.sleep(2000);
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name", "홍길동");
	map.put("tel", "010-1234-5678");
	map.put("email", "hong@gamil.com");
	map.put("age", 46);
	map.put("married", true);
	map.put("family", new String[]{"홍여사","홍아들","홍공주"});
	
	// Gson은 배열이나 객체를 텍스트형식으로 변환해준다.
	Gson gson = new Gson();
	String text = gson.toJson(map);
	
	out.write(text);
%>