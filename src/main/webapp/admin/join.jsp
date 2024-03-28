<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>스타라이트 시네마</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css" />
<style type="text/css">
.change {
	background-color: bisque !important;
}

button.drop {
	font-size: 0.85em;
	border: none;
	background-color: transparent;
	color: gray;
}
form {
padding-top: 150px;
}
</style>
</head>
<body class="is-preload">
	<%@include file="/layout/header.jsp"%>
	<div class="cont" id="page-wrapper">
		<h1>관리자 등록</h1>
		<form id="form">
			<ul class="join-wrap">

				<li>아이디</li>
				<li><input class="id-input" id="username" name="code"
					type="text" onchange="resetCheckId()" placeholder="아이디를 입력해 주세요." />
					<button type="button" onclick="checkId()">중복확인</button>
					<hr></li>
				<li>비밀번호 <label>원하시는 비밀번호를 입력해주세요.</label></li>
				<li><input name="password" type="password"
					placeholder="비밀번호를 입력해 주세요." /></li>
				<li>비밀번호 확인</li>
				<li><input name="password2" type="password"
					placeholder="비밀번호를 다시 한번 입력해 주세요." /></li>
				<li>이름</li>
				<li><input id="name" name="name" type="text" placeholder="이름" /></li>
			</ul>
			<div class="hidden">
				<input id="adultYn" name="adultYn" type="hidden" /> <input
					id="channel" name="channel" type="hidden" />
			</div>
			<button class="join-btn  " type="button" onclick="admimJoin()">등록</button>
		</form>
	</div>
	<script type="text/javascript">
	var isChecked = false;

    function admimJoin() {
      const data = $('#form').serializeObject();
      var adultYn = $('input:radio[name="adultYn"]:checked').val();
      if(data.username == "") {
        alert("아이디를 입력하세요.");
        return;
      }

      if(!isChecked) {
        alert("아이디 중복확인을 해주세요.");
        return;
      }	

      if(data.password == "") {
        alert("비밀번호를 입력하세요.");
        return;
      }

      if(data.password2 == "") {
        alert("비밀번호 확인을 입력하세요.");
        return;
      }
      if(data.password != data.password2) {
        alert("비밀번호 확인이 일치하지 않습니다.");
        $('#password2').focus();
        return;
      }
      if(data.name == ""){
   	  alert("이름을 입력해주세요.")
   	  return;
      }
      
        data.adultYn=undefined;
		data.channel=undefined;
		data.smsAgree=undefined;
		data.kakaoAgree=undefined;
		data.emailAgree=undefined;
        data.password2=undefined;
		console.log('join',data);
      $.ajax({
        url        : '../api/auth/adminJoin',
        data       : JSON.stringify(data),
        dataType       : 'text',
        type       : 'post',
       contentType: 'application/json', 
        success : function(res){
          alert(res);
          location.href = "../myPage";
        },
        error : function(xhr){
          console.log(xhr);
        }
      });
    }


    function checkId() {
        if ($("#username").val() == "") {
            alert("아이디를 입력하세요.");
            $("#username").focus();
            return;
        }
        const data = $('#form').serializeObject();
        var idRule = /^[a-z]+[a-z0-9]{1,11}$/g;
        if (!idRule.test(data.code)) {
            alert("아이디는 영문자로 또는 숫자 포함해서 2~12자로 입력해주세요.");
            $("#username").focus();
            return;
        }
        console.log('request data', data);
        $.ajax({
            url: '../api/auth/checkId',
            data: data,
            dataType: 'json',
            type: 'post',
            success: function(res) {
                console.log('/api/auth/checkId', res);
                if (!res.isExist) {
                    alert("사용 가능한 아이디입니다.");
                    isChecked = true;
                } else {
                    alert("이미 사용중인 아이디입니다.");
                }
            },
            error: function(xhr, status, error) {
                alert(xhr.responseJSON.message);
            }
        });
    }

    function resetCheckId() {
        isChecked = false;
    }
	</script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/swipper.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/map.daum.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</body>
</html>