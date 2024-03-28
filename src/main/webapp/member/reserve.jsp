<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타 라이트 영화관</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/memberReserve.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<div class="container">
<h2>예매 내역</h2>
<c:forEach var="ele" items="${list}">
    <div class="wrap">
		<img class="poster" src="https://yellows3.s3.ap-northeast-2.amazonaws.com/share/poster/${mname}.jpg" alt="${mname}">
	     <div class="container-in">
	      <div class="top-container">
	         <h3><c:out value="${ele.mname}"/></h3><p><strong>예매번호 </strong><c:out value="${ele.rcode}"/></p>
	      </div>
	      <hr>
	        <div class="inform">
	            <p><strong>관람일시</strong> <c:out value="${ele.schedule}"/></p>
	            <p><strong>상 영 관 </strong><c:out value="${ele.name}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <strong>좌석 </strong><c:out value="${ele.seat}"/></p>
	            <p><strong>예매일자 </strong><c:out value="${strNewFormatDate}"/></p>
	            <p><strong>고객  ID </strong><c:out value="${ele.member_code}"/></p>
	            <p><strong>관람등급 </strong><c:out value="${ele.rating}"/>세</p>
	         </div>
        </div>
    </div>
    <hr>
</c:forEach>
</div>
           
</body>
</html>