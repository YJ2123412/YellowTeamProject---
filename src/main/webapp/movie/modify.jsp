<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>영화 수정 - 스타라이트 시네마</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />	
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movieManage.css" />
</head>
<body class="is-preload">
	<%@ include file="../layout/header.jsp"%>
	<div id="page-wrapper">
		<main>
			<c:forEach items="${list}" var="vo" varStatus="status">
				<div class="movie-box">
					<div class="movie-poster">
						<input type="hidden" name="${status.index}-mcode" value="${vo.mcode}" />
						<img src="https://yellows3.s3.ap-northeast-2.amazonaws.com/share/poster/${vo.poster}.jpg" alt="">
					</div>
					<div class="movie-info">
						<div class="movie-info-unit">
							<input type="hidden" name="${status.index}-mname" value="${vo.mname}" />
							<input type="hidden" name="${status.index}-running_time" value="${vo.running_time}" />
							<p>제목: <c:out value="${vo.mname}" /></p>
							<p>상영시간: <c:out value="${vo.running_time}" />분</p>
						</div>
						<div class="movie-info-unit">
							<input type="hidden" name="${status.index}-director" value="${vo.director}" />
							<input type="hidden" name="${status.index}-mcast" value="${vo.mcast}" />
							<input type="hidden" name="${status.index}-cidx" value="${vo.cidx}" />
							<input type="hidden" name="${status.index}-schedule" value="${vo.schedule}" />
							<p style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
								감독: <c:out value="${vo.director}" />
							</p>
							<p style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
								출연진: <c:out value="${vo.mcast}" />
							</p>
							<p>상영관: <c:out value="${vo.cidx}" /></p>
							<p class="schedule-label">
								상영기간:
								<span class="startDate"><c:out value="${vo.schedule}" /></span>
								<span class="endDate"></span>
							</p>
						</div>
						<div class="movie-synopsys">
							<input type="hidden" name="${status.index}-synopsys" value="${vo.synopsys}" />
							<p>영화 소개: <c:out value="${vo.synopsys}" /></p>
						</div>
					</div>
				</div>
			</c:forEach>
		</main>
	</div>
	<div class="modify-modal close">
		<form>
			<input type="hidden" name="mcode">
			<div class="modal-field">
				<p>영화 제목</p>
				<input type="text" name="mname" />
			</div>
			<div class="modal-field">
				<p>상영시간</p>
				<input type="number" name="running_time" min="0" placeholder="단위: 분"/>
			</div>
			<div class="modal-field">
				<p>감독</p>
				<input type="text" name="director" />
			</div>
			<div class="modal-field">
				<p>출연진</p>
				<input type="text" name="mcast" />
			</div>
			<div class="modal-field">
				<p>상영관</p>
				<input type="text" name="cidx" />
			</div>
			<div class="modal-field">
				<p class="schedule-label">상영기간</p>
				<div>
					<input type="date" name="schedule"/>
					~
					<input type="date" name="schedule-end" readonly="readonly" />
					<button id="changeSchedule" type="button">상영으로 변경</button>
				</div>
			</div>
			<div class="modal-field">
				<p>줄거리</p>
				<textarea name="synopsys" style="resize: none;"></textarea>
			</div>
			<div class="modal-buttons">
				<button id="modal-save" type="button">Save</button>
				<button id="modal-close" type="button">Close</button>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/movieModify.js"></script>
</body>
</html>