<%@page import="com.sample.dao.BookDAO"%>
<%@page import="com.sample.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request/bookregister</title>
</head>
<body>
	<h1>책 등록하기</h1>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		String title = request.getParameter("booktitle");
		String writer = request.getParameter("bookwriter");
		String genre = request.getParameter("bookgenre");
		String publisher = request.getParameter("bookpublisher");
		int price = Integer.parseInt(request.getParameter("bookprice"));
		int discountPrice = Integer.parseInt(request.getParameter("bookdiscountprice"));
		int stock = Integer.parseInt(request.getParameter("bookstock"));
		
		Book book = new Book();
		book.setTitle(title);
		book.setWriter(writer);
		book.setGenre(genre);
		book.setPublisher(publisher);
		book.setPrice(price);
		book.setDiscountPrice(discountPrice);
		book.setStock(stock);
		
		BookDAO bookDao = new BookDAO();
		bookDao.insertBook(book);
	%>
	
	<h1>책 등록 완료</h1>
	<p>새로운 책 등록이 완료되었습니다.</p>
	
	<div>
		<h3>등록할 책 정보</h3>
		<dl>
			<dt>책제목</dt>
			<dd><%=title %></dd>
		</dl>
		<dl>
			<dt>장르</dt>
			<dd><%=genre %></dd>
		</dl>
		<dl>
			<dt>저자</dt>
			<dd><%=writer %></dd>
		</dl>
		<dl>
			<dt>출판사</dt>
			<dd><%=publisher %></dd>
		</dl>
		<dl>
			<dt>가격</dt>
			<dd><%=price %></dd>
		</dl>
		<dl>
			<dt>할인가격</dt>
			<dd><%=discountPrice %></dd>
		</dl>
		<dl>
			<dt>입고수량</dt>
			<dd><%=stock %></dd>
		</dl>
	</div>
	<div> 
		<h3>등록된 책 목록 보기</h3> 
		<button type="button" style="text-decoration: none; color: black;"><a href="booklist.jsp">목록 조회</a></button>
	</div>

</body>
</html>