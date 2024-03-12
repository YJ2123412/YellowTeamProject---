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
	<title>커피24 북카페</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="0">
      	<meta name="description" content="" />
      	<meta name="author" content="" />
	<link rel="stylesheet" href="assets/css/main.css?v=3" />
	<link rel="stylesheet" href="css/layout.css?v=3" />
	<script src="https://kit.fontawesome.com/352c53403e.js" crossorigin="anonymous"></script>
</head>
<body class="is-preload">
<div id="page-wrapper">
	<script>
		/* 로그인 후 글쓰기로 돌아가기 */
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
			<img alt="" src="images/bookmain.png" width="100%" height="75%" style="object-fit: cover;">
	</section>
	<!-- Highlights -->
	<section class="wrapper style1">
		<div class="container">
			<div class="row gtr-200">
				<section class="col-4 col-12-narrower">
					<div class="box highlight">
						<i class="icon solid major fa-book"></i>
						<h3>책장</h3>
						<p>커피24에서 함께 보는<br> 책들 구경오세요.<br>
						회원님들의 소장 도서를 판매합니다.
						</p>
					</div>
				</section>
				<section class="col-4 col-12-narrower">
					<div class="box highlight">
						<i class="icon solid major fa-award"></i>
						<h3>책벌레</h3>
						<p>매달 좋은 책들을 소개하고<br> 책 이야기 많이 해주시는 책벌레들을 <br>소개합니다.</p>
					</div>
				</section>
				<section class="col-4 col-12-narrower">
					<div class="box highlight">
						<i class="icon solid major fa-frog"></i>
						<h3>북챗</h3>
						<p>오늘 책을 읽으셨나요? <br>당신의 추억과 일상을 <br>책과 함께 이야기해 주세요.</p>
					</div>
				</section>
			</div>
		</div>
	</section>
	<!-- Gigantic Heading -->
	<section class="wrapper style2">
		<div class="container">
			<header class="major">
				<h2>BEST Pick</h2>
			</header>
		</div>
	</section>
	<!-- Posts -->
	<section class="wrapper style1">
		<div class="container">
			<div class="row">
				<section class="col-6 col-12-narrower">
					<div class="box post">
						<a href="https://product.kyobobook.co.kr/detail/S000208779631" class="image left" target="blank_">
						<img src="/upload/index0.jpg" alt="" /></a>
						<div class="inner">
							<h3>마흔에 읽는 쇼펜하우어</h3>
							<p>하고 싶고 할 수 있는 것에 집중하라!<br>마흔의 삶에 지혜를 주는 쇼펜하우어의 30가지 조언
마흔의 마음은 복잡하다. 그동안 수많은 시험을 치르고 자리 잡기 시작했지만, 한참 남은 인생이 기대되기보다 늘 그렇듯 같은 일상이 반복될 것이라는 생각을 하게 된다. 벌써부터 웬만한 일은 재미가 없고 뻔하게 느껴진다. 언제부터인가 “산다는 것은 괴로운 것이다”라는
 말에 고개를 끄덕이게 됐다. 행복, 고통, 인생에 대해 고민하기 시작한 당신에게 쇼펜하우어의 조언이 필요할 때다.</p>
						</div>
					</div>
				</section>
				<section class="col-6 col-12-narrower">
					<div class="box post">
						<a href="https://product.kyobobook.co.kr/detail/S000211346066" class="image left" target="blank_">
						<img src="/upload/index1.jpg" alt="" /></a>
						<div class="inner">
							<h3>인생은 순간이다</h3>
							<p>
								“죽었다 깨어나도, 나이를 먹었다 해도 계속 성장하지 않으면 자리가 없어.시선은 늘 앞으로, 미래로.”<br>82세 현역 감독 김성근 에세이
							</p>
						</div>
					</div>
				</section>
			</div>
			<div class="row">
				<section class="col-6 col-12-narrower">
					<div class="box post">
						<a href="https://product.kyobobook.co.kr/detail/S000209007998" class="image left" target="blank_">
						<img src="/upload/index2.jpg" alt="" /></a>
						<div class="inner">
							<h3>트렌드 코리아 2024</h3>
							<p>
								청룡을 타고 비상하는 2024를 기원하며!<br>모든 일은 서서히 준비되고 있다가 갑작스럽게 나타난다. 챗GPT가 그랬다. 인공지능 기술과 이야기가 수도 없이 나왔지만, 챗GPT만큼 우리에게 충격을 주는 것은 없었다. 무엇이 달랐던 것일까? ‘자연어’ 소통이 가능하다는 점일 것이다. “가장 인기 있는 새로운 프로그래밍 언어는 영어”라는 말이 나오는 이유다.
							</p>
						</div>
					</div>
				</section>
				<section class="col-6 col-12-narrower">
					<div class="box post">
						<a href="https://product.kyobobook.co.kr/detail/S000210863594" class="image left" target="blank_">
						<img src="/upload/index3.jpg" alt="" /></a>
						<div class="inner">
							<h3>말의 진심</h3>
							<p>
								숨겨진 마음에 다가가는 말의 심리학<br>말은 생각의 표현이고, 생각은 마음과 연결되어 있다. 따라서 사용하는 단어, 말의 속도, 목소리 톤, 몸짓에는 그 사람의 마음이 고스란히 묻어난다. 말은 정보를 전달하는 것이 아니라 마음을 나누는 수단이다. 가족, 동료, 친구 등 가까운 사람일수록 말 뒤에 숨은 진심을 들여다보지 못하면 소통이 힘들고 오해가 쌓이게 된다. ‘괜찮아’, ‘몰라’, ‘아니’ 등 평소에 자주 사용하는 말습관을 들여다보면 그 사람의 진심이 무엇인지를 알 수 있다. 언어의 마음을 읽는 법을 심리학적으로 접근하고 대화의 기술로 소통을 해결한다.
							</p>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
	<!-- CTA -->
	<section id="cta" class="wrapper style3">
		<div class="container">
			<header>
					<h3 style="margin:0 auto;">책과 함께 힐링하세요!</h3>
			</header>
		</div>
	</section>
	<div data-num="0" id="datanum"></div>
	<!-- Footer -->
	<div id="footer">
		<div class="container">
			<div class="row">
				<section class="col-3 col-6-narrower col-12-mobilep">
					<h4>지역 공공도서관</h4>
					<ul class="links">
						<li><a href="#">국립어린이청소년도서관</a></li>
						<li><a href="#">역삼도서관</a></li>
						<li><a href="#">역삼푸른솔도서관</a></li>
						<li><a href="#">지식재산전문도서관</a></li>
					</ul>
				</section>
				<section class="col-3 col-6-narrower col-12-mobilep">
					<h4>지역 유명서점</h4>
					<ul class="links">
						<li><a href="#">알라딘 중고서점(강남점)</a></li>
						<li><a href="#">영풍문고 강남역점</a></li>
						<li><a href="#">영풍문고 강남포스코점</a></li>
						<li><a href="#">교보문고 강남점</a></li>
						<li><a href="#">한티문고</a></li>
						<li><a href="#">최인아 책방</a></li>
					</ul>
				</section>
			</div>
		</div>
		<!-- Icons -->
		<ul class="icons">
			<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
			<li><a href="#" class="icon brands fa-google-plus-g"><span class="label">Google+</span></a></li>
		</ul>
		<!-- Copyright -->
		<div class="copyright">
			<ul class="menu">
				<li>&copy; BookCafe24🧵SHiKim. All rights reserved</li>
			</ul>
		</div>
	</div>
</div>
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="js/nav.js"></script>
</body>
</html>