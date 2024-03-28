<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../assets/css/reserve.css" />
<link rel="stylesheet" href="../assets/css/modal.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal" tabindex="-1" id="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title">영화 결제</h6>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="pay">
						<hr> 
						<div>제목</div>
						<h4 id="movie.mcode"></h4>
						<div>가격</div>
						<h3 id="price" class="inline">??</h3>원
					</div>	
					<div class="pay">
							<!-- 결제 UI, 이용약관 UI 영역 -->
							  <div id="payment-method"></div>
							  <div id="agreement"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					  <!-- 결제하기 버튼 -->
					  <button id="payment-button" type="button" class="btn btn-primary">결제하기</button>
				</div>
			</div>
		</div>
	</div>
	<script src="../assets/js/reserve.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/browser.min.js"></script>
	<script src="../assets/js/breakpoints.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
	<!-- 부트스트랩 - 모달 사용 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 비동기 http 통신 axios api-->  <!-- 비동기 통신을 위한 자바스크립트 api -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<!-- 결제위젯 SDK 추가 -->
	<script src="https://js.tosspayments.com/v1/payment-widget"></script>

</body>
</html>