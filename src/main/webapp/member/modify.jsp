<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>회원정보수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" />
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />  <!-- 회원가입 (temp.css 는 미사용)-->
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css" />
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css" /> 
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myPage.css" /> 
	   <style type="text/css">
  	.change{
  		background-color: bisque !important;
  	}
  	button.drop{
  		font-size:0.85em;
  		border:none;
  		background-color: transparent;
  		color: gray;
  	}
  	*{box-sizing: border-box;}
	nav ul{list-style:none;}
	nav ul li{
	display: inline-block;
	padding: 20px;
	margin; 0 20px;
	}
  </style>
</head>
<body class="is-preload">
	<%@include file="../layout/header.jsp" %>
	<div id="page-wrapper">
		<div class="tabs1">
			<a href="${pageContext.request.contextPath}/myPage">예매내역</a>
			<a href="${pageContext.request.contextPath}/member/modify" class="active">회원정보수정</a>
			<c:if test="${sessionScope.user.isadmin == 'Y' }">
				<a href="${pageContext.request.contextPath}/admin/page">관리자 페이지</a>
			</c:if>
		</div>
    <hr>
  	<div class="cont">
                 <form id="form">
                    <ul class="join-wrap">
                        <li>아이디</li>
                        <li>
                            <input class="id-input" type="text" value="${sessionScope.user.code }" disabled/>
                            <input name="code" type="hidden" value="${sessionScope.user.code }"/>
                        </li>
                        <li>이름</li>
                        <li><input id="name" name="name" type="text" value="${sessionScope.user.name}"/></li>
                    </ul>
                    <button type="button" class="join-btn" id="modify">저장</button>
                    <button class="join-btn drop" type="button" id="drop">회원 탈퇴</button>
                </form>
                    </div>
                    </div>
    
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/swipper.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/map.daum.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
			<script type="text/javascript">
             function modify() {
               
                  const data = $('#form').serializeObject();

                  if(data.name == "") {
                    alert("이름을 입력하세요.")
                    return;
                  }
                    console.log('modify',data);
                    $.ajax({
					url 	: '../api/modify',                 
                    data	: JSON.stringify(data),
                    dataType 	: 'text',
                    type 	 : 'post',
                    contentType: 'application/json',
                    	success : function(res){
                    		alert(res);
                    		location.href ='../myPage';
                    	},
                    	error : function(xhr){
                    		console.log(xhr);
                    	}
                    });
                    }
           function drop(){
        	   const res = prompt('탈퇴를 원하시면 \'회원탈퇴\'라고 입력해주세요.')
        	   if (res==='회원탈퇴')
        		   location.href='drop'
        		   else
        			   alert('패스워드가 일치하지 않습니다')
           }
           $("#modify").on("click", () => { modify(); }); 
           $("#drop").on("click", () => { drop(); }); 
           </script>
</body>
</html>
