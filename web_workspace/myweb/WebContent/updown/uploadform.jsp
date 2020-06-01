<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<h1>파일 업로드 폼</h1>
		</div>

		<div class="body">
			<p>업로드할 파일의 정보를 입력하고, 파일을 선택하세요.</p>
			<div>
				<form method="POST" action="upload.jsp" enctype="multipart/form-data" >
					<div class="form-group">
						<label>제목</label>
						<div>
							<input type="text" name="title" />
						</div>				
					</div>
					<div class="form-group">
						<label>첨부파일</label>
						<div>
							<input type="file" name="upfile" />
						</div>				
					</div>
					<div class="text-right">
						<button type="submit">파일 업로드</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>