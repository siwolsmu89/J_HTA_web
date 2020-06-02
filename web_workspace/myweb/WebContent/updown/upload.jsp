<%@page import="com.sample.vo.SampleFile"%>
<%@page import="com.sample.dao.SampleFileDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String saveDirectory = "c:/files";
	int maxPostSize = 1024 * 1024 * 100;
	String encoding = "utf-8";
	
	// MultipartRequest 객체
	// * cos.jar 라이브러리에서 첨부파일 업로드를 지원하는 클래스다.
	// * 첨부파일이 저장될 디렉토리, 최대 업로드 사이즈, 문자 인코딩 방식을 지정하면 객체 생성시 첨부파일이 지정된 디렉토리에 자동으로 저장된다. 
	// * 요청파라미터 값을 조회하는 기능과 파일이름을 조회하는 기능을 제공한다.
	// * 요청파라미터값을 조회하는 기능
	//   String getParameter(String name)
	//	 String[] getParameterValues(String name)
	// * 파일명을 조회하는 기능
	//	 String getFilesystemName(String name)
	//   String getOriginalFileName(String name)
	
	// * DefaultFileRenamePolicy
	//		동일한 파일이름이 존재하는 경우 파일이름을 변경해주는 객체다.
	// 		예) logo.jpg가 존재하는 경우 파일이름을 logo1.jpg로 변경해서 저장한다.
	
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
	
	String title = mr.getParameter("title");
	String filename = mr.getFilesystemName("upfile");
	
	SampleFile sampleFile = new SampleFile();
	sampleFile.setTitle(title);
	sampleFile.setName(filename);
	
	SampleFileDAO sampleFileDao = new SampleFileDAO();
	sampleFileDao.insertFile(sampleFile);
	
	response.sendRedirect("list.jsp");
%>