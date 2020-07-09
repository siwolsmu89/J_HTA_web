package com.simple.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.sql.DataSource;

/**
 * 데이터베이스와 연결을 담당하는 Connection 객체를 제공하는 유틸클래스다.
 * @author JHTA
 *
 */
public class ConnectionUtil {
	
	private static DataSource dataSource;
	
	public static void setDataSource(DataSource dataSource) {
		ConnectionUtil.dataSource = dataSource;
	}
	
	// DataBaseConnectionPool 객체에서 Connection 객체를 꺼내서 제공한다.
	public static Connection getConnection() throws SQLException {
		
		return dataSource.getConnection();
	}
	
}

















