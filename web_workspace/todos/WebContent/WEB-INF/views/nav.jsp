<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark mt-3 mb-3">
		<ul class="navbar-nav mr-auto">
      		<li class="nav-item active">
        		<a class="nav-link" href="/home.hta">홈</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="/todos.hta">할일 관리</a>
      		</li>
    	</ul>
    	<ul class="navbar-nav navbar-dark bg-dark justify-content-end">
      		<c:choose>
      			<c:when test="${empty loginUser }">
		      		<li class="nav-item">
		        		<a class="nav-link" href="#" onclick="openRegisterformModal(event)">회원가입</a>
		      		</li>
		      		<li class="nav-item">
		        		<a class="nav-link" href="#" onclick="openLoginformModal(event)">로그인</a>
		      		</li>
      			</c:when>
	      		<c:otherwise>
		      		<li class="nav-item">
		        		<a class="nav-link" href="/logout.hta">로그아웃</a>
		      		</li>
	      		</c:otherwise>
      		</c:choose>
    	</ul>
	</nav>