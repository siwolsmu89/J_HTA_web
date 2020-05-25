package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.ReviewDTO;
import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.Review;

public class ReviewDAO {

	public List<ReviewDTO> getReviewsByBookNo(int bookNo) throws SQLException {
		List<ReviewDTO> reviews = new ArrayList<ReviewDTO>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviewByBookNo"));
		pstmt.setInt(1, bookNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ReviewDTO review = new ReviewDTO();
			
			review.setNo(rs.getInt("review_no"));
			review.setUserName(rs.getString("user_name"));
			review.setUserId(rs.getString("user_id"));
			review.setPoint(rs.getInt("review_point"));
			review.setContent(rs.getString("review_content"));
			review.setRegisteredDate(rs.getDate("review_registered_date"));
			
			reviews.add(review);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return reviews;
	}
	
	public List<ReviewDTO> getReviewsByUserId(String userId) throws SQLException {
		List<ReviewDTO> reviews = new ArrayList<ReviewDTO>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviewsByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ReviewDTO review = new ReviewDTO();
			
			review.setNo(rs.getInt("review_no"));
			review.setBookTitle(rs.getString("book_title"));
			review.setBookNo(rs.getInt("book_no"));
			review.setUserId(rs.getString("user_id"));
			review.setPoint(rs.getInt("review_point"));
			review.setContent(rs.getString("review_content"));
			review.setRegisteredDate(rs.getDate("review_registered_date"));
			
			reviews.add(review);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return reviews;
	}
	
	public void addReview(Review review) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.addReview"));
		pstmt.setInt(1, review.getBookNo());
		pstmt.setString(2, review.getUserId());
		pstmt.setString(3, review.getContent());
		pstmt.setInt(4, review.getPoint());
		
		pstmt.executeUpdate();
		pstmt.close();
		connection.close();
	}
	
	public void updateReview(Review review) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.updateReview"));
		pstmt.setInt(1, review.getPoint());
		pstmt.setString(2, review.getContent());
		pstmt.setInt(3, review.getBookNo());
		pstmt.setString(4, review.getUserId());
		
		pstmt.executeUpdate();
		pstmt.close();
		connection.close();
	}
	
	public void deleteReview(int bookNo, String userId) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.deleteReview"));
		pstmt.setInt(1, bookNo);
		pstmt.setString(2, userId);
		
		pstmt.executeUpdate();
		pstmt.close();
		connection.close();
	}
}
