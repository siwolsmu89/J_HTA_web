<%@page import="com.bookstore.vo.Order"%>
<%@page import="com.bookstore.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int bookNo = Integer.parseInt(request.getParameter("bookno"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	int price = Integer.parseInt(request.getParameter("orderprice"));
	String userId = request.getParameter("userid");
	
	Order order = new Order();
	order.setBook(bookNo);
	order.setAmount(amount);
	order.setPrice(price);
	order.setUserId(userId);
	
	OrderDAO orderDao = new OrderDAO();
	orderDao.addOrder(order);
	
	response.sendRedirect("/bookstore/order/completed.jsp");
%>