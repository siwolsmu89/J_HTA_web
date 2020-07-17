package com.simple.util;

import java.text.DecimalFormat;

public class NumberUtil {

	private static DecimalFormat currencyFormat = new DecimalFormat("#,###");
	
	/**
	 * 정수를 ","가 포함된 문자열로 변환해서 반환한다.
	 * @param number 정수
	 * @return ","가 포함된 문자열
	 */
	public static String numberWithComma(long number) {
		return currencyFormat.format(number);
	}
	
	/**
	 * 문자열을 정수로 변환해서 반환한다.
	 * @param str 문자열
	 * @param defaultNumber 기본값
	 * @return 정수, 숫자가 아닌 문자가 포함된 경우 기본값을 반환한다.
	 */
	public static long stringToLong(String str, long defaultNumber) {
		try {
			return Long.parseLong(str);
		} catch (NumberFormatException e) {
			return defaultNumber;
		}
	}
	
	/**
	 * 문자열을 정수로 변환해서 반환한다.
	 * @param str 문자열
	 * @return 정수, 숫자가 아닌 문자가 포함된 경우 0이 반환된다.
	 */
	public static long stringToLong(String str) {
		return stringToLong(str, 0);
	}
	
	/**
	 * 문자열을 정수로 변환해서 반환한다.
	 * @param str 문자열
	 * @param defaultNumber 기본값
	 * @return 정수, 숫자가 아닌 문자가 포함된 경우 기본값이 반환된다.
	 */
	public static int stringToInt(String str, int defaultNumber) {
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return defaultNumber;
		}
	}
	
	/**
	 * 문자열을 정수로 변환해서 반환한다.
	 * @param str 문자열
	 * @return 정수, 숫자가 아닌 문자가 포함된 경우 0이 반환된다.
	 */
	public static int stringToInt(String str) {
		return stringToInt(str, 0);
	}
	
	/**
	 * 문자열을 실수로 변환해서 반환한다.
	 * @param str 문자열
	 * @param defaultNumber 기본값
	 * @return 실수, 숫자가 아닌 문자가 포함된 경우 기본값이 반환된다.
	 */
	public static double stringToDouble(String str, double defaultNumber) {
		try {
			return Double.parseDouble(str);
		} catch (NumberFormatException e) {
			return defaultNumber;
		}
	}
	
	/**
	 * 문자열을 실수로 변환해서 반환한다.
	 * @param str 문자열
	 * @return 실수, 숫자가 아닌 문자가 포함된 경우 0.0이 반환된다.
	 */
	public static double stringToDouble(String str) {
		return stringToDouble(str, 0.0);
	}
}









