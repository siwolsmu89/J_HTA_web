package com.sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.util.ConnectionUtil;
import com.sample.vo.Book;

public class BookDAO {
	public void insertBook(Book book) throws SQLException {
		String sql = "INSERT INTO sample_books "
					+ "	(book_no, book_title, book_writer, book_publisher, "
					+ "book_genre, book_price, book_discount_price, book_stock) "
					+ "VALUES "
					+ "	(sample_book_seq.NEXTVAL, ?, ?, ?, "
					+ "?, ?, ?, ?) ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		
		pstmt.setString(1, book.getTitle());
		pstmt.setString(2, book.getWriter());
		pstmt.setString(3, book.getPublisher());
		pstmt.setString(4, book.getGenre());
		pstmt.setInt(5, book.getPrice());
		pstmt.setInt(6, book.getDiscountPrice());
		pstmt.setInt(7, book.getStock());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<Book> getAllBooks() throws SQLException {
		List<Book> allBooks = new ArrayList<Book>();
		
		String sql = "SELECT book_no, book_title, book_writer, book_publisher, "
					+ "	book_genre, book_price, book_discount_price, book_stock, "
					+ "	book_registered_date, book_point, book_likes "
					+ "FROM sample_books "
					+ "ORDER BY book_no ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Book book = new Book();
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setGenre(rs.getString("book_genre"));
			book.setPrice(rs.getInt("book_price"));
			book.setDiscountPrice(rs.getInt("book_discount_price"));
			book.setStock(rs.getInt("book_stock"));
			book.setRegisteredDate(rs.getDate("book_registered_date"));
			book.setPoint(rs.getDouble("book_point"));
			book.setLikes(rs.getInt("book_likes"));
			
			allBooks.add(book);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return allBooks;
	}
}
