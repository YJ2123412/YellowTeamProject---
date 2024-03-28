<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>스타라이트 시네마 회원가입</title>
</head>
<body>
<div class="join">
       <div id="chkPop" class="popup">
        <div class="pop-wrap">
            <div class="pop-title">
                <h6></h6>
                <button class="close" type="button" onclick="$('#chkPop').removeClass('active');"></button>
            </div>
            <div class="pop-cont"></div>
        </div>
    	</div>
    	<div class="con center">
        <ul class="join-title">
            <li>
            	<hr>
                <h6>회원가입</h6>
                <p>영화와 함께할 당신을 환영합니다.</p>
            </li>
        </ul>
        <div class="tab-container">
            <div class="cont active" id="stage1">
                <div class="join-check02">
                    <input type="radio" name="adultYn" id="chk01" value="N"><label for="chk01">만 14세 미만입니다.</label>
                    <input type="radio" name="adultYn" id="chk02" value="Y"><label for="chk02">만 14세 이상입니다.</label>
                </div>
                <form id="formTerms">
                <ul class="join-check01">
                    <li>약관동의</li>
                    <li>
                        <input type="checkbox" id="all" name="all" onchange="allChanged(this);"><label for="all"><span>모두 동의</span></label>
                    </li>
                    
                        <li>
                            <input type="checkbox" name="terms06" id="terms06" onchange="onTermsChanged(this, true);">
                            <label for="terms06"><span>스타라이트 시네마 통합 서비스(필수)</span></label><a href="#" onclick="$('#06').addClass('active');">(상세보기)</a>
                            
                                
                            <div id="06" class="popup">
                                <div class="pop-wrap">
                                    <div class="pop-title">
                                        <h6>스타라이트 시네마 통합 서비스</h6>
                                        <button class="close" type="button" onclick="$('#06').removeClass('active');"></button>
                                    </div>
                                    <div class="pop-cont">
                                            <p style="font-size: 16px; font-weight: 500;">스타라이트 시네마 통합 서비스</p><br>
        <p style="font-size: 14px; font-weight: 500;">제 1 조 (목적)</p>
        본 약관은 스타라이트 시네마가 통합 서비스 회원(이하 "회원")에게 다양한 서비스를 제공하고, 고객서비스 증진을 도모함에 있어 필요한 제반 사항을 정하는데 그 목적이 있습니다.<br>
        <br><br>
        <p style="font-size: 14px; font-weight: 500;">제 2 조 (용어의 정의)</p>
        1) "스타라이트 시네마 통합 서비스"란 통합 서비스(웹, 앱) 가입자에게 제공하는 고객관리 프로그램으로서 커뮤니티 서비스를 제공하는 경우 각종 혜택을 받거나 이벤트에 참여할 수 있도록 하는 서비스를 말합니다. <br>
        2) "회원"이란 스타라이트 시네마가 정한 기준 및 절차에 따라 가입을 완료하고 통합 서비스를 이용할 수 있는 권한을 획득한 고객을 말합니다. 단, 회원자격은 제 3 조 이하에서 규정합니다. <br>
        3) "제휴가맹점"이란 스타라이트 시네마와 계약 또는 협약을 통해 "스타라이트 시네마 통합 서비스"를 제공하는 자를 말합니다. <br>
        4) "적립포인트"란 회원이 스타라이트 시네마에서 진행하는 이벤트에 참여하면서 고지한 기준에 따라 부여되는 포인트를 말합니다. <br>
        5) "잔여포인트"란 회원이 적법하게 획득한 포인트 중 이미 사용한 포인트를 제외한 유효기간 내의 포인트를 말합니다. <br>
        <br>
        <br>
        <p style="font-size: 14px; font-weight: 500;">제 3 조 (회원가입)</p>
        1) 회원이 될 수 있는 자격은 다음 각 호와 같습니다.<br>
        &nbsp;- 스타라이트 시네마 통합 서비스에 가입한 명의자 본인<br>
        &nbsp;- 만 14세 미만의 가입자의 경우 법정 대리인의 인증 후, 회원이 될 수 있습니다.<br>
        &nbsp;- 법인은 가입할 수 없습니다.<br>
        2) 회원으로 가입하고자 하는 고객은 웹 홈페이지의 회원가입 양식에 정해진 인증절차 및 가입양식에 맞춰 신청서를 작성 후 본 약관과 개인정보 수집 및 이용 동의 약관에 동의함으로써 회원가입을 신청할 수 있습니다.<br>
        3) 고객으로부터 회원가입신청이 있는 경우 스타라이트 시네마는 자체 기준에 따른 심사를 거친 뒤 기준을 만족하는 회원가입신청 고객께 "스타라이트 시네마 회원 바코드"를 발급하여 드립니다.<br>
        4) 회원은 회원자격을 타인에게 양도하거나 대여 또는 담보의 목적으로 이용할 수 없습니다.<br>
        <br>
        <br>
        <p style="font-size: 14px; font-weight: 500;">제 4 조 (스타라이트 시네마 회원 바코드의 이용 등)</p>
        1) 스타라이트 시네마 회원 바코드는 회원 본인에 한하여 사용이 가능하며, 타인에게 대여하거나 양도 또는 담보의 목적으로 이용할 수 없습니다.<br>
        2) 회원은 주소, 전화번호 등 개인정보가 변경된 경우 웹 홈페이지에서 즉시 변경하여야 하며 회원이 통지하지 않음으로써 발생되는 모든 결과는 회원의 책임입니다.<br>
        3) 스타라이트 시네마 통합 서비스 이용에 따라 발생될 수 있는 제세공과는 회원이 부담합니다.<br>
        <br>
        <br>
        <p style="font-size: 14px; font-weight: 500;">제 5 조 (스타라이트 시네마 통합 서비스 및 제휴가맹점)</p>
        1) 스타라이트 시네마 통합 서비스와 제휴가맹점 현황 및 각종 이벤트 행사는 웹 홈페이지에서 확인이 가능합니다.<br>
        2) 회원이 제휴가맹점에서 스타라이트 시네마 통합 서비스를 이용하거나, 이벤트 행사에 참가하고자 하는 때에는 스타라이트 시네마 회원 바코드를 제시하여야 하며, 회원 본인 여부 확인을 위하여 제휴가맹점이나 이벤트 진행자가 신분증의 제시 등을 요구할 수 있습니다.<br>
        <br>
        <br>
        <p style="font-size: 14px; font-weight: 500;">제 6 조 (탈퇴 및 환불)</p>
        1) 스타라이트 시네마 통합 서비스를 탈퇴하고자 할 때는 웹 홈페이지에서 신청하면 즉시 처리됩니다.<br>
        2) 스타라이트 시네마 회원을 탈퇴하면 적립포인트는 소멸됩니다.<br>

        <br>
        <br>
        <p style="font-size: 14px; font-weight: 500;">제 7 조 (스타라이트 시네마 통합 서비스 이용 제한 등)</p>
        1) 회원이 다음 각 호에 해당할 경우 회원가입 또는 스타라이트 시네마 통합 서비스 이용이 제한됩니다.<br>
        &nbsp;- 회원이 스스로 회원탈퇴 의사를 밝힌 경우<br>
        &nbsp;- 타인의 명의를 이용한 회원가입으로 인하여 명의자와 다툼이 발생한 경우 명의를 이용한 해당 회원은 이와 관련한 모든 문제에 대하여 책임을 부담하며, 해당 회원의 회원자격 및 스타라이트 시네마 통합 서비스 이용을 직권으로 정지 또는 박탈하는 등의 제한을 가할 수 있습니다.<br>
        <br>
        <br>
        <p style="font-size: 14px; font-weight: 500;">제 8 조 (개인정보보호)</p>
        1) 구단은 회원의 가입신청 또는 스타라이트 시네마 통합 서비스 제공에 필요한 회원의 개인정보(가입신청서에 기재된 가입신청자의 정보 및 커피24 북카페 통합 서비스 이용에 관한 정보 등)를 수집, 이용할 수 있으며, 이를 분석하여 보다 향상된 서비스를 제공하기 위한 마케팅 활동에 사용하거나 스타라이트 시네마 통합 서비스 관련 업무의 위탁업체, 제휴가맹점 등 제 3자에게 제공할 수 있습니다.<br>
        2) 구단은 회원의 개인정보를 수집, 이용, 위탁하거나 제 3자에게 제공하고자 하는 회원으로부터 개인정보의 수집, 이용, 위탁, 및 제공에 관한 동의를 얻어야 합니다.<br>
        3) 회원의 개인정보가 제공되는 스타라이트 시네마 통합 서비스 관련 업무의 위탁업체 및 제휴가맹점 등은 커피24 북카페 웹 홈페이지에서 확인이 가능합니다.<br>
        <br>
        <br>
        <p style="font-size: 14px; font-weight: 500;">제 9 조 (SMS, 카카오 알림톡, e-mail 수신 동의 등)</p>
        스타라이트 시네마 통합 서비스는 제공 및 이용과 관련된 정보 제공을 위한 SMS(LMS, MMS 포함), 카카오 알림톡, e-mail 수신에 동의한 회원에게 해당 채널을 통해 스타라이트 시네마 통합 서비스와 관련된 각종 정보를 제공할 수 있습니다.<br>
        <br>
        <br>
        <p style="font-size: 14px; font-weight: 500;">제 10 조 (약관 개정)</p>
        1) 스타라이트 시네마가 본 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 구단 홈페이지에 그 적용일자 30일 전부터 적용일자 전일까지 공지합니다. 단, 회원에게 불리한 약관의 개정의 경우에는 공지 외에 서비스 내 e-mail, 로그인 시 팝업창 등의 전자적 수단이나 SMS/카카오 알림톡 발송 등을 통해 따로 명확히 통지하도록 합니다.<br>
        3) 회원이 개정약관에 동의하지 않는 경우 스타라이트 시네마 개정약관의 내용을 적용할 수 없으며, 이 경우 회원은 회원 탈퇴할 수 있습니다.<br>
        4) 회원은 전항에 따른 스타라이트 시네마 통합 서비스 중단 또는 종료로 손해를 입은 경우 서면으로 손해액과, 손해액의 내용 및 산출근거 등을 기재하고 입증자료를 첨부하여 구단에 이에 대한 배상을 청구할 수 있습니다.<br>
        <br>
        <br>
        <p style="font-size: 14px; font-weight: 500;">제 11 조 (본 약관에서 정하지 아니한 사항)</p>
        본 약관에서 정하지 아니한 사항과 본 약관의 해석, 적용 및 이행에 관하여는 관계 법령 및 상관례에 따릅니다.<br>
        <br>
        <br>
        <p style="font-size: 14px; font-weight: 500;">제 12 조 (분쟁의 해결 및 관할법원)</p>
        스타라이트 시네마 통합 서비스와 관련하여 회원과 구단간에 분쟁이 발생하는 경우 당사자 간의 성실한 상호 협의에 따라 해결함을 원칙으로 합니다. 다만, 협의가 이루어지지 아니한 경우에는 양 당사자는 민사소송상의 관할법원에 소송을 제기할 수 있습니다.<br>
                                    </div>
                                </div>
                            </div>

                        </li>
                    
                        <li>
                            <input type="checkbox" name="terms05" id="terms05" onchange="onTermsChanged(this, true);">
                            <label for="terms05"><span>개인정보 수집 및 이용 동의(필수)</span></label><a href="#" onclick="$('#05').addClass('active');">(상세보기)</a>
                            
                                
                            <div id="05" class="popup">
                                <div class="pop-wrap">
                                    <div class="pop-title">
                                        <h6>개인정보 수집 및 이용 동의</h6>
                                        <button class="close" type="button" onclick="$('#05').removeClass('active');"></button>
                                    </div>
                                    <div class="pop-cont">
                                            <p style="font-size: 16px; font-weight: 500;">개인정보 수집 및 이용 동의</p><br>

        '스타라이트 시네마' (이하 '회사')는 회원의 개인정보를 중요시하며, 「개인정보보호법」등 회사가 준수하여야 할 관련 법령상의 개인정보보호 규정을 준수하고 있습니다. 회사는 개인정보처리방침을 통하여 회원님께서 제공하시는 개인 정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 회사는 개인정보처리방침을 개정하는 경우 모바일앱 공지사항(또는 개별공지)을 통하여 사전 공지할 것입니다.
        <br><br>
        <p style="font-weight: 500;">1. 개인정보의 수집 및 이용목적</p>
        회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
        - 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 콘텐츠 제공, 결제, 환불, 구매 상품 배송, 본인인증, 연령확인, 만 14세 미만 아동의 개인정보 수집 시 법정 대리인 동의여부 및 본인 확인, 고객상담 등 민원처리<br>
        - 포인트 적립 및 사용 서비스 제공<br>
        - 홍보성 정보 전달, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 분석<br>
        <br>
        <p style="font-weight: 500;">2. 개인정보의 수집 및 이용항목</p>
        회사는 회원가입, 상담, 서비스 제공 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br>

        <table cellpadding="0" cellspacing="0" style="width:100%;border-top:1px solid #eee;">
            <tr>
                <th style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;font-weight: 500">구분</th>
                <th style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;font-weight: 500">수집방법</th>
                <th colspan="2" style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;font-weight: 500">수집항목</th>
            </tr>
            <tr>
                <td rowspan="4" style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">회원가입</td>
                <td rowspan="2" style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">회원등록 시</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">필수</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">ID, PW, 이름, 생년월일, 성별, 전화번호, 이메일, 선호 구단, 본인인증정보</td>
            </tr>
            <tr>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">선택</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">주소</td>
            </tr>
            <tr>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">법정 대리인 본인인증 시</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">필수</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">(14세 미만 회원의 경우)<br>
                    법정대리인 인증 정보: 성명, 생년월일, 성별, 내외국인 정보, 휴대폰 번호, 동일인식별정보(CI), 중복가입확인정보(DI)</td>
            </tr>
            <tr>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">본인 인증 시</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">필수</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">(14세 이상 회원의 경우) <br>
                    본인인증 정보: 성명, 생년월일, 성별, 내외국인 정보, 휴대폰 번호, 동일인식별정보(CI), 중복가입확인정보(DI)</td>
            </tr>
            <tr>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">환불</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">환불 시</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">필수</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">은행명, 예금주명, 환불계좌번호</td>
            </tr>
            <tr>
                <td rowspan="2" style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">배송지 추가</td>
                <td rowspan="2" style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">마이페이지 입력, 상품 구매 시</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">필수</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">수신자명, 수신자 연락처, 배송지 주소</td>
            </tr>
            <tr>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">선택</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">배송지명, 추가 연락처, 배송 메모</td>
            </tr>
            <tr>
                <td rowspan="4" style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">구매</td>
                <td rowspan="2" style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">상품 구매 시</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">필수</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">수신자명, 수신자 연락처, 배송지 주소</td>
            </tr>
            <tr>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">선택</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">배송지명, 추가 연락처, 배송 메모</td>
            </tr>
            <tr>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">선택</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">이메일</td>
            </tr>
            <tr>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">홈페이지 이용</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">자동생성</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">-</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">멤버십 서비스 이용기록, 티켓 내역, 상품 내역, 포인트 내역, 쿠폰 내역, 쿠키 정보</td>
            </tr>
            <tr>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">상담</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">상담 진행 시</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">-</td>
                <td style="border-right:1px solid #eee;padding:10px;border-bottom: 1px solid #eee;">이용자 상담을 통해 생성되는 문의/상담 정보</td>
            </tr>
        </table>

        <br>
        <p style="font-weight: 500;">3. 개인정보의 보유 및 이용기간</p>
        <p style="font-size: 16px; font-weight: 500; line-height: 2em;">
            이용자의 개인정보는 수집 목적 달성 시 즉시 파기합니다. <br>
            (단, 회사는 이용자의 탈퇴 요청 시 즉시 탈퇴 처리하며, 계정도용 방지를 위해 탈퇴 후 15일간 개인정보를 보유합니다.)
            또한 관계 법령에 의해 일정 기간 동안 회원정보를 보유합니다. 법령상 의무이행을 위한 기간은 아래와 같습니다.<br>
            - 표시/광고에 관한 기록 : 6개월 (전자상거래 등에서의 소비자보호에 관한 법률)<br>
            - 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래 등에서의 소비자보호에 관한 법률)<br>
            - 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래 등에서의 소비자보호에 관한 법률)<br>
            - 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래 등에서의 소비자보호에 관한 법률)<br>
            - 웹사이트 방문에 관한 기록 : 3개월 (통신비밀보호법)</p>
        <br>
        고객님께서는 이와 같은 개인정보 수집 및 이용에 동의하지 않으실 수 있습니다. 단, 동의 거부 시 회원가입이 제한됩니다.
                                    </div>
                                </div>
                            </div>

                        </li>
                    
                        <li>
                            <input type="checkbox" name="terms07" id="terms07" onchange="onTermsChanged(this, false);">
                            <label for="terms07"><span>마케팅 정보 활용 동의(선택)</span></label><a href="#" onclick="$('#07').addClass('active');">(상세보기)</a>
                            
                                <ul>
                                    <li>
                                        <input type="checkbox" id="adsSms" name="adsSms" onchange="marketingChanged(this, 'adsSms');"><label for="adsSms"><span>SMS</span></label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="adsKakao" name="adsKakao" onchange="marketingChanged(this, 'adsKakao');"><label for="adsKakao"><span>카카오톡 알림톡</span></label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="adsEmail" name="adsEmail" onchange="marketingChanged(this, 'adsEmail');"><label for="adsEmail"><span>E-mail</span></label>
                                    </li>
                                </ul>
                            
                                
                            <div id="07" class="popup">
                                <div class="pop-wrap">
                                    <div class="pop-title">
                                        <h6>마케팅 정보 활용 동의</h6>
                                        <button class="close" type="button" onclick="$('#07').removeClass('active');"></button>
                                    </div>
                                    <div class="pop-cont">
                                             <p style="font-size: 16px; font-weight: 500;">마케팅 정보 활용 동의</p><br>

        · SMS 수신 동의(선택) <br>
        · 카카오 알림톡 수신 동의(선택) <br>
        · e-mail 수신 동의(선택) <br><br>

       스타라이트 시네마는 마케팅 정보 안내를 위한 광고성 정보 수신에 동의하신 분을 대상으로 서비스에 대한 새로운 소식이나 이벤트 정보를 전달하고자 합니다.
       귀하는 스타라이트 시네마가 발송하는 광고성 정보를 수신할 수 있으며, 광고성 정보에 기재되어 있는 수신거부 안내방법에 따라 수신을 거부하실 수 있습니다.
                                    </div>
                                </div>
                            </div>
                        </li>
                </ul>
                </form>
                <button class="join-gor" type="button" onclick="certPhone()">본인인증</button>

                <div class="popup" id="under14Popup">
                    <div class="pop-wrap">
                        <div class="pop-title">
                            <h6>보호자(법정대리인) 개인정보 수집 및 이용 동의</h6>
                            <button class="close" type="button" onclick="$('#under14Popup').removeClass('active');"></button>
                        </div>
                        <div class="pop-cont join-pop">
                            <p>
                                1 . 개인정보 수집 및 이용 목적 : 만 14세 미만 아동의 개인정보 수집에 대한 법정대리인 동의 확인<br>
                                2. 개인정보 수집 및 이용 항목 : 법정 대리인 본인인증 정보(성명, 생년월일, 성별, 내외국인 정보, 휴대전화 번호, 동일인식별정보(CI), 중복가입확인정보(DI)<br>
                                <span class="font700">3. 개인정보 보유 및 이용 기간 : 회원 탈퇴 시 파기</span><br>
                                4. 귀하는 개인정보 수집 및 이용에 동의하지 않으실 수 있으며, 동의 거부시에는 만 14세 미만 아동의 회원가입이 이뤄질 수 없습니다.
                            </p>
                            <div class="join-check03">
                                <input type="checkbox" id="adultAgree"><label for="adultAgree"><span>개인정보 수집 및 이용동의(필수)</span></label>
                            </div>
                        </div>
                        <div class="pop-btn">
                            <button class="gray" onclick="$('#under14Popup').removeClass('active');">취소</button>
                            <button type="button" onclick="certPhoneChild();">확인</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="cont" id="stage2">
                <form id="form">
                    <div>
                    	<!-- PASS 본인 인증시에만 사용 -->
                       <!--  <input type="hidden" id="responseNumber" name="responseNumber"> -->
                    </div>
                    <ul class="join-wrap">
                        <li>아이디 <label>(영 소문자 혹은 숫자 3~8개까지 가능합니다.)</label></li>
                        <li>
                            <input class="id-input" id="username" name="code" type="text" onchange="resetCheckId();" placeholder="아이디를 입력해 주세요."/>
                            <button type="button" onclick="checkId();">중복확인</button>
                            <hr>
                        </li>
                        <li>비밀번호 <label>(영문 대/소문자,숫자, 특수문자를 포함  10-20자로 입력해주세요.)</label>-<label>사용가능 특수문자 : !@#$%^&* </label></li>
                        <li><input name="password" type="password" placeholder="비밀번호를 입력해 주세요."/></li>
                        <li>비밀번호 확인</li>
                        <li><input name="password2" type="password" placeholder="비밀번호를 다시 한번 입력해 주세요."/></li>
                        <li>이름</li>
                        <li><input id="name" name="name" type="text" placeholder="이름" /></li>
                        <li>나이</li>
                        <li id="age"><input id="age" name="age" type="number" placeholder="1~99세" min="1" max="100" /></li>
                 
                    </ul>
                    <div class="hidden">
                        <input id="adultYn" name="adultYn" type="hidden"/>
                        <input id="channel" name="channel" type="hidden"/>
                       
                    </div>
                    <button type="button" class="join-btn" onclick="join()">회원가입</button>
                </form>
            </div>
            <hr>
            <div>
            🤩 <a href="login">계정이 있으시면 로그인 하세요.</a>
        	</div>
        </div>
    </div>
    </div>
</body>
</html>