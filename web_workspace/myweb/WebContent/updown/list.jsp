<%@page import="com.sample.vo.SampleFile"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.dao.SampleFileDAO"%>
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
		<%
			SampleFileDAO fileDao = new SampleFileDAO();
			List<SampleFile> files = fileDao.getAllFiles();
			
			if (files.isEmpty()){
		%>
			<p>등록된 파일이 없습니다.</p>
		<%
			} else {
		%>
			<p>첨부파일을 확인해보세요</p>
		<%
				for (SampleFile f : files) {
		%>
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
						<td><%=f.getNo() %></td>
						<td><%=f.getTitle() %></td>
						<td><a href="../download?no=<%=f.getNo() %>"><%=f.getName() %></a></td>
						<td><%=f.getCreateDate() %></td>
					</tr>
				</tbody>
			</table>
		<%
				}
			}
		%>
		</div>
		
		<div class="text-right">
			[<a href="uploadform.jsp">첨부파일 등록</a>]	
		</div>
	</div>
</body>
</html>