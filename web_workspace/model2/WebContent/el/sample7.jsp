<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="com.sample.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>속성에 배열, 객체, 리스트, 맵 저장하기</h1>
		</div>
		<%
			String[] names = {"이것이 자바다","실전 리액트 프로그래밍", "Vue.js 인 액션"};
			Book book = new Book();
			book.setNo(1001);
			book.setTitle("자바의 정석");
			book.setWriter("남궁성");
			book.setPrice(35000);
			book.setDiscountRate(0.1);
			book.setPubDate(new Date());
			book.setSoldOut(false);
			book.setStock(100);
			
			// Map 객체
			Map<String, Object> memberInfo = new HashMap<String, Object>();
			memberInfo.put("id", "hong");
			memberInfo.put("name", "홍길동");
			memberInfo.put("tel", "010-1234-5678");
			memberInfo.put("email", "hong@gmail.com");
			memberInfo.put("dept", "영업1팀");
			
			// List 객체
			List<String> movieNames = new ArrayList<String>();
			movieNames.add("#살아있다.");
			movieNames.add("결백");
			movieNames.add("온워드:단 하루의 기적");
			movieNames.add("사라진 시간");
			movieNames.add("위대한 쇼맨");
			
			// 요청객체의 속성으로 저장하기
			request.setAttribute("bookNames", names);
			request.setAttribute("book", book);
			request.setAttribute("member", memberInfo);
			request.setAttribute("movies", movieNames);
			
			// sample8.jsp로 내부이동하기			
			request.getRequestDispatcher("sample8.jsp").forward(request, response);
		%>
	</div>
</div>
</body>
</html>