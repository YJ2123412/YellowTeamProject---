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
		<link rel="stylesheet" href="../css/layout.css" />
		<link rel="stylesheet" href="../assets/css/myPage.css" />
	</head>
	<body class="is-preload">
		<div id="page-wrapper">


			<!-- Main -->
				<section class="wrapper style1">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-3 col-12-narrower">
								<div id="sidebar1">
								</div>
							</div>
							<div class="col-6 col-12-narrower imp-narrower">
								<div id="content">

									<!-- Content -->

										<article>
											<header>
												<h3 id="result">결제가 완료되었습니다</h3>
											</header>
										</article>

								</div>
							</div>
							<div class="col-3 col-12-narrower">
								<div id="sidebar2">

								</div>
							</div>
						</div>
					</div>
				</section>

				<%@ include file="../layout/footer.jsp" %>
				<div data-num="3" id="datanum"></div>
		</div>

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
			/* location.href='../invalid.html' */
		}) 
	</script>
	</body>
</html>