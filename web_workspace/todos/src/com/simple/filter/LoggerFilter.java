package com.simple.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LoggerFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 전처리 작업 (다음 필터를 실행하기 전)
		HttpServletRequest httpReq = (HttpServletRequest) request;
		String requestURI = httpReq.getRequestURI();
		String ipAddr = httpReq.getRemoteAddr();
		long startTime = System.currentTimeMillis();

		System.out.println("[" + requestURI + "] 요청에 대한 처리를 시작함");
		System.out.println("[" + ipAddr + "] 클라이언트의 요청을 받음");
		
		chain.doFilter(request, response);
	
		// 후처리 작업 (다음 필터의 실행 이후)
		long endTime = System.currentTimeMillis();
		
		long workTime = endTime - startTime;
		System.out.println("소요시간 : [" + workTime + "] 밀리초");
		System.out.println("[" + requestURI + "] 요청에 대한 처리를 종료함\n");
	}

	@Override
	public void destroy() {}
}
