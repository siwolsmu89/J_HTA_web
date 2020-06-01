<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첨부파일 리스트</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<h1>첨부파일 리스트</h1>
		</div>
		
		<div class="body">
			<p>첨부파일을 확인해보세요</p>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>파일명</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>10</td>
						<td>휴가신청서</td>
						<td><a href="download.jsp?no=10">휴가신청서.hwp</a></td>
						<td>2020-04-21</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="text-right">
			[<a href="uploadform.jsp">첨부파일 등록</a>]	
		</div>
	</div>
</body>
</html>