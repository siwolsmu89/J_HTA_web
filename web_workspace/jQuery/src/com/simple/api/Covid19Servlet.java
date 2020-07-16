package com.simple.api;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;

@WebServlet(urlPatterns = "/covid19sido")
public class Covid19Servlet extends HttpServlet {
	
	private String serviceURL = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson";
	private String serviceKey = "6uTpKaZzsbAx745uKWTaF7Jcgl6fw19yLiHxIFwNkB1aimeKicsDgVRjtxs7dcg1eLsi5667sQi%2BEs24Il6nSA%3D%3D";
	private int numOfRows = 10;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int pageNo = Integer.parseInt(req.getParameter("pageNo"));
		String startCreateDt = req.getParameter("startCreateDt");
		String endCreateDt = req.getParameter("endCreateDt");
		
		StringBuilder builder = new StringBuilder();
		builder.append(serviceURL);
		builder.append("?serviceKey=" + serviceKey);
		builder.append("&pageNo=" + pageNo);
		builder.append("&numOfRows=" + numOfRows);
		builder.append("&startCreateDt=" + startCreateDt);
		builder.append("&endCreateDt=" + endCreateDt);
		
		URL url = new URL(builder.toString());
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("GET");
		connection.setRequestProperty("Content-type", "text/xml");
		
		System.out.println("응답코드: " +connection.getResponseCode());
		
		IOUtils.copy(connection.getInputStream(), resp.getOutputStream());
	}
}
