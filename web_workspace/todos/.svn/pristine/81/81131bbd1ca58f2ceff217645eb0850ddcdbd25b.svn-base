package com.simple.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * JDBC를 활용한 DB Access 작업을 단순화시킨 헬프클래스 입니다.
 * @author JHTA
 *
 */
public class JdbcHelper {
	
	/**
	 * INSERT 작업을 수행한다.
	 * @param sql 실행할 쿼리
	 * @param params 쿼리 실행에 필요한 값, 생략할 수 있다.
	 * @throws SQLException
	 */
	public static void insert(String sql, Object... params) {
		executeUpdate(sql, params);		
	} 
	
	/**
	 * UPDATE 작업을 수행한다.
	 * @param sql 실행할 쿼리
	 * @param params 쿼리 실행에 필요한 값, 생략할 수 있다.
	 * @throws SQLException
	 */
	public static void update(String sql, Object... params) {
		executeUpdate(sql, params);
	} 
	
	/**
	 * DELETE 작업을 수행한다.
	 * @param sql 실행할 쿼리
	 * @param params 쿼리 실행에 필요한 값, 생략할 수 있다.
	 * @throws SQLException
	 */
	public static void delete(String sql, Object... params) {
		executeUpdate(sql, params);
	} 
	
	/**
	 * SELECT 작업을 수행한다.<br />
	 * 단일 행을 조회해서 반환한다.
	 * @param <T> 조회된 레코드 하나를 저장할 객체의 타입
	 * @param sql 실행할 SQL 쿼리
	 * @param rowMapper ResultSet을 객체와 매핑시키는 RowMapper 구현객체
	 * @param params 쿼리 실행에 필요한 값, 생략할 수 있다.
	 * @return 조회된 결과, 조회된 값이 없는 경우 null을 반환하고, 하나 이상 조회되는 경우 예외를 발생시킨다.
	 * @throws SQLException
	 */
	public static <T> T selectOne(String sql, RowMapper<T> rowMapper, Object... params) {
		List<T> result = executeQuery(sql, rowMapper, params);
		if (result.isEmpty()) {
			return null;
		} 
		if (result.size() > 1) {
			throw new RuntimeException("하나 이상의 결과가 조회되었습니다.");
		}
		return result.get(0);
	}
	
	/**
	 * SELECT 작업을 수행한다.<br />
	 * 여러 행을 조회해서 반환한다.
	 * @param <T> 조회된 레코드 하나를 저장할 객체의 타입
	 * @param sql 실행할 SQL 쿼리
	 * @param rowMapper ResultSet을 객체와 매핑시키는 RowMapper 구현객체
	 * @param params 쿼리 실행에 필요한 값, 생략할 수 있다.
	 * @return 조회된 결과, 조회된 값이 없는 경우 빈 List객체가 반환된다.
	 * @throws SQLException
	 */
	public static <T> List<T> selectList(String sql, RowMapper<T> rowMapper, Object... params) {
		return executeQuery(sql, rowMapper, params);
	}
	
	private static void before(String sql) throws SQLException {
		ThreadRepository.remove();

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		
		ThreadRepository.setConnection(connection);
		ThreadRepository.setPreparedStatement(pstmt);
	}
	
	private static void setParams(Object...params) throws SQLException {
		if (params.length != 0) {
			
			PreparedStatement pstmt = ThreadRepository.getPreparedsStatement();
			for (int i=0; i<params.length; i++) {
				Object param = params[i];
				if (param instanceof String) {
					pstmt.setString(i+1, (String) param);
				} else if (param instanceof Integer) {
					pstmt.setInt(i+1, (Integer) param);
				} else if (param instanceof Long) {
					pstmt.setLong(i+1, (Long) param);
				} else if (param instanceof Double) {
					pstmt.setDouble(i+1, (Double) param);
				} else if (param instanceof Date) {
					java.sql.Date date = new java.sql.Date(((Date) param).getTime());
					pstmt.setDate(i+1, date);
				}
			}
		}
	}
	
	private static void after()  {
		Connection connection = ThreadRepository.getConnection();
		PreparedStatement pstmt = ThreadRepository.getPreparedsStatement();
		ResultSet rs = ThreadRepository.getResultSet();
		
		try {
			if (rs != null) {
				rs.close();
			}			
		} catch (SQLException e) {}
		try {
			if (pstmt != null) {
				pstmt.close();
			}		
		} catch (SQLException e) {}
		try {
			if (connection != null) {
				connection.close();
			}		
		} catch (SQLException e) {}
	}
	
	private static void executeUpdate() throws SQLException {
		ThreadRepository.getPreparedsStatement().executeUpdate();
	}
	
	private static void executeUpdate(String sql, Object...params) {
		try {
			before(sql);
			setParams(params);
			executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			after();
		}
	}

	private static ResultSet executeQuery() throws SQLException {
		ResultSet rs = ThreadRepository.getPreparedsStatement().executeQuery();
		ThreadRepository.setResultSet(rs);
		return rs;
	}
	
	private static <T> List<T> resultSetHandering(ResultSet rs, RowMapper<T> rowMapper) throws SQLException {
		List<T> result = new ArrayList<T>();
		while (rs.next()) {
			result.add(rowMapper.mapRow(rs));
		}
		return result;
	}
	
	private static <T> List<T> executeQuery(RowMapper<T> rowMapper) throws SQLException {
		return resultSetHandering(executeQuery(), rowMapper);
	}
	
	private static <T> List<T> executeQuery(String sql, RowMapper<T> rowMapper, Object...params) {
		try {
			List<T> result = null;
			before(sql);
			setParams(params);
			result = executeQuery(rowMapper);
			
			return result;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			after();			
		}
	}
	
	private static class ThreadRepository {
		private static ThreadLocal<Map<String, Object>> threadLocal = new ThreadLocal<Map<String, Object>>() {
			protected Map<String, Object> initialValue() {
				return new HashMap<>();
			}
		};
		
		public static Connection getConnection() {
			return (Connection) threadLocal.get().get("connection");
		}
		
		public static PreparedStatement getPreparedsStatement() {
			return (PreparedStatement) threadLocal.get().get("pstmt");
		}
		
		public static ResultSet getResultSet() {
			return (ResultSet) threadLocal.get().get("rs");
		}
		
		public static void setConnection(Connection connection) {
			threadLocal.get().put("connection", connection);
		}
		
		public static void setPreparedStatement(PreparedStatement pstmt) {
			threadLocal.get().put("pstmt", pstmt);
		}
		
		public static void setResultSet(ResultSet rs) {
			threadLocal.get().put("rs", rs);
		}
		
		public static void remove() {
			threadLocal.remove();
		}
	}
	
	/**
	 * ResultSet를 지정된 타입의 객체로 매핑시킨다.
	 * @author JHTA
	 *
	 * @param <T> ResultSet으로 조회된 데이터를 저장할 객체의 타입
	 */
	public static interface RowMapper<T> {
		/**
		 * ResultSet으로 조회된 레코드 하나를 지정된 객체에 담아서 반환한다.
		 * @param rs ResultSet객체
		 * @return 레코드가 저장된 객체
		 * @throws SQLException
		 */
		T mapRow(ResultSet rs) throws SQLException;
	}
	
}
