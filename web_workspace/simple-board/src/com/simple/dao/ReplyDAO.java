package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Reply;

public class ReplyDAO {
	
	public void insertReply(Reply reply) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.insertReply"));
		pstmt.setString(1, reply.getWriter());
		pstmt.setString(2, reply.getContent());
		pstmt.setInt(3, reply.getBoardNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<Reply> getMyReplys(String userId) throws SQLException {
		List<Reply> myReplys = new ArrayList<Reply>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.getMyReplys"));
		pstmt.setString(1, userId);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Reply reply = new Reply();
			reply.setNo(rs.getInt("reply_no"));
			reply.setWriter(rs.getString("reply_writer"));
			reply.setContent(rs.getString("reply_content"));
			reply.setDeleted(("Y".equals(rs.getString("reply_del_yn"))));
			reply.setCreateDate(rs.getDate("reply_create_date"));
			reply.setBoardNo(rs.getInt("board_no"));
			
			myReplys.add(reply);
		}
		
		return myReplys;
	}
	
	public List<Reply> getReplysByBoardNo(int boardNo) throws SQLException {
		List<Reply> replys = new ArrayList<Reply>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.getReplysByBoardNo"));
		pstmt.setInt(1, boardNo);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Reply reply = new Reply();
			reply.setNo(rs.getInt("reply_no"));
			reply.setWriter(rs.getString("reply_writer"));
			reply.setContent(rs.getString("reply_content"));
			reply.setDeleted(("Y".equals(rs.getString("reply_del_yn"))));
			reply.setCreateDate(rs.getDate("reply_create_date"));
			reply.setBoardNo(rs.getInt("board_no"));
			
			replys.add(reply);
		}
		
		return replys;
	}
	
}
