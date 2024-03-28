<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>스타라이트 시네마</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />

</head>
<body class="is-preload">
<div id="page-wrapper">
		<!-- Header -->
		<%@ include file="../layout/header.jsp" %>
		<hr>
		<hr>
		<div class="mycol-2" style="width:450px;">
		</div>
		<div class="mycol-2" style="width:600px;">				
				<div class="login">
				  <h2>회원 로그인</h2>
				  <label id="incorrect">계정 정보가 일치하지 않습니다.</label>
				  <form action="login" method="post">
				    <div class="mb-3">
				      <label for="code">아이디:</label>
				      <input class="form-control" id="code" placeholder="Enter id" type="text" name="code" required>
				    </div>
				    <div class="mb-3">
				      <label for="pwd">패스워드:</label>
				      <input type="password" class="form-control" id="password" placeholder="Enter password" 
				      		name="password" required>
				    </div>
				    <div class="form-check mb-3">
				      <label class="form-check-label">
				        <input class="form-check-input" type="checkbox" name="remember">remember me
				      </label>
				    </div>
				    <button class="btn btn-primary" style= background-color:#0E2759;>로그인</button>
				  </form>
				  <hr>
				  <a href="join" class="f-sm" style= color:#000000;>아직 회원이 아니시면 회원 가입을 해주세요.</a><br>
            	 
				</div>
				
		</div>
		
</div>

<script type="text/javascript">
	console.log('${cookie.incorrect}')
	var cookies = document.cookie.split(';');
	cookies.forEach(function(cookie) {
	    if (cookie.trim().startsWith('incorrect=')) {
	        var value = cookie.split('=')[1];
	        if (value === 'y') {
	            document.getElementById('incorrect').style.display = 'inline-block';
	            document.cookie = 'incorrect' + "=; expires=Thu, 01 Jan 1970 00:00:10 GMT; path=/;";
	        }
	    }
	});
</script>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

</body>
</html>
