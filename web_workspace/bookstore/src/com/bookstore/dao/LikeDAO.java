package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.Like;

public class LikeDAO {
	
	public void addLike(Like like) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("like.addLike"));
		pstmt.setString(1, like.getUserId());
		pstmt.setInt(2, like.getBookNo());
		
		pstmt.executeUpdate();
		pstmt.close();
		connection.close();
	}
}
