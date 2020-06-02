package com.sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.util.ConnectionUtil;
import com.sample.vo.SampleFile;

public class SampleFileDAO {

	public void insertFile(SampleFile sampleFile) throws SQLException {
		String sql = "INSERT INTO sample_files "
				+ "VALUES "
				+ "(sample_file_seq.NEXTVAL, ?, ?, SYSDATE)";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, sampleFile.getTitle());
		pstmt.setString(2, sampleFile.getName());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<SampleFile> getAllFiles() throws SQLException {
		List<SampleFile> files = new ArrayList<SampleFile>();
		
		String sql = "SELECT file_no, file_name, file_title, file_create_date "
				+ "FROM sample_files "
				+ "ORDER BY file_no DESC";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			SampleFile file = new SampleFile();
			file.setNo(rs.getInt("file_no"));;
			file.setName(rs.getString("file_name"));
			file.setTitle(rs.getString("file_title"));
			file.setCreateDate(rs.getDate("file_create_date"));
			
			files.add(file);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return files;
	}
	
	public SampleFile getFileByNo(int fileNo) throws SQLException {
		SampleFile sampleFile = null;
		String sql = "SELECT file_no, file_name, file_title, file_create_date "
				+ "FROM sample_files "
				+ "WHERE file_no = ?";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, fileNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			sampleFile = new SampleFile();
			sampleFile.setNo(rs.getInt("file_no"));;
			sampleFile.setName(rs.getString("file_name"));
			sampleFile.setTitle(rs.getString("file_title"));
			sampleFile.setCreateDate(rs.getDate("file_create_date"));
			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return sampleFile;
	}
}
