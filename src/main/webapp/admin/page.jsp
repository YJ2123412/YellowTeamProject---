<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />  
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myPage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/adminpage.css" />
<script src="https://kit.fontawesome.com/352c53403e.js" crossorigin="anonymous"></script>
<title>관리자 페이지 - 스타라이트 시네마</title>
</head>
<body id="admin-page">
<%@include file="../layout/header.jsp" %>
<div id="page-wrapper">
	<div class="tabs1">
		<a href="${pageContext.request.contextPath}/myPage">예매내역</a>
		<a href="${pageContext.request.contextPath}/member/modify">회원정보수정</a>
		<c:if test="${sessionScope.user.isadmin == 'Y' }">
			<a href="${pageContext.request.contextPath}/admin/page" class="active">관리자 페이지</a>
		</c:if>
	</div>
	<hr>
	<c:if test="${sessionScope.user.isadmin == 'Y' }">
		<form id="cont">
			<button class="join-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/join.jsp'">관리자 등록</button>
			<button class="join-btn" type="button" id="delete">관리자 해지</button>
			<button class="join-btn" type="button" id="btn-open-modal">관리자 목록</button>
			<button class="join-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/movie/register'">영화 등록</button>
			<button class="join-btn" type="button" onclick="location.href='${pageContext.request.contextPath}/movie/modify'">영화 수정</button>
		</form>
	</c:if>
</div>
<div class="modal">
    <div class="modal_body">
        <h2>관리자 목록</h2>
        <ul id="list">
        </ul>
        <button class="btn-close-modal">CLOSE</button>
    </div>
</div>
<script>
	const modal = document.querySelector('.modal');
	const btnOpenModal = document.querySelector('#btn-open-modal');
	const btnCloseModal = document.querySelector('.btn-close-modal');

	btnOpenModal.addEventListener("click", () => {
	    modal.style.display = "flex";
	    selectAdmin();
	});

	btnCloseModal.addEventListener("click", () => {
	    modal.style.display = "none";
	});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/adminlist.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admindelete.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>