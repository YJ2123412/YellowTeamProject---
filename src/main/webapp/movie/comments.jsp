<%@ page import="mybatis.dao.MovieDao"%>
<%@ page import="mybatis.vo.Schedule" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 후기 - 스타 라이트 시네마</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movieCommentsList.css"/>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<section id = "movieList">
<h3>영화 후기</h3>
<hr style="color:white;">
<div id=listnow>
<a href="comments?type=all" class="line" >전체 보기</a> 
<a href="comments?type=ing" class="line">현재 상영작</a> 
<a href="comments?type=later" class="line">상영 예정작</a>
<a href="comments?type=end" class="line">상영 종료작</a>
<script>
</script>
</div>
<div class="movie-container">
    <ul class="movie-list col-5 row-5">
        <c:forEach var="movie" items="${list}">
        	<c:if test="${movie.comments > 0}">
        		<li class="movie-item" onclick="location.href='showMovieDetail?mcode=${movie.mcode}'">
		             <div class="left">
		             	<p class = "image-style">
			                <img class="img-style" src="https://yellows3.s3.ap-northeast-2.amazonaws.com/share/poster/${movie.poster}.jpg" alt="${movie.mname}">
			            </p>
		             </div>
		             <div class="right">
		             	<div class="info-block">
			             	<p class="mname">
			             		${movie.mname}
			             	</p>
				             <c:choose>
				                 <c:when test="${movie.rating == 0}">
				                     <p class="green" style="color:green;">${movie.rating}세 이상 관람가</p>
				                 </c:when>
				                 <c:when test="${movie.rating == 12}">
				                     <p class="orange" style="color:#FFA200;">${movie.rating}세 이상 관람가</p>
				                 </c:when>
				                 <c:when test="${movie.rating == 15}">
				                     <p class="blue" style="color:blue;">${movie.rating}세 이상 관람가</p>
				                 </c:when>
				                 <c:when test="${movie.rating == 18}">
				                     <p class="red" style="color:red;">${movie.rating}세 이상 관람가</p>
				                 </c:when>
				             </c:choose>
			             </div>
			             <div class="comments-block">
			             	<c:forEach items="${movie.commentMap}" var="cm" varStatus="status">
			             		<c:if test="${status.index < 3 }">
			             			<p>
				             			${cm.value} - <c:out value="${cm.key}" />
				             		</p>
			             		</c:if>
			             	</c:forEach>
			             </div>
		             </div>
	            </li>
        	</c:if>
        </c:forEach>
    </ul>
</div>
</section>
<%@include file="../layout/footer.jsp" %>
<script src="${pageContext.request.contextPath}/assets/js/list.js"></script>
</body>
</html>