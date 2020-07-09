package com.simple.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.dbcp2.BasicDataSource;

import com.simple.util.ConnectionUtil;

public class DBCPInitializerListener implements ServletContextListener {
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {

		// web.xml에 <context-param>으로 설정한 초기화 파라미터를 담고 있는 ServletContext 객체 획득
		ServletContext sc = sce.getServletContext();
		// ServletContext에 저장된 초기화 파라미터 조회
		String url = sc.getInitParameter("db.url");
		String driverClassName = sc.getInitParameter("db.driverClassName");
		String username = sc.getInitParameter("db.username");
		String password = sc.getInitParameter("db.password");
		
		System.out.println("url : " + url);
		System.out.println("driverClassName : " + driverClassName);
		System.out.println("username : " + username);
		System.out.println("password : " + password);
		
		// DataBase Connection Pool 생성하기
		BasicDataSource ds = new BasicDataSource();
		ds.setUrl(url);
		ds.setDriverClassName(driverClassName);
		ds.setUsername(username);
		ds.setPassword(password);
		
		// 생성된 Connection Pool 객체를 ConnectionUtil의 dataSource 변수에 저장한다.
		ConnectionUtil.setDataSource(ds);
	}
}
