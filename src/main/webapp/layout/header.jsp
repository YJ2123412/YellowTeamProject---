<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
			<!-- Header -->
				<div id="header">
					<!-- Logo -->
						<h1><a href="${pageContext.request.contextPath }" id="logo">커피24 <em>북카페</em></a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul id="user">
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
							</ul>
							<ul id="menu">
								<li><a href="${pageContext.request.contextPath }">Home</a></li>								
								<li>
									<a href="#">북카페</a>
									<ul id="bookcafe">
										<li><a href="${pageContext.request.contextPath }/useguide.jsp">이용안내</a></li>
										<li><a href="${pageContext.request.contextPath }/notice/list">공지사항</a></li>
									</ul>
								</li>
								<li><a href="${pageContext.request.contextPath }/book/list">새로나온 책</a></li>
								<li><a href="${pageContext.request.contextPath }/book/bookcase">책장</a></li>
								<li><a href="${pageContext.request.contextPath }/bookwarm.jsp">책벌레</a></li>
								<li><a href="${pageContext.request.contextPath }/community/list">북챗</a></li>
							</ul>
						</nav>
				</div>