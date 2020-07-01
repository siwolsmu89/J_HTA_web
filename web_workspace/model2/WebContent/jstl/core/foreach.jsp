<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h1>forEach 태그</h1>
		</div>
	</div>
	
	<%
		int pagesPerBlock = 5;
	
		int pageNo = Integer.parseInt(request.getParameter("pageno") == null ? "1" : request.getParameter("pageno"));
		
		int currentBlock = (int) (Math.ceil((double) pageNo/pagesPerBlock));
		int beginPage = (currentBlock - 1) * pagesPerBlock + 1;
		int endPage = currentBlock * pagesPerBlock;
		
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
	
	%>
	
	<div class="row">
		<div class="col-12 text-center">
			<ul class="pagination">
				<c:choose>
					<c:when test="${param.pageno > 1 }">
						<li class="page-item"><a class="page-link" href="foreach.jsp?pageno=${param.pageno - 1 }">이전</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
					</c:otherwise>
				</c:choose>	
				<c:forEach var="num" begin="${beginPage }" end="${endPage }">
					<li class="page-item ${param.pageno == num ? 'active' : '' }"><a class="page-link" href="foreach.jsp?pageno=${num }">${num }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${param.pageno < 50 }">
						<li class="page-item"><a class="page-link" href="foreach.jsp?pageno=${param.pageno + 1 }">다음</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href="">다음</a></li>
					</c:otherwise>
				</c:choose>	
			</ul>
		</div>
	</div>
</div>
</body>
</html>