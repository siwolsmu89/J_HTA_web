package com.simple.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 데이터베이스와 연결을 담당하는 Connection 객체를 제공하는 유틸클래스다.
 * @author JHTA
 *
 */
public class ConnectionUtil {
	
	/**
	 * 클래스 로딩시 JDBC 드라이버를 JVM의 드라이버 레지스트리에 등록한다. 
	 */
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 데이터베이스와 연결된 새로운 Connection을 반환한다.
	 * @return 데이터베이스 연결, SQL 전송에 필요한 Connection 객체
	 * @throws SQLException 데이터베이스 url, 계정정보 등이 올바르지 않은 경우 발생된다.
	 */
	public static Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "zxcv1234";
		
		Connection connection = DriverManager.getConnection(url, user, password);
		return connection;
	}
	
}

















