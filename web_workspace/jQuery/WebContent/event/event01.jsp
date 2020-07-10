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
	<h1>이벤트 처리하기</h1>
	
	<div>
		<button id="btn-1" onclick="eventHandler();">B</button>
		<button id="btn-2">U</button>
		<button id="btn-3">T</button>
		<button id="btn-4">T</button>
		<button id="btn-5">O</button>
		<button id="btn-6">N</button>
	</div>
	
	
<script type="text/javascript" src="../resources/js/jquery/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function eventHandler() {
		alert('1번 버튼이 클릭되었습니다.');
	}
	
	// 2번 버튼에 이벤트핸들러 함수를 지정
	var btn2 = document.querySelector("#btn-2");
	btn2.onclick = function () {
		alert('2번 버튼이 클릭되었습니다.');
	}
	
	// 3번째 버튼에서 클릭 이벤트 발생시 실행할 함수를 addEventListener 함수에게 전달
	var btn3 = document.querySelector("#btn-3");
	btn3.addEventListener('click', function() {
		alert('3번 버튼이 클릭되었습니다.');
	});
	
	// 4번째 버튼 엘리먼트를 선택하고 이벤트 핸들러 함수를 등록
	$("#btn-4").on('click', function() {
		alert('4번 버튼이 클릭되었습니다.');
	})
	
	//jQuery의 click(이벤트핸들러함수) 메소드를 이용해서 이벤트핸들러 함수 등록하기
	$("#btn-5").click(function() {
		alert('5번 버튼이 클릭되었습니다.');
	});
	
	$("#btn-6").one('click', function() {
		alert('6번 버튼이 클릭되었습니다.');
	})
</script>
</body>
</html>