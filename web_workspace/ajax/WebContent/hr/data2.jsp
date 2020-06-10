<%@page import="com.google.gson.Gson"%>
<%@page import="com.sample.hr.vo.Employee"%>
<%@page import="com.sample.hr.dao.EmployeeDAO"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	int employeeId = NumberUtil.stringToInt(request.getParameter("id"));
	
	EmployeeDAO empDao = new EmployeeDAO();
	Employee emp = empDao.getEmployeeById(employeeId);
	
	Gson gson = new Gson();
	String jsonText = gson.toJson(emp);
	
	out.write(jsonText);
%>