package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Board;

public class BoardDAO {
	
	public void addBoard(Board board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.addBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getContent());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
	}
	
	public void updateBoard(Board board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.updateBoard"));
		String deleted = "N";
		if (board.isDeleted()) {
			deleted = "Y";
		}
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getContent());
		pstmt.setInt(3, board.getHit());
		pstmt.setInt(4, board.getReplyCnt());
		pstmt.setString(5, deleted);
		pstmt.setInt(6, board.getNo());
		
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
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setReplyCnt(rs.getInt("board_reply_cnt"));
			board.setDeleted("Y".equals(rs.getString("board_del_yn")));
			board.setCreatDate(rs.getDate("board_create_date"));
			
			allBoards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return allBoards;
	}
	
	public List<Board> getMyBoards(String userId) throws SQLException {
		List<Board> myBoards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getMyBoards"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setReplyCnt(rs.getInt("board_reply_cnt"));
			board.setDeleted("Y".equals(rs.getString("board_del_yn")));
			board.setCreatDate(rs.getDate("board_create_date"));
			
			myBoards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return myBoards;
	}
	
	public Board getBoardByNo(int boardNo) throws SQLException {
		Board board = new Board();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardByNo"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setReplyCnt(rs.getInt("board_reply_cnt"));
			board.setDeleted("Y".equals(rs.getString("board_del_yn")));
			board.setCreatDate(rs.getDate("board_create_date"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return board;
	}
	
}