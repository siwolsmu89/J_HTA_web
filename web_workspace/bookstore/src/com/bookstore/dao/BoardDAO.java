package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.NumberUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.Board;

public class BoardDAO {
	
	public void addBoard(Board board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.addBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getPassword());
		pstmt.setString(4, board.getContent());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateBoard(Board board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.updateBoard"));
		
		String isDeleted;
		if(board.isDeleted()) {
			isDeleted = "Y";
		} else {
			isDeleted = "N";
		}
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setInt(3, NumberUtil.stringToInt(board.getPassword()));
		pstmt.setString(4, board.getContent());
		pstmt.setInt(5, board.getHit());
		pstmt.setString(6, isDeleted);
		pstmt.setInt(7, board.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<Board> getAllBoards() throws SQLException {
		List<Board> allBoards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getAllBoards"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			
			boolean isDeleted;
			if ("Y".equals(rs.getString("board_del_yn"))) {
				isDeleted = true;
			} else {
				isDeleted = false;
			}
			
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setPassword(rs.getString("board_password"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			board.setDeleted(isDeleted);
			
			allBoards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();

		return allBoards;
	}
	
	public List<Board> getBoardsByWriter(String keyword) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardsByWriter"));
		pstmt.setString(1, keyword);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			
			boolean isDeleted;
			if ("Y".equals(rs.getString("board_del_yn"))) {
				isDeleted = true;
			} else {
				isDeleted = false;
			}
			
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setPassword(rs.getString("board_password"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			board.setDeleted(isDeleted);
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();

		return boards;
	}
	
	public List<Board> getBoardsByTitle(String keyword) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardsByTitle"));
		pstmt.setString(1, keyword);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			
			boolean isDeleted;
			if ("Y".equals(rs.getString("board_del_yn"))) {
				isDeleted = true;
			} else {
				isDeleted = false;
			}
			
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setPassword(rs.getString("board_password"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			board.setDeleted(isDeleted);
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();

		return boards;
	}
	
	public List<Board> getBoardsByContent(String keyword) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardsByContent"));
		pstmt.setString(1, keyword);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			
			boolean isDeleted;
			if ("Y".equals(rs.getString("board_del_yn"))) {
				isDeleted = true;
			} else {
				isDeleted = false;
			}
			
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setPassword(rs.getString("board_password"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			board.setDeleted(isDeleted);
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();

		return boards;
	}
	
	public Board getBoardByNo(int boardNo) throws SQLException {
		Board board = new Board();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardByNo"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			boolean isDeleted;
			if ("Y".equals(rs.getString("board_del_yn"))) {
				isDeleted = true;
			} else {
				isDeleted = false;
			}
			
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setPassword(rs.getString("board_password"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			board.setDeleted(isDeleted);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return board;
	}
}
