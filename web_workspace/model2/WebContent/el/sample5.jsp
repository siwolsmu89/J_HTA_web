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
			<h1>속성에 값 담기</h1>
			<p>
				PageContext, HttpServletRequest, HttpSession, ServletContext 객체의 속성에 값 혹은 객체를 저장하고, EL로 표현하기
			</p>
		</div>
		
		<%
			// 각각의 속성에 값 혹은 객체 저장하기
			// PageContext의 속성에 저장하기
			pageContext.setAttribute("currentPageNo", 23);
		
			request.setAttribute("memberName", "홍길동");
			
			session.setAttribute("loginedUserId", "jhta");
			
			application.setAttribute("companyName", "중앙HTA학원");
		
			// sample6.jsp를 재요청하는 응답을 보낸다.
			// sample5.jsp는 요청을 처리하고, 응답이 완료되었음
			// sample5.jsp가 사용했던 요청객체/응답객체는 응답 완료 후 사라진다.
			// 리다이렉션 이동은 이전 페이지의 요청객체/응답객체를 다음 jsp에서 사용할 수 없다.
			// response.sendRedirect("sample6.jsp");
			
			// 서버 내부에서 sample6.jsp로 이동하기
			// sample5.jsp의 요청처리 작업은 종료되었지만, 아직 응답은 보내지지 않았음
			// sample5.jsp에서 사용했던 요청객체/응답객체를 sample6.jsp에게 보낸다.
			// 내부이동은 이전 페이지의 요청객체/응답객체를 다음 jsp에서 재사용할 수 있다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("sample6.jsp");
			dispatcher.forward(request, response);
		%>
	</div>
</div>
</body>
</html>