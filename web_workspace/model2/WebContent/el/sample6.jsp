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
			<h1>속성으로 저장된 값 혹은 객체 표현하기</h1>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<h3>PageContext에 속성으로 저장된 값 표현하기</h3>
			<p>다른 JSP에서는 PageContext에 저장된 속성을 조회할 수 없다.</p>
			<div>페이지번호 : ${pageScope.currentPage }</div>
			<div>페이지번호 : ${currentPage }</div>
			
			<h3>HttpServletRequest에 속성으로 저장된 값 표현하기</h3>
			<p>응답이 완료되고 나면 HttpServletRequest에 저장된 속성을 조회할 수 없다.</p>
			<div>멤버이름 : ${requestScope.memberName }</div>
			<div>멤버이름 : ${memberName }</div>
			
			<h3>HttpSession에 속성으로 저장된 값 표현하기</h3>
			<p>로그아웃 혹은 세션객체가 무효화되고 나면 HttpSession에 저장된 속성을 조회할 수 없다.</p>
			<div>로그안이아디 : ${sessionScope.loginedUserId }</div>
			<div>로그안이아디 : ${loginedUserId }</div>
			
			<h3>ServletContext에 속성으로 저장된 값 표현하기</h3>
			<p>톰캣이 종료되고 나면 ServletContext에 저장된 속성을 조회할 수 없다.</p>
			<div>회사명 : ${applicationScope.companyName }</div>
			<div>회사명 : ${companyName }</div>
		</div>
	</div>
</div>
</body>
</html>