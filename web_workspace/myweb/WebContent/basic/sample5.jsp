<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sample.vo.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic/sample5</title>
</head>
<body>
	<h1>스크립틀릿 사용하기</h1>
	
	<%
		Contact contact1 = new Contact("홍길동", "010-1234-5678", "hong@gmail.com", "현대자동차");
		Contact contact2 = new Contact("김유신", "010-3434-1121", "kim@gmail.com", "우리은행");
		Contact contact3 = new Contact("강감찬", "010-1313-5551", "kang@gmail.com", "서울시청");
		Contact contact4 = new Contact("이순신", "010-1244-5665", "lee@gmail.com", "교보문고");
		Contact contact5 = new Contact("을지문덕", "010-1515-5614", "eulgig@gmail.com", "청와대");
		Contact contact6 = new Contact("광개토대왕", "010-3434-5644", "king@gmail.com", "육군본부");
		
		List<Contact> contacts = new ArrayList<Contact>();
		contacts.add(contact1);
		contacts.add(contact2);
		contacts.add(contact3);
		contacts.add(contact4);
		contacts.add(contact5);
		contacts.add(contact6);
	%>
	
	<table border="1" style="width: 100%;" >
		<thead>
			<tr>
				<th>이름</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>소속회사</th>
			</tr>
		</thead>
		<tbody>
		<%
			for (Contact contact : contacts) {
		%>
				<tr>
					<td><%=contact.getName() %></td>
					<td><%=contact.getTel() %></td>
					<td><%=contact.getEmail() %></td>
					<td><%=contact.getCompany() %></td>
				</tr>	
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>