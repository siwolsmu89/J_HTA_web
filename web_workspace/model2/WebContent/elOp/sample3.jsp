<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
			<h1>empty 연산자</h1>
		</div>
	</div>
	
	<%
		request.setAttribute("searchKeyword", "");
	
		List<String> names = new ArrayList<String>();
		request.setAttribute("nameList", names);
		
		Map<String, Object> map = new HashMap<String, Object>();
		request.setAttribute("condition", map);
	%>
	
	<div class="row">
		<div class="col-12">
			<h3> empty 연산자의 연산결과가 true인 경우 </h3>
			<p>속성명에 해당하는 속성값이 존재하지 않을 때 : ${empty userId }</p>
			<p>속성명에 해당하는 문자열 값의 길이가 0일 때 : ${empty searchKeyword }</p>
			<p>속성명에 해당하는 List의 길이가 0일 때 : ${empty nameList }</p>
			<p>속성명에 해당하는 Map의 길이가 0일 때 : ${empty condition }</p>
			<p>
				empty 연산자는 EL 표현식에 해당하는 값이 존재하지 않거나
				그 값이 비어있는 경우(빈 문자열, 길이가 0인 배열, 길이가 0인 콜렉션, 비어 있는 Map 등)
				true를 반환하고, 그 외에는 전부 false를 반환한다.
			</p>
		</div>
	</div>
</div>
</body>
</html>