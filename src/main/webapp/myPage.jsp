<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE HTML>
<html>
<head>
<title>스타라이트 시네마</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />  
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/memberReserve.css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myPage.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://kit.fontawesome.com/352c53403e.js" crossorigin="anonymous"></script>
</head>
<body class="is-preload">
<%@include file="../layout/header.jsp" %>
<div id="page-wrapper">
	<div class="tabs1">
		<a href="${pageContext.request.contextPath}/myPage" class="active">예매내역</a>
		<a href="${pageContext.request.contextPath}/member/modify">회원정보수정</a>
		<c:if test="${sessionScope.user.isadmin == 'Y' }">
			<a href="${pageContext.request.contextPath}/admin/page">관리자 페이지</a>
		</c:if>
	</div>
	<div class="container">
	<h2>예매 내역</h2>
	<c:forEach var="ele" items="${list}">
	    <div class="wrap">
	      <img class="poster" src="https://yellows3.s3.ap-northeast-2.amazonaws.com/share/poster/${ele.poster}.jpg" alt="${ele.poster}">
	        <div class="container-in">
	         <div class="top-container">
	            <h3><c:out value="${ele.mname}"/></h3><p><strong>예매번호</strong><c:out value="${ele.rcode}"/></p>
	         </div>
	         <hr>
		        <div class="inform">
		            <p><strong>관람일시</strong> <c:out value="${ele.schedule}"/></p>
		            <p><strong>상 영 관 </strong><c:out value="${ele.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            <strong>좌석 </strong><c:out value="${ele.seat}"/></p>
		            <p><strong>예매일자 </strong><c:out value="${ele.reserve_datef}"/></p>
		            <p><strong>고객  ID </strong><c:out value="${ele.member_code}"/></p>
		            <p><strong>관람등급 </strong><c:out value="${ele.rating}"/>세</p>
		         </div>
	        </div>
	    </div>
	    <hr>
	</c:forEach>
	</div>
	<hr>
	<c:if test="${empty list}">
		<div class= "no-reser">
		<span class="material-symbols-outlined" style= font-size:90px;>
		do_not_disturb_on
		</span>
		<p style=font-size:30px;>예매한 내역이 존재하지 않습니다.</p>
		</div>
    </c:if>
</div>
	<div class="modal">
        <div class="modal_body">
            <h2>모달창 제목</h2>
            <ul class="list" id="list">
            </ul>
            <button class="btn-close-modal">CLOSE</button>
        </div>
    </div>

<h5 class="h5"> 예매하고 티켓찾기</h5>
<div class="description">
<dl>
<dd>- 예매 완료 시 생성되는 <span class="red2">예매번호로 매표소 및 무인 발권기</span>에서 티켓을 수령할 수 있습니다.</dd>
<dd>- 예고편 상영 등 극장 사정에 의해 영화시작이 10여분 차이 날 수 있습니다.</dd>
<dd>* 청소년 관람불가 영화는 보호자를 동반해도 만 18세 미만 고객은 관람이 불가합니다. 상영관 입장시, 신분증을 지참하시기 바랍니다.</dd>
<dd>* 일부 극장은 상영시작 이후 입장이 제한될 수 있으니, 반드시 상영시작 시간 내에 발권 후 입장해 주세요.</dd>

</dl>
</div>
<h5 class="h5"> 예매를 취소하고 싶을 때</h5> 
<div class="description">
<dl>
<dd>- 예매 취소는 각 극장별 취소가능시간까지만 가능합니다.</dd>
<dd>- 고객센터 및 각 극장에 전화상으로 취소는 불가능하며 인터넷상에서 취소가 불가능한 경우 관람시간 전에 극장에 방문하시어 현장 취소하셔야 합니다.</dd>
<dd>- 단, 극장에서 발권한 후에는 시간에 관계없이 인터넷상에서 취소는 불가하며 현장취소만 가능 합니다.</dd>
<dd>- 예매완료 후에는 부분취소나 시간 변동을 할 수 없습니다. 예매내역 전체를 취소한 후 재예매를 하셔야 합니다.</dd>
<dd>- 예매 취소 완료 여부는 반드시 취소내역에서 확인 하셔야 합니다.<dd>
</dl>
</div>

<h5 class="h5">극장 현장에서 취소 했을 때</h5>
<div class="description">
<dl>
<dd>- 극장 현장에서 취소하신 경우 취소 내역은 관람일 다음날 오전 중에 반영 됩니다.</dd>
<dd>- 이 때 결제도 함께 취소되니 현장 취소시에 유의하시기 바랍니다.</dd>
</dl>
</div>
<h5 class="h5">환불규정</h5>
<div class="description">
<dl>
<dt style=font-weight:bold;>온라인 영화 예매 후 취소가능시간 내에 취소하시면 전액 환불됩니다.</dt>
<dd>1. 신용카드 : 결제일과 취소일이 다를 경우 영업일 기준 3~5일 소요됩니다.</dd>
<dd>2. 네이버페이 : 네이버페이 포인트를 사용하신 경우 포인트로 재적립 됩니다.
카드결제를 한 경우 카드사 정책에 따라 승인 취소가 진행되며, 3일 이후 매입 취소 시 영업일 기준 3~10일 소요됩니다.</dd>
<dd>3. 카카오페이 : 카카오페이머니를 사용하신 경우 카카오페이머니 잔액으로 원복 됩니다.
카드결제를 한 경우 카드사 정책에 따라 승인취소가 진행되며, 3일 이후 매입 취소 시 영업일 기준 3~10일 소요됩니다.</dd>
<dd>4. 페이코 : PAYCO 포인트를 사용하신 경우 포인트로 재적립 됩니다.
카드결제를 한 경우 카드사 정책에 따라 승인취소가 진행되며, 3일 이후 매입 취소 시 영업일 기준 3~10일 소요됩니다.</dd>
</dl>
<br>
<p><span class="red2"> ※ 예매내용을 변경할 때는, 취소가능시간 내에 취소하고 다시 예매해 주시기 바랍니다.</span></p>
</div>
	<section id="cta" class="wrapper style3">
	<%@include file="../layout/footer.jsp" %>
	</section>
</body>
</html>

