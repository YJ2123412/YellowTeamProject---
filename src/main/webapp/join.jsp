<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<title>스타라이트 시네마</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />  <!-- 회원가입 (temp.css 는 미사용)-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css" /> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css?v=3" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/banner.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/movieCard.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/label.css">
    <script>
    /* sms.jsp 에서 인증하기 성공하면 메시지를 보낸것 window.opener.postMessage(~~~)을 받는 이벤트 입니다.  */
      window.addEventListener('message', (e) => {			//윈도우에서 메시지 수신이 있을 때
		  console.log('-->',e.data);
        if (e && e.data) {
          const res = JSON.parse(e.data);
          const data = res.data;
          if (res.successYn === 'Y') {
            $("#stage1").removeClass("active");
            $("#stage2").addClass("active");

        
          } else {
            alert(data.message);
            location.reload();
          }

          console.log(e);
        }
      }, false)

      function certPhone() {

        const data = $('#formTerms').serializeObject();
        
        if (true && !data.terms06) {
          alert("회원 통합 서비스에 동의해주세요.");
          return;
        }
        
        if (true && !data.terms05) {
          alert("개인정보 수집 및 이용 동의에 동의해주세요.");
          return;
        }
        
        if (false && !data.terms07) {
          alert("마케팅 정보 활용 동의에 동의해주세요.");
          return;
        }
        

        var adultYn = $('input:radio[name="adultYn"]:checked').val();
        if (!adultYn) {
          alert("14세 이상/미만 여부를 확인해주세요.")
          return;
        }

        if (adultYn === 'N') {
          $("#under14Popup").addClass("active");
        } else {
          window.open('auth/cert/sms?certType=JOIN&adultYn=Y', '본인 인증', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no')
        }
      }

      function certPhoneChild() {
        const checked = $("#adultAgree").prop("checked");
        if (!checked) {
          alert("보호자 개인정보 수집 및 이용에 동의해주세요.")
          return;
        }
        $('#under14Popup').removeClass('active');
        window.open('auth/cert/sms?certType=JOIN&adultYn=N', '본인 인증', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no')
      }

      var isChecked = false;

      function join() {
    	 
    	  
        const data = $('#form').serializeObject();

        var adultYn = $('input:radio[name="adultYn"]:checked').val();
     
        
        if(data.username == "") {
          alert("아이디를 입력하세요.");
          return;
        }

        if(!isChecked) {
          alert("아이디 중복확인을 해주세요.");
          return;
        }	//isChecked 가 참일때 중복검사했던 아이디와 현재 username이 같은지 비교 필요합니다.

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
          $('#password').focus();
          return;
        }

 	

           if(!data.age) {
          alert("나이를 입력하세요.")
        }else 
        	if(data.age < 1  || data.age > 99){
 		alert("알맞은 나이를 입력하세요")
        	return;
        }
		     

        if (!checkPassword(data.password)) {
          alert("비밀번호는 영문 대문자 또는 소문자,숫자, 특수문자를 포함 10-20자로 입력해주세요.");
          return;
        }

       
        if ($("#adsSms").prop("checked")) {
          data.smsAgree = 'Y';
        } else {
          data.smsAgree = 'N';
        }

        if ($("#adsKakao").prop("checked")) {
          data.kakaoAgree = 'Y';
        } else {
          data.kakaoAgree = 'N';
        }

        if ($("#adsEmail").prop("checked")) {
          data.emailAgree = 'Y';
        } else {
          data.emailAgree = 'N';
        }
        data.adultYn=undefined;
		data.channel=undefined;
		data.smsAgree=undefined;
		data.kakaoAgree=undefined;
		data.emailAgree=undefined;
        data.password2=undefined;
		console.log('join',data);
        $.ajax({
          url        : './api/auth/join',
          data       : JSON.stringify(data),
          dataType       : 'text',
          type       : 'post',
         contentType: 'application/json', 
          success : function(res){
            alert(res);
            location.href = "./login";
          },
          error : function(xhr){
            console.log(xhr);
          }
        });
      }

    

      function checkId() {
        if($("#username").val() == "") {
          alert("아이디를 입력하세요.");
          $("#username").focus();
          return;
        }
        // form 태그안의 모든 요소값을 자바스크립트 객체로 생성합니다.
        const data = $('#form').serializeObject();
        var idRule = /^[a-z]+[a-z0-9]{2,9}$/g;
        if(!idRule.test(data.code)){
            alert("아이디는  영어 소문자 또는 숫자 3~8자로 입력해주세요.");
            $("#username").focus();
            return;
        }
		console.log('request data',data);
		// 비동기 통신을 위한 jquerry (순수자바스크립트의 XMLHttpRequest 를 쉽게 사용하도록 합니다.)
        $.ajax({
          url        : './api/auth/checkId',
          data       : data,
          dataType: 'json',
          type       : 'post',
        /* json 으로 직렬화 하지 않고 보내기 */
        /*   contentType: 'application/json', */
          success : function(res){	//요청 성공하면 응답을 res 변수에 저장.
        	console.log('/api/auth/checkId',res) ;
        	if (!res.isExist) {
	            alert("사용 가능한 아이디입니다.");
	            isChecked = true;
        	}else {
        		alert("이미 사용중인 아이디입니다.");
        	}
          },
          error : function(xhr, status, error){
            alert(xhr.responseJSON.message);
          }
        });
      }

      function resetCheckId() {
        isChecked = false;
      }

      function onTermsChanged(e, must){
        if (must) {
          return;
        }

        $("#adsSms").attr('checked', e.checked);
        $("#adsKakao").attr('checked', e.checked);
        $("#adsEmail").attr('checked', e.checked);

        $("#adsSms").prop('checked', e.checked);
        $("#adsKakao").prop('checked', e.checked);
        $("#adsEmail").prop('checked', e.checked);

        let msg = e.checked ? '수신에 동의하였습니다. ' : '수신 동의를 해제하였습니다. ';
        msg = "[회원동의] 마케팅 정보  " + msg + getYyyyMmDdMmSsToString(new Date());
        alert(msg);
      }

      function allChanged(e) {
        $("input[name^='terms']").prop("checked", e.checked);
        $("#adsSms").prop('checked', e.checked);
        $("#adsKakao").prop('checked', e.checked);
        $("#adsEmail").prop('checked', e.checked);

        let msg = e.checked ? '수신에 동의하였습니다. ' : '수신 동의를 해제하였습니다. ';
        msg = "[회원동의] 마케팅 정보  " + msg + getYyyyMmDdMmSsToString(new Date());
        alert(msg);
      }

      function marketingChanged(e, id) {
        let msg = e.checked ? '수신에 동의하였습니다. ' : '수신 동의를 해제하였습니다. ';
        let type = '';
        if (id === "adsSms") {
          msg = "[회원동의] SMS " + msg + getYyyyMmDdMmSsToString(new Date());
          type = "SMS"
        } else if (id === "adsKakao") {
          msg = "[회원동의] 카카오 알림톡 " + msg + getYyyyMmDdMmSsToString(new Date());
          type = "카카오톡 알림톡"
        } else if (id === "adsEmail") {
          msg = "[회원동의] 이메일 " + msg + getYyyyMmDdMmSsToString(new Date());
          type = "E-mail"
        }

        alert(msg);

      }

    </script>
 </head>
<body class="is-preload">
<%@include file="../layout/header.jsp" %>
<div id="page-wrapper" style="margin-top: 150px;">
<hr>
<jsp:include page="joinagree.jsp"/>
<hr>
<hr>
<hr>
<hr>
<section id="cta" class="wrapper style3">
	<%@include file="../layout/footer.jsp" %>
	</section>
</div>
 
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/swipper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/map.daum.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<!-- 계정 : wonder , 패스워드 : thGH123!@4 -->
</body>
</html>
