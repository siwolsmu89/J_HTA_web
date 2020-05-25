package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.BookDetailDTO;
import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.Book;

public class BookDAO {
	
	public List<Book> getNewBooks() throws SQLException {
		List<Book> newBooks = new ArrayList<Book>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.getNewBooks"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Book book = new Book();
			
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setPrice(rs.getInt("book_price"));
			book.setRegisteredDate(rs.getDate("book_registered_date"));
			
			newBooks.add(book);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return newBooks;
	}
	
	public List<Book> getAllBooks() throws SQLException {
		List<Book> allBooks = new ArrayList<Book>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.getAllBooks"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Book book = new Book();
			
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setGenre(rs.getString("book_genre"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setPrice(rs.getInt("book_price"));
			book.setDiscountPrice(rs.getInt("book_discount_price"));
			book.setRegisteredDate(rs.getDate("book_registered_date"));
			book.setStock(rs.getInt("book_stock"));
			book.setPoint(rs.getDouble("book_point"));
			book.setLikes(rs.getInt("book_likes"));
			
			allBooks.add(book);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return allBooks;
	}
	
	public BookDetailDTO getBookByNo(int no) throws SQLException {
		BookDetailDTO book = new BookDetailDTO();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.getBookByNo"));
		pstmt.setInt(1, no);
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setGenre(rs.getString("book_genre"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setPrice(rs.getInt("book_price"));
			book.setDiscountPrice(rs.getInt("book_discount_price"));
			book.setRegisteredDate(rs.getDate("book_registered_date"));
			book.setStock(rs.getInt("book_stock"));
			book.setPoint(rs.getDouble("book_point"));
			book.setLikes(rs.getInt("book_likes"));
			book.setReviewCount(rs.getInt("review_count"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return book;
	}
	
	public void addNewBook(Book book) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("book.addNewBook"));
		
		pstmt.setString(1, book.getTitle());
		pstmt.setString(2, book.getWriter());
		pstmt.setString(3, book.getGenre());
		pstmt.setString(4, book.getPublisher());
		pstmt.setInt(5, book.getPrice());
		pstmt.setInt(6, book.getDiscountPrice());
		pstmt.setInt(7, book.getStock());
		
		pstmt.executeUpdate();
		pstmt.close();
		connection.close();
	}
	
}
