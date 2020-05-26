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
		pstmt.setInt(3, NumberUtil.stringToInt(board.getPassword()));
		pstmt.setString(4, board.getContent());
		
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
	
	public List<Board> getBoardsBySearch(String condition, String keyword) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		
		String sql = "";
		if("writer".equals(condition)) {
			sql = QueryUtil.getSQL("board.getBoardsByWriter");
		} else if ("title".equals(condition)) {
			sql = QueryUtil.getSQL("board.getBoardsByTitle");
		} else if("content".equals(condition)) {
			sql = QueryUtil.getSQL("board.getBoardsByContent");
		}
		PreparedStatement pstmt = connection.prepareStatement(sql);
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
