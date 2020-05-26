package com.bookstore.util;

public class StringUtil {

	/**
	 * 문자열 값이 null이면 지정된 defaultValue 값을 반환한다.
	 * @param str null인지 체크할 문자열
	 * @param defaultValue null일 경우 반환할 기본값
	 * @return
	 */
	public static String nullToValue(String str, String defaultValue) {
		if (str==null) {
			str = defaultValue;
		}
		
		return str;
	}
	
	/**
	 * 문자열 값이 null이면 ""을 반환한다.
	 * @param str null인지 체크할 문자열
	 * @return
	 */
	public static String nullToBlack(String str) {
		return nullToValue(str, "");
	}
}
