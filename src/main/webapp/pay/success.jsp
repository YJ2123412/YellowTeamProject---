<%@page import="mybatis.vo.ReserveList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="mybatis.vo.Member"%>
<%@page import="mybatis.dao.ReserveDao"%>
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
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="../assets/css/myPage.css" />
	</head>
	<div>
		<img alt="logo" src="../assets/img/logo2.png">	
	</div>
	
	<h2 style="text-align: center; margin-top: 30px;">결제가 완료되었습니다. 예매 내역으로 이동합니다.</h2>
		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.dropotron.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<!-- 비동기 http 통신 axios api-->
			<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script type="text/javascript">
		const responseData='${payment}'
		const payment = JSON.parse(responseData)
		const id = '${member_code}'
		console.dir(payment)
		console.log(id)
		async function requestPaymentSave(payReq){
			const result = await axios.post('../api/pay',payReq)
			console.log(result)
			return result.data
		}
		
		const payReq = {orderid: payment.orderId , 
						amount: payment.totalAmount, 
						id: '${member_code}', 
						paydate:payment.approvedAt ,
						paytype : payment.card.cardType+' '+payment.method, 
						paymentkey:payment.paymentKey
		}

	      requestPaymentSave(payReq)
	       .then(result => {
	          location.href='../myPage';
	      })
		.catch(e=> {
			console.error(e.response);
			location.href='../invalid.html' 
		}) 
	</script>
	</body>
</html>