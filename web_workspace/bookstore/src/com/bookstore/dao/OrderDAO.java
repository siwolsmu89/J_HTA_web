package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.OrderDTO;
import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.Order;

public class OrderDAO {
	
	public List<OrderDTO> getAllOrders() throws SQLException {
		List<OrderDTO> orders = new ArrayList<OrderDTO>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getAllOrders"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDTO order = new OrderDTO();
			
			order.setNo(rs.getInt("order_no"));
			order.setBookNo(rs.getInt("book_no"));
			order.setBookTitle(rs.getString("book_title"));
			order.setUserId(rs.getString("user_id"));
			order.setUserName(rs.getString("user_name"));
			order.setPrice(rs.getInt("order_price"));
			order.setAmount(rs.getInt("order_amount"));
			order.setRegisteredDate(rs.getDate("order_registered_date"));
			order.setReviewNo(rs.getInt("review_no"));
			order.setLike(rs.getInt("my_like"));
			
			orders.add(order);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orders;
	}
	
	public List<OrderDTO> getOrdersByGenre(String genre) throws SQLException {
		List<OrderDTO> orders = new ArrayList<OrderDTO>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersByGenre"));
		pstmt.setString(1, genre);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDTO order = new OrderDTO();
			
			order.setNo(rs.getInt("order_no"));
			order.setBookNo(rs.getInt("book_no"));
			order.setBookTitle(rs.getString("book_title"));
			order.setUserId(rs.getString("user_id"));
			order.setUserName(rs.getString("user_name"));
			order.setPrice(rs.getInt("order_price"));
			order.setAmount(rs.getInt("order_amount"));
			order.setRegisteredDate(rs.getDate("order_registered_date"));
			order.setReviewNo(rs.getInt("review_no"));
			order.setLike(rs.getInt("my_like"));
			
			orders.add(order);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orders;
	}
	
	
	public List<OrderDTO> getOrdersById(String userId) throws SQLException {
		List<OrderDTO> orders = new ArrayList<OrderDTO>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrdersById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDTO order = new OrderDTO();
			
			order.setNo(rs.getInt("order_no"));
			order.setBookNo(rs.getInt("book_no"));
			order.setBookTitle(rs.getString("book_title"));
			order.setUserId(userId);
			order.setPrice(rs.getInt("order_price"));
			order.setAmount(rs.getInt("order_amount"));
			order.setRegisteredDate(rs.getDate("order_registered_date"));
			order.setReviewNo(rs.getInt("review_no"));
			order.setLike(rs.getInt("my_like"));
			
			orders.add(order);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orders;
	}
	
	public void addOrder(Order order) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.addOrder"));
		pstmt.setString(1, order.getUserId());
		pstmt.setInt(2, order.getBookNo());
		pstmt.setInt(3, order.getPrice());
		pstmt.setInt(4, order.getAmount());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
