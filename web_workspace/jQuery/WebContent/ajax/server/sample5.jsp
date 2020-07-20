<%@page import="com.simple.form.SearchForm"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");

	BufferedReader in = request.getReader();
	String requestData = in.readLine();
	System.out.println("요청 데이터: " + requestData);
	
	Gson gson = new Gson();
	SearchForm searchForm = gson.fromJson(requestData, SearchForm.class);
	System.out.println("카테고리: " +searchForm.getCategory());
	System.out.println("타입: " +searchForm.getType());
	System.out.println("가격: " +searchForm.getPrice());
%>