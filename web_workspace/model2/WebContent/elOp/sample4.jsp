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
			<form>
				<div class="form-group">
					<label>카테고리</label>
					<select name="cat">
						<option value="">선택하세요</option>
						<option ${param.category eq 'local' ? 'selected' : '' } value="local">국내도서</option>
						<option ${param.category eq 'foreign' ? 'selected' : '' } value="foreign">외국도서</option>
						<option ${param.category eq 'ebook' ? 'selected' : '' } value="ebook">전자책</option>
						<option ${param.category eq 'ticket' ? 'selected' : '' } value="ticket">티켓</option>
					</select>
				</div>
			</form>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			<ul class="list-group">
				<li class="list-group-item ${param.category eq 'local' ? 'active' : '' }" ><a href="sample4.jsp?category=local">링크1</a>
				<li class="list-group-item ${param.category eq 'foreign' ? 'active' : '' }" ><a href="sample4.jsp?category=foreign">링크2</a>
				<li class="list-group-item ${param.category eq 'ebook' ? 'active' : '' }" ><a href="sample4.jsp?category=ebook">링크3</a>
				<li class="list-group-item ${param.category eq 'ticket' ? 'active' : '' }" ><a href="sample4.jsp?category=ticket">링크4</a>
			</ul>
		</div>
	</div>
</div>
</body>
</html>