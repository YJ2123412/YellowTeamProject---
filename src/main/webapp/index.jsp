<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE HTML>
<!--
	Arcana by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
	<title>스타라이트 시네마</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="0">
    <meta name="description" content="" />
    <meta name="author" content="" />
   	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css?v=3" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css?v=3" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/banner.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movieCard.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/label.css">
	<script src="https://kit.fontawesome.com/352c53403e.js" crossorigin="anonymous"></script>
</head>
<body class="is-preload">+
<div id="page-wrapper" class="home" style="padding-top: 150px;">
	<script>
		var back = sessionStorage.getItem('back');
		if(back) {
			location.href=back;
			sessionStorage.removeItem('back');
		}
	</script>
	<!-- Header -->
	<%@ include file="./layout/header.jsp" %>
	<!-- Banner -->
	<section id="banner">
	</section>
	<!-- Highlights -->
	<section class="wrapper style1">
		<div class="container">
			<div class="row gtr-200">
				<section class="col-4 col-12-narrower">
				</section>
				<section class="col-4 col-12-narrower">
				</section>
				<section class="col-4 col-12-narrower">
				</section>
			</div>
		</div>
	</section>
	<!-- Gigantic Heading -->
	<section class="wrapper style2">
		<div class="container">
		</div>
	</section>
	<!-- Posts -->
	 <section class="wrapper style1">
		<div id="movie-posts" class="container">
		</div>
	</section>
	<!-- CTA -->
	<section id="cta" class="wrapper style3">
	<%@include file="../layout/footer.jsp" %>
	</section>
	<div data-num="0" id="datanum"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/home.js"></script>
</div>
</body>
</html>