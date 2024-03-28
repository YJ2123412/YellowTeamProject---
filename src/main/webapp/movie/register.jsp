<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css?v=3" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css?v=3" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movieRegister.css" />
<title>영화 등록 - 스타라이트 시네마</title>
</head>
<body>
	<%@ include file="../layout/header.jsp" %>
	<main id="movie-register-main">
		<form action="" method="post" enctype="multipart/form-data">
	        <input type="hidden" name="Content-Type" value="image/jpg" />
			<h3>영화 등록</h3>
			<div class="file-wrapper">
				<input type="file" id="poster" name="poster" accept="image/jpg">
				<label id="upload-section" for="poster">
					<span id="upload-button">영화 포스터 업로드</span>
				</label>
			</div>
			<div class="input-wrapper">
				<p>영화 제목</p>
				<input type="text" name="mname">
			</div>
			<div class="input-wrapper">
				<p>장르</p>
				<input type="text" name="genre" placeholder="쉼표(,)로 구분">
			</div>
			<div class="input-wrapper">
				<p>감독</p>
				<input type="text" name="director" placeholder="쉼표(,)로 구분">
			</div>
			<div class="input-wrapper">
				<p>개봉일</p>
				<input type="text" name="release_date" placeholder="YYYY-MM-DD">
			</div>
			<div class="input-wrapper">
				<p>제작사 및 배급사</p>
				<input type="text" name="producer" placeholder="쉼표(,)로 구분">
			</div>
			<div class="input-wrapper">
				<p>영상물 등급</p>
				<select name="rating">
					<option value="0">ALL</option>
					<option>7</option>
					<option>12</option>
					<option>15</option>
					<option>18</option>
				</select>
			</div>
			<div class="input-wrapper">
				<p>상영시간</p>
				<input type="number" name="running_time" placeholder="단위: 분" min="0">
			</div>
			<div class="input-wrapper">
				<p>줄거리</p>
				<textarea name="synopsys" style="resize: none;"></textarea>
			</div>
			<div class="input-wrapper">
				<p>평점</p>
				<input type="text" name="mgrade" placeholder="평점을 입력하세요.">
			</div>
			<div class="input-wrapper">
				<p>국가</p>
				<input type="text" name="country" placeholder="쉼표(,)로 구분">
			</div>
			<div class="input-wrapper">
				<p>출연진</p>
				<input type="text" name="mcast" placeholder="쉼표(,)로 구분">
			</div>
			<div class="button-wrapper">
				<button id="movie-register" type="button">등록</button>
			</div>
		</form>
	</main>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/movieRegister.js"></script>
</body>
</html>