<%@ page import="mybatis.dao.MovieDao"%>
<%@ page import="mybatis.vo.Schedule" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 일정 - 스타 라이트 시네마</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movielist.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css?v=3" />
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<section id = "movieList">
<h3>상영 일정</h3>
<hr style="color:white;">
<div id=listnow>
<a href="list?type=all" class ="line" >전체 보기</a> 
<a href="list?type=ing" class = "line">현재 상영작</a> 
<a href="list?type=later" class = "line">상영 예정작</a>
<a href="list?type=end" class = "line">상영 종료작</a>
<script>
</script>
</div>
<div class="movie-container">
    <ul class="movie-list col-5 row-5">
        <c:forEach var="movie" items="${list}">
            <li class="movie-item">
            <p class = "image-style">
                <a href="showMovieDetail?mcode=${movie.mcode}">
                    <img class="img-style" src="https://yellows3.s3.ap-northeast-2.amazonaws.com/share/poster/${movie.poster}.jpg" alt="${movie.mname}">
                </a>
             </p>
                <p class="mname">${movie.mname}</p>
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
                <p class="runt">${movie.running_time}분</p>
            </li>
        </c:forEach>
    </ul>
</div>

</section>
<script src="${pageContext.request.contextPath}/assets/js/list.js"></script>
 <section id="cta" class="wrapper style3">
	<%@include file="../layout/footer.jsp" %>
	</section>
</body>
</html>