/**
 * 
 */
function tossPayInit() {
	// 토스페이먼츠 회원가입하기 전이라면, 아래 문서용 테스트 키를 사용하세요. 문서용 테스트 키는 _docs_가 포함되어 있어요.
	// 토스페이먼츠에 회원가입했다면, 개발자센터에서 내 테스트 상점 키를 확인하세요.
	// 로그인한 상태라면, 문서에 있는 클라이언트 키, 시크릿 키가 내 테스트 키로 바뀌어요.
	const clientKey = 'test_ck_GjLJoQ1aVZq4QoP0xNYA3w6KYe2R'

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
    const paymentMethodWidget = paymentWidget.renderPaymentMethods(
      "#payment-method", 
      { value: Number(obj.price) },
      // 렌더링하고 싶은 결제 UI의 variantKey
      // 결제 수단 및 스타일이 다른 멀티 UI를 직접 만들고 싶다면 계약이 필요해요.
      // https://docs.tosspayments.com/guides/payment-widget/admin#멀티-결제-ui
      { variantKey: "DEFAULT" } 
    )
    // ------  이용약관 UI 렌더링 ------
    // 이용약관 UI를 렌더링할 위치를 지정합니다. `#agreement`와 같은 CSS 선택자를 추가하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자-옵션
    paymentWidget.renderAgreement(
      '#agreement',
      { variantKey: "AGREEMENT" } // 기본 이용약관 UI 렌더링
    )
   console.log("obj :",obj.price)
   paymentMethodWidget.updateAmount(Number(obj.price))
   const selectedPaymentMethod = paymentMethodWidget.getSelectedPaymentMethod()
      
    // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
    // 더 많은 결제 정보 파라미터는 결제위젯 SDK에서 확인하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
    const payObj = {
        orderId: obj.bcode +'_' + orderid,            
        orderName: obj.title,                 
        successUrl: window.location.origin + "/DemoProject/pay/success",  
        failUrl: window.location.origin + "/DemoProject/pay/fail",        
        customerName: obj.saleuser
    }
    console.log(payObj)
    button.addEventListener("click", function () {
      paymentWidget.requestPayment(payObj)
    })
}
