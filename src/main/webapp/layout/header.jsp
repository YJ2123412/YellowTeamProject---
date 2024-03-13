<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- Header -->
<div id="header">
	<!-- Nav -->
	<nav id="nav">
		<ul id="user">
			<li><a href="${pageContext.request.contextPath }/join"><span>회원가입</span></a></li>
			<li><a href="${pageContext.request.contextPath }/login">로그인</a></li>
			<!--
				<c:if test="${sessionScope.user == null }">		
					<li><a href="${pageContext.request.contextPath }/join"><span>회원가입</span></a></li>
					<li><a href="${pageContext.request.contextPath }/login">로그인</a></li>
				</c:if>	
				<c:if test="${sessionScope.user != null }">		
					<li><a href="#"><span>${user.name }님</span></a>
						<ul id="bookcafe">
							<li><a href="${pageContext.request.contextPath }/member/modify">회원정보</a></li>
							<li><a href="#">마이페이지</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
				</c:if>	
			-->
		</ul>
		<ul id="menu">
			<li><a class="mainmenu" href="${pageContext.request.contextPath}">Home</a></li>								
			<li>
				<a class="mainmenu" href="${pageContext.request.contextPath}/movie/list">상영일정</a>
				<ul class="submenu">
					<li><a href="">하위메뉴 1</a></li>
					<li><a href="">하위메뉴 1</a></li>
				</ul>
			</li>
			<li>
				<a class="mainmenu" href="${pageContext.request.contextPath}/movie/search">영화검색</a>
				<ul class="submenu">
					<li><a href="">하위메뉴 1</a></li>
					<li><a href="">하위메뉴 1</a></li>
				</ul>
			</li>
			<li>
				<a class="mainmenu" href="${pageContext.request.contextPath}/movie/reserve">영화예매</a>
				<ul class="submenu">
					<li><a href="">하위메뉴 1</a></li>
					<li><a href="">하위메뉴 1</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/header.js"></script>
</div>