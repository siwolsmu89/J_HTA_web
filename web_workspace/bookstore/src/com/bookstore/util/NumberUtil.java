package com.bookstore.util;

import java.text.DecimalFormat;

public class NumberUtil {
	
	private static DecimalFormat currencyFormat = new DecimalFormat();
	
	/**
	 * 정수를 ,가 포함된 문자열로 변환해 반환한다.
	 * @param number 정수
	 * @return ","가 포함된 문자열
	 */
	public static String numberWithComma(long number) {
		return currencyFormat.format(number);
	}
}
