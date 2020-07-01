package com.simple.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 키보드의 입력값을 읽어오는 기능을 제공하는 유틸클래스
 * @author JHTA
 *
 */
public class KeyboardUtil {
	
	private static BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

	/**
	 * 입력된 문자열을 반환한다.
	 * @return 공백이 포함된 문자열
	 * @throws IOException
	 */
	public static String nextString() throws IOException {
		String text = reader.readLine();
		
		return text;
	}
	
	/**
	 * 입력된 정수값을 반환한다.
	 * @return int 범위의 정수
	 * @throws NumberFormatException 숫자가 아닌 문자열을 입력했을 때 예외가 발생한다.
	 * @throws IOException
	 */
	public static int nextInt() throws NumberFormatException, IOException {
		return Integer.parseInt(nextString());
	}
	
	/**
	 * 입력된 정수값을 반환한다.
	 * @return long 범위의 정수
	 * @throws NumberFormatException 숫자가 아닌 문자열을 입력했을 때 예외가 발생한다.
	 * @throws IOException
	 */
	public static long nextLong() throws NumberFormatException, IOException {
		return Long.parseLong(nextString());
	}
	
	/**
	 * 입력된 실수값을 반환한다.
	 * @return double 범위의 실수
	 * @throws NumberFormatException 숫자가 아닌 문자열을 입력했을 때 예외가 발생한다.
	 * @throws IOException
	 */
	public static double nextDouble() throws NumberFormatException, IOException {
		return Double.parseDouble(nextString());
	}
	
	/**
	 * 키보드 입력을 읽어오는 스트림을 닫는다.
	 * @throws IOException
	 */
	public static void close() throws IOException {
		reader.close();
	}
	
}
