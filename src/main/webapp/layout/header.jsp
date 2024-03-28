<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id = "header">
  <ul id="user" style="list-style:none;">
	<c:if test="${sessionScope.user == null }">		
		<li><a href="${pageContext.request.contextPath }/join"><span>회원가입</span></a></li>
		<li><a href="${pageContext.request.contextPath }/login">로그인</a></li>
	</c:if>	
	<c:if test="${sessionScope.user != null }">		
		<li><a href="${pageContext.request.contextPath }/myPage"><span>마이페이지</span></a>
		<li><a href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
	</c:if>
  </ul>
  <ul class="menu" style="list-style:none;">
    <li class="site-tab">
        <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="logo" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
    </li>
	<li>
		<a href="${pageContext.request.contextPath}/movie/search">영화검색</a>
	</li>
	<li>
		<a class="mainmenu" href="${pageContext.request.contextPath}/movie/list">영화예매</a>
	</li>
	<li>
		<a class="mainmenu" href="${pageContext.request.contextPath}/movie/comments">영화후기</a>
	</li>
  </ul>
</div>
