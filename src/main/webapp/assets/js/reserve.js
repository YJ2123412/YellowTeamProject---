document.querySelector('#body').addEventListener( 'load' , onLoaderFunc);

function onLoaderFunc(){
	$("#seatsBlock :checkbox").prop('disabled', true);
	$(".wrap2").click(function() {
	    var SeatsCount = document.querySelector("#Numseats").value;
	    if (SeatsCount.length === 0) {
	        alert("예매 인원을 먼저 선택해주세요");
	    }
	});
}


function select() {
    var SeatsCount = document.querySelector("#Numseats").value;
    const theater = document.querySelector('select[name="cinemas"]').value;
    console.log(SeatsCount);
    
	if(theater.length == 0){
		alert("극장을 선택해주세요");
		} else {
			if (SeatsCount.length == 0) {
		        alert("예매 인원을 선택해주세요");
		    } else if (SeatsCount> 100 || SeatsCount==0){
				alert("숫자 1~ 100 이내로 선택해주세요");
			} else 
				{alert("예매할 좌석을 선택해주세요");
		        $("#seatsBlock :checkbox").prop('disabled', false);}
    		} 		
	}


document.querySelector('#complete').addEventListener('click', complete);

function complete() {
    if ($("input:checked").length == ($("#Numseats").val())){
       
       var allSeatsVals = [];
       $('#seatsBlock :checked').each(function() {
       allSeatsVals.push($(this).val());
     	});
       console.log(allSeatsVals)
       const message = allSeatsVals + ' 좌석을 선택하시겠습니까?';
       const yn = confirm(message)
        if (yn) {
            $('#seatsAll').val(allSeatsVals);
		    var numSeats = parseInt(document.getElementById("Numseats").value);
		    var price = 10000; // 좌석당 가격
		    var total = numSeats * price;
		    console.log("numSeats",numSeats)
		    console.log("total",total)
		    /*document.getElementById("totalPrice").innerText = formatPrice(total) + "원";*/
		    document.getElementById("totalPrice2").innerText = total;
		    document.getElementById("numSeats").innerText = numSeats;
		    const obj ={}
		    obj.mcode =document.querySelector("#movie_code").value
			obj.title =document.querySelector("#mname").value
			obj.id =document.querySelector("#member_code").value
			obj.price =total;
		    document.querySelector("#movie_code").innerHTML=obj.mcode
			document.querySelector(".modal-body #title").innerHTML=obj.title
			document.querySelector("#member_code").innerHTML=obj.id
			document.querySelector(".modal-body #price").innerHTML = Number(obj.price).toLocaleString("ko-KR")
			console.log(obj);
            json()
            
        } else {
            alert("취소되었습니다.");
        }
    }else {
      alert(($("#Numseats").val()) + "개의 좌석을 선택해주세요")
    }
    
}
function formatPrice(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function json(){
	var member_code = document.querySelector("#member_code").value 
	var theater = document.querySelector("#cinemas").value
	var movie_code = document.querySelector("#movie_code").value
	var schedule = document.querySelector("#schedule").value
	var seat = document.querySelector("#seatsAll").value
	var price = document.querySelector("#price").value
	
	var data = {
	    member_code: member_code,
	    theater: theater,
	    movie_code: movie_code,
	    scheduleDate: schedule,
	    seat: seat,
	    price:price
	};
	console.log(data);
	// AJAX 요청
	var xhr = new XMLHttpRequest();
	/*var paramVal = "/movie/reserve";
	var target="URL";
	xhr.open("POST",target+"?paramName="+paramVal)*/
	xhr.open("POST", "reserve", true);
	xhr.setRequestHeader("Content-Type", "application/json");
	 
	xhr.send(JSON.stringify(data));
	xhr.onreadystatechange = function () {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	        // 서버로부터 응답을 받았을 때 실행할 코드
	        var response = xhr.responseText;
	        console.log(response);
	        pay();
    }
};
}

   
   function tossPayInit() {
	    var numSeats = parseInt(document.getElementById("Numseats").value);
		var price = 10000; // 좌석당 가격
		var total = numSeats * price;
	    const obj ={}
	    obj.mcode =document.querySelector("#movie_code").value
		obj.title =document.querySelector("#mname").value
		obj.id = document.querySelector("#member_code").value
		obj.price =total
	// 토스페이먼츠 회원가입하기 전이라면, 아래 문서용 테스트 키를 사용하세요. 문서용 테스트 키는 _docs_가 포함되어 있어요.
	// 토스페이먼츠에 회원가입했다면, 개발자센터에서 내 테스트 상점 키를 확인하세요.
	// 로그인한 상태라면, 문서에 있는 클라이언트 키, 시크릿 키가 내 테스트 키로 바뀌어요.
	const clientKey = 'test_ck_yL0qZ4G1VO5nAe7JXkbO8oWb2MQY'

   const customerKey = crypto.randomUUID()  //"VUEWF1yYWn17zOh3L6Wot" // 내 상점에서 고객을 구분하기 위해 발급한 고객의 고유 ID(임의값)
//    const coupon = document.getElementById("coupon-box")
    const button = document.getElementById("payment-button")
    // ------  결제위젯 초기화 ------ 
    // 비회원 결제에는 customerKey 대신 ANONYMOUS를 사용하세요.
    const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
    // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제
    // ------  결제 UI 렌더링 ------ 
    // 결제 UI를 렌더링할 위치를 지정합니다. `#payment-method`와 같은 CSS 선택자와 결제 금액 객체를 추가하세요.
    // DOM이 생성된 이후에 렌더링 메서드를 호출하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods선택자-결제-금액-옵션
    // ------  이용약관 UI 렌더링 ------
    // 이용약관 UI를 렌더링할 위치를 지정합니다. `#agreement`와 같은 CSS 선택자를 추가하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자-옵션
    paymentWidget.renderAgreement(
      '#agreement',
      { variantKey: "AGREEMENT" } // 기본 이용약관 UI 렌더링
    )
   console.log("obj :",obj.price)
     const paymentMethodWidget = paymentWidget.renderPaymentMethods(
      "#payment-method", 
      { value: Number(obj.price) },
         { variantKey: "DEFAULT" } 
    )
    let today = new Date();   
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
    var hours = ('0' + today.getHours()).slice(-2); 
	var minutes = ('0' + today.getMinutes()).slice(-2);
	var dateString = month+day+hours+ minutes;
    // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
    // 더 많은 결제 정보 파라미터는 결제위젯 SDK에서 확인하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
    const payObj = {
        orderId: obj.mcode +'_' +dateString,
        orderName: obj.title,                 
        successUrl: window.location.origin + "/YellowTeamProject/pay/success",  
        failUrl: window.location.origin + "/YellowTeamProject/pay/fail",        
        customerName: obj.id
    }
    console.log(payObj)
    button.addEventListener("click", function () {
      paymentWidget.requestPayment(payObj)
    })
  
}

function pay(){
		const obj ={}
		const modal = new bootstrap.Modal(document.querySelector("#modal"))  
		const aTag = document.querySelector('a[data-all]');
		const datas = aTag.getAttribute('data-all');
		const arr = datas.split(",");
		console.log("datas{}",datas)
		obj.mcode = arr[0];
		obj.title = arr[1];
		obj.id = arr[2];
		obj.price = arr[3];
		obj.mcode = document.querySelector("#movie_code").innerHTML
		obj.title  = document.querySelector("#mname").innerHTML
		obj.id = document.querySelector("#member_code").innerHTML
		obj.price = document.querySelector("#totalPrice2").innerHTML 
		modal.show();
		tossPayInit();
		
   }
   
   
   


