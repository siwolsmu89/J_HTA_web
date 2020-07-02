package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Book;

public class BookDao {
	
	public void insertBook(Book book) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.insertBook"));
		pstmt.setString(1, book.getTitle());
		pstmt.setString(2, book.getWriter());
		pstmt.setString(3, book.getGenre());
		pstmt.setString(4, book.getPublisher());
		pstmt.setInt(5, book.getPrice());
		pstmt.setInt(6, book.getDiscountPrice());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}

	public List<Book> getAllBooks() throws SQLException {
		List<Book> books = new ArrayList<>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.getAllBooks"));
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Book book = new Book();
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setGenre(rs.getString("book_genre"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setPrice(rs.getInt("book_price"));
			book.setDiscountPrice(rs.getInt("book_discount_price"));
			book.setStock(rs.getInt("book_stock"));
			book.setPoint(rs.getDouble("book_point"));
			book.setLikes(rs.getInt("book_likes"));
			book.setRegisteredDate(rs.getDate("book_registered_date"));

			books.add(book);
		}
		rs.close();
		pstmt.close();
		connection.close();

		return books;
	}

	public Book getBookByNo(int bookNo) throws SQLException {
		Book book = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.getBookByNo"));
		pstmt.setInt(1, bookNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			book = new Book();
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setGenre(rs.getString("book_genre"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setPrice(rs.getInt("book_price"));
			book.setDiscountPrice(rs.getInt("book_discount_price"));
			book.setStock(rs.getInt("book_stock"));
			book.setPoint(rs.getDouble("book_point"));
			book.setLikes(rs.getInt("book_likes"));
			book.setRegisteredDate(rs.getDate("book_registered_date"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return book;
	}

	public List<Book> getRecentBooks() throws SQLException {
		List<Book> books = new ArrayList<>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.getRecentBooks"));
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Book book = new Book();
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setGenre(rs.getString("book_genre"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setPrice(rs.getInt("book_price"));
			book.setDiscountPrice(rs.getInt("book_discount_price"));
			book.setStock(rs.getInt("book_stock"));
			book.setPoint(rs.getDouble("book_point"));
			book.setLikes(rs.getInt("book_likes"));
			book.setRegisteredDate(rs.getDate("book_registered_date"));

			books.add(book);
		}
		rs.close();
		pstmt.close();
		connection.close();

		return books;
	}

}






