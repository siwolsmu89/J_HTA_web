package com.bookstore.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class QueryUtil {
	
	// query.properties에 정의된 내용을 key, value의 쌍으로 보관하는 객체
	private static Properties prop = new Properties();
	
	static {
		try {
			prop.load(new FileInputStream("src/com/bookstore/dao/query.properties"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 지정된 이름의 쿼리문을 반환한다.
	 * @param name
	 * @return
	 */
	public static String getSQL(String name) {
		return prop.getProperty(name);
	}
}
