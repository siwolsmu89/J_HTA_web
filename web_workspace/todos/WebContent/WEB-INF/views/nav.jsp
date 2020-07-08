<%@ page language="java" pageEncoding="UTF-8"%>
<!-- Header -->
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark mt-3 mb-3">
		<ul class="navbar-nav mr-auto">
      		<li class="nav-item ${position eq 'home' ? 'active' : '' }">
        		<a class="nav-link" href="/home.hta"><fmt:message key="menu.label.home" /></a>
      		</li>
      		<c:if test="${not empty loginUser }">
	      		<li class="nav-item ${position eq 'todos' ? 'active' : '' }">
	        		<a class="nav-link" href="/todo/list.hta"><fmt:message key="menu.label.todo" /></a>
	      		</li>
      		</c:if>
    	</ul>
    	<ul class="navbar-nav navbar-dark bg-dark justify-content-end">
      		<c:choose>
      			<c:when test="${empty loginUser }">
		      		<li class="nav-item">
		        		<a class="nav-link" href="#" onclick="openRegisterformModal(event)"><fmt:message key="menu.label.signup" /></a>
		      		</li>
		      		<li class="nav-item">
		        		<a class="nav-link" href="#" onclick="openLoginformModal(event)"><fmt:message key="menu.label.signin" /></a>
		      		</li>
      			</c:when>
	      		<c:otherwise>
		      		<li class="nav-item">
		        		<a class="nav-link disabled" style="color: white;">${loginUser.name }님, 환영합니다.</a>
		      		</li>
		      		<li class="nav-item">
		        		<a class="nav-link" href="/logout.hta">로그아웃</a>
		      		</li>
	      		</c:otherwise>
      		</c:choose>
    	</ul>
	</nav>