<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<script type="text/javascript">
	function $(exp) {
		var arr = document.querySelectorAll(exp);
		
		return {
			items: arr,
			hide: function() {
				var elements = this.items;
				for (var i=0; i<elements.length; i++) {
					var el = elements[i];
					el.style.display = "none";
				}
				return this;
			},
			show: function() {
				var elements = this.items;
				for (var i=0; i<elements.length; i++) {
					var el = elements[i];
					el.style.display = "block";
				}
				return this;
			}
		}
	}

	function hideAll() {
		$('p').hide();
	}
</script>
</head>
<body>
	<h1>함수 연습</h1>
	
	<div>
		<p>연습1</p>
		<p>연습1</p>
		<p>연습1</p>
		<p>연습1</p>
		<p>연습1</p>
	</div>
	<div>
		<button onclick="hideAll()">전부 감추기</button>
	</div>
</body>
</html>