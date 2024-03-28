<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타라이트 시네마</title>
<meta charset="UTF-8">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="card">
<div class = "card-header" id="messageBot">
<h3><em>본인인증</em></h3>
</div>
		<div class = "form-group card-body">
				<div class ="form-text" id="idMessage">
				<span class="text-sm">::</span>
				</div>
				<div class ="input-group mb-3">
				<span class="input-group-text col-4">휴대폰 번호</span>
				<input class ="form-control" id="id" placeholder="숫자만 입력하세요.">
				</div>
			<div class="input-group mb-3">
				<span class ="input-group-text col-4">인증번호</span>
				<input class = "form-control" id="authnum">
			</div>
			<div class = "buttonGroup">
			<button id="confirm" class="btn btn-primary">인증번호 확인</button><br>
			</div>
		</div>		
		<div>인증과정 단계만 추가한 테스트용-확인버튼 클릭만 하세요.</div>
</div>
<script>
	document.querySelector('#confirm').addEventListener('click',()=>{
		var message = {successYn : 'Y'};
		message = JSON.stringify(message)
		var targetOrigin = window.location.origin + '/YellowTeamProject/join';
		window.opener.postMessage(message,targetOrigin);
		self.close();
	})
</script>
</body>
</html>