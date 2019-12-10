<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko" class=" js no-touch">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">  
	<meta name="viewport" content="width=1200, maximum-scale=1.5, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    
	<%@ include file="/WEB-INF/jsp/include/login/joincss.jsp" %>
	<%-- 
    <link href="<c:url value="/resources/css/shopping/login/join.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/shopping/login/board.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/shopping/login/login.css" />" rel="stylesheet"> --%>
	
	<%-- <script src="<c:url value='/resources/js/login/jquery-1.11.1.min.js' />"></script>
    <script src="<c:url value='/resources/js/login/ch-plugin-web.js' />"></script> --%>
    
    <script type="text/javascript" async="" src="https://cdn.channel.io/plugin/ch-plugin-web.js" charset="UTF-8"></script>
    <title>(주)펫미</title>
</head>
  <body cz-shortcut-listen="true">
    <div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
	
    <div id="contents" class="sub-contents">
		<div style="position:relative; top: 0; height: 20px; background-color: #550;"></div>
		<div class="sub-visual">
              <div class="wrap">
                  <div class="sub-visual-title wowrap" >
                      <h2 class="wow fadeInUp tit" data-wow-delay="0s" style="visibility: visible; animation-delay: 0s; animation-name: fadeInUp;">회원가입</h2>
                      <p class="wow fadeInUp txt" data-wow-delay="0.25s" style="visibility: visible; animation-delay: 0.25s; animation-name: fadeInUp;">삶의 소중한 인연, 펫미가 만남부터 동행하겠습니다.</p>
                  </div>		
              </div>
              <div class="sub-visual-bg" style="background-image:url(../images/sub/member.jpg)"></div>
          </div>    
          <!--// 2019-02-27 banghg 메뉴추가 -->      
          <div class="sub-con sub-pad join_page _step1">
                  <div class="sub-title">
                    <p class="desc">회원가입</p>
                    <p class="title_bold">CREATE YOUT ACCOUNT</p>
                  </div>
          
          <div class="wrapper">
            <form name="theForm" method="post" action="join02.jsp">
            <div class="join_step">이용약관동의</div>
            <div class="row">
              <div class="col-lg-6">
                <p class="tit_36">이용약관</p>
                <div class="join scroll-con-y mCustomScrollbar _mCS_1">
                <div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0">
                <div id="mCSB_1_container" class="mCSB_container" style="position:relative; top:0; left:0;" dir="ltr">
                <ul class="term_wrap">
              <!-- 이용약관 -->
              <li>
                  <h3>제1조(목적)</h3>
                  이 약관은 (주)펫미몰 회사(전자거래 사업자)가 운영하는 (주)펫미몰 사이버 몰(이하 "몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다. 
                  <br>※ 「PC통신등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는한 이 약관을 준용합니다」 	
              </li>
              <li>
                  <h3>제2조(정의)</h3>
                  ① "몰"이란 (주)펫미몰 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.  
                  <br>② "이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
                  <br>③ ‘회원’이라 함은 "몰"에 개인정보를 제공하여 회원등록을 한 자로서, "몰"의 정보를 지속적으로 제공받으며, "몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
                  <br>④ ‘비회원’이라 함은 회원에 가입하지 않고 "몰"이 제공하는 서비스를 이용하는 자를 말합니다.	
              </li>
              <li>
                  <h3>제3조(약관등의 명시와 설명 및 개정) </h3>
                  ① "몰"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 "몰"의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
                  <br>② "몰"은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
                  <br>③ "몰"은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
                  <br>④ "몰"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.
                  <br>다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 
                  <br>⑤ "몰"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 "몰"에 송신하여 "몰"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
                  <br>⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
          
          
              </li>
              <li>
                  <h3>제4조(서비스의 제공 및 변경) </h3>
                  ① "몰"은 다음과 같은 업무를 수행합니다.
                  <br>1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
                  <br>2. 구매계약이 체결된 재화 또는 용역의 배송
                  <br>3. 기타 "몰"이 정하는 업무
                  <br>② "몰"은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
                  <br>③ "몰"이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
                  <br>④ 전항의 경우 "몰"은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, "몰"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
          
          
              </li>
              <li>
                  <h3>제5조(서비스의 중단) </h3>
                  ① "몰"은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
                  <br>② "몰"은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, "몰"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
                  <br>③ 사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 "몰"은 제8조에 정한 방법으로 이용자에게 통지하고 당초 "몰"에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, "몰"이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 "몰"에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
          
          
              </li>
              <li>
                  <h3>제6조(회원가입) </h3>
                  ① 이용자는 "몰"이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
                  <br>② "몰"은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.
                  <br>1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 "몰"의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
                  <br>2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
                  <br>3. 기타 회원으로 등록하는 것이 "몰"의 기술상 현저히 지장이 있다고 판단되는 경우
                  <br>③ 회원가입계약의 성립시기는 "몰"의 승낙이 회원에게 도달한 시점으로 합니다.
                  <br>④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "몰"에 대하여 그 변경사항을 알려야 합니다.
          
          
              </li>
              <li>
                  <h3>제7조(회원 탈퇴 및 자격 상실 등) </h3>
                  ① 회원은 "몰"에 언제든지 탈퇴를 요청할 수 있으며 "몰"은 즉시 회원탈퇴를 처리합니다.
                  <br>② 회원이 다음 각호의 사유에 해당하는 경우, "몰"은 회원자격을 제한 및 정지시킬 수 있습니다.
                  <br>1. 가입 신청시에 허위 내용을 등록한 경우
                  <br>2. "몰"을 이용하여 구입한 재화등의 대금, 기타 "몰"이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
                  <br>3. 다른 사람의 "몰" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
                  <br>4. "몰"을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
                  <br>③ "몰"이 회원 자격을 제한·정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 "몰"은 회원자격을 상실시킬 수 있습니다.
                  <br>④ "몰"이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
          
          
              </li>
              <li>
                  <h3>제8조(회원에 대한 통지)</h3>
                  ① "몰"이 회원에 대한 통지를 하는 경우, 회원이 "몰"과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
                  <br>② "몰"은 불특정다수 회원에 대한 통지의 경우 1주일이상 "몰" 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
          
          
              </li>
              <li>
                  <h3>제9조(구매신청) "몰"이용자는 "몰"상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, "몰"은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.  단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.</h3>
                  1. 재화등의 검색 및 선택
                  <br>2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
                  <br>3. 약관내용, 청약철회권이 제한되는 서비스, 배송료·설치비 등의 비용부담과 관련한 내용에 대한 확인
                  <br>4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
                  <br>5. 재화등의 구매신청 및 이에 관한 확인 또는 "몰"의 확인에 대한 동의
                  <br>6. 결제방법의 선택
          
                  제10조 (계약의 성립)
                  ①  "몰"은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
                  <br>1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
                  <br>2. 미성년자가 담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
                  <br>3. 기타 구매신청에 승낙하는 것이 "몰" 기술상 현저히 지장이 있다고 판단하는 경우
                  <br>② "몰"의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
                  <br>③ "몰"의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소등에 관한 정보등을 포함하여야 합니다.
          
          
              </li>
              <li>
                  <h3>제11조(지급방법) "몰"에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법중 가용한 방법으로 할 수 있습니다. 단, "몰"은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도  추가하여 징수할 수 없습니다.</h3>
                  1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 
                  <br>2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
                  <br>3. 온라인무통장입금
                  <br>4. 전자화폐에 의한 결제
                  <br>5. 수령시 대금지급
                  <br>6. 마일리지 등 "몰"이 지급한 포인트에 의한 결제
                  <br>7. "몰"과 계약을 맺었거나 "몰"이 인정한 상품권에 의한 결제  
                  <br>8. 기타 전자적 지급 방법에 의한 대금 지급 등
          
          
              </li>
              <li>
                  <h3>제12조(수신확인통지·구매신청 변경 및 취소)</h3>
                  ① "몰"은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
                  <br>② 수신확인통지를 받은 이용자는 의사표시의 불일치등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 "몰"은 배송전에 이용자의 요청이 있는 경우에는 지체없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.
          
          
              </li>
              <li>
                  <h3>제13조(재화등의 공급)</h3>
                  ① "몰"은 이용자와 재화등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, "몰"이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다.  이때 "몰"은 이용자가 재화등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
                  <br>② "몰"은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "몰"이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 "몰"이 고의·과실이 없음을 입증한 경우에는 그러하지 아니합니다.
          
          
              </li>
              <li>
                  <h3>제14조(환급)</h3>
                  "몰"은 이용자가 구매신청한 재화등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
          
          
              </li>
              <li>
                  <h3>제15조(청약철회 등)</h3>
                  ① "몰"과 재화등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다.
                  <br>② 이용자는 재화등을 배송받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
                  <br>1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
                  <br>2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
                  <br>3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
                  <br>4. 같은 성능을 지닌 재화등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
                  <br>③ 제2항제2호 내지 제4호의 경우에 "몰"이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회등이 제한되지 않습니다.
                  <br>④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화등을 공급받은 날부터 3월이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.
          
          
              </li>
              <li>
                  <h3>제16조(청약철회 등의 효과)</h3>
                  ① "몰"은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화등의 대금을 환급합니다. 이 경우 "몰"이 이용자에게 재화등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
                  <br>② "몰"은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화등의 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 재화등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
                  <br>③ 청약철회등의 경우 공급받은 재화등의 반환에 필요한 비용은 이용자가 부담합니다. "몰"은 이용자에게 청약철회등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회등을 하는 경우 재화등의 반환에 필요한 비용은 "몰"이 부담합니다.
                  <br>④ 이용자가 재화등을 제공받을때 발송비를 부담한 경우에 "몰"은 청약철회시 그 비용을  누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.
          
          
              </li>
              <li>
                  <h3>제17조(개인정보보호)</h3>
                  ① "몰"은 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다. 
                  <br>1. 성명
                  <br>2. 주소
                  <br>3. 전화번호
                  <br>4. 희망ID(회원의 경우)
                  <br>5. 비밀번호(회원의 경우)
                  <br>6. 전자우편주소(또는 이동전화번호)
                  <br>② "몰"이 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.
                  <br>③ 제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 몰이 집니다.  다만, 다음의 경우에는 예외로 합니다.
                  <br>1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우
                  <br>2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
                  <br>3. 재화등의 거래에 따른 대금정산을 위하여 필요한 경우
                  <br>4. 도용방지를 위하여 본인확인에 필요한 경우
                  <br>5. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우
                  <br>④ "몰"이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 정보통신망이용촉진등에관한법률 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
                  <br>⑤ 이용자는 언제든지 "몰"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "몰"은 이에 대해 지체없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "몰"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
                  <br>⑥ "몰"은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을  집니다.
                  <br>⑦ "몰" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다.
          
          
              </li>
              <li>
                  <h3>제18조(“몰“의 의무)</h3>
                  ① "몰"은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는데 최선을 다하여야 합니다.
                  <br>② "몰"은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
                  <br>③ "몰"이 상품이나 용역에 대하여 「표시·광고의공정화에관한법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
                  <br>④ "몰"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
          
          
              </li>
              <li>
                  <h3>제19조(회원의 ID 및 비밀번호에 대한 의무)</h3>
                  ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
                  <br>② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
                  <br>③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "몰"에 통보하고 "몰"의 안내가 있는 경우에는 그에 따라야 합니다.
          
          
              </li>
              <li>
                  <h3>제20조(이용자의 의무) 이용자는 다음 행위를 하여서는 안됩니다.</h3>
                  1. 신청 또는 변경시 허위 내용의 등록
                  <br>2. 타인의 정보 도용
                  <br>3. "몰"에 게시된 정보의 변경
                  <br>4. "몰"이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
                  <br>5. "몰" 기타 제3자의 저작권 등 지적재산권에 대한 침해
                  <br>6. "몰" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
                  <br>7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위
          
          
              </li>
              <li>
                  <h3>제21조(연결"몰"과 피연결"몰" 간의 관계)</h3>
                  ① 상위 "몰"과 하위 "몰"이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 "몰"(웹 사이트)이라고 하고 후자를 피연결 "몰"(웹사이트)이라고 합니다.
                  <br>② 연결"몰"은 피연결"몰"이 독자적으로 제공하는 재화등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결"몰"의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.
          
          
              </li>
              <li>
                  <h3>제22조(저작권의 귀속 및 이용제한)</h3>
                  ① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.
                  <br>② 이용자는 "몰"을 이용함으로써 얻은 정보 중 "몰"에게 지적재산권이 귀속된 정보를 "몰"의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
                  <br>③ "몰"은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.
          
          
              </li>
              <li>
                  <h3>제23조(분쟁해결)</h3>
                  ① "몰"은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.
                  <br>② "몰"은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
                  <br>③ "몰"과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
          
          
              </li>
              <li>
                  <h3>제24조(재판권 및 준거법)</h3>
                  ① "몰"과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
                  <br>② "몰"과 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.
          
          
              </li>
              <li>
                  <h3>부칙 </h3>
                  1. 이 약관은 0000년 00월 00일부터 적용됩니다.
              </li>
          </ul>
        </div>
        <div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: block;">
          <div class="mCSB_draggerContainer">
            <div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; display: block; height: 21px; max-height: 348px;" oncontextmenu="return false;">
              <div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
            </div>
            <div class="mCSB_draggerRail"></div>
          </div>
        </div>
      </div>
    </div>
                <div class="chk_area mt_20">
                  <input type="radio" name="check_1" id="check_1_yes" value="ok"><label for="check_1_yes">동의합니다.</label>
                  <input type="radio" name="check_1" id="check_1_no" value="no"><label for="check_1_no">동의하지 않습니다.</label>
                </div>
              </div>
              <div class="col-lg-6">
                <p class="tit_36">개인정보 취급방침</p>
                <div class="join scroll-con-y mCustomScrollbar _mCS_2"><div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0"><div id="mCSB_2_container" class="mCSB_container" style="position:relative; top:0; left:0;" dir="ltr"><ul class="term_wrap">
              <!-- 개인정보취급방침 -->
              <li>
                  <h3>개인정보의 수집목적 및 이용목적</h3>
                  ① (주)펫미몰은 회원님께 최대한으로 최적화되고 맞춤화된 서비스를 제공하기 위하여 다음과 같은 목적으로 개인정보를 수집하고 있습니다. 
                  <br>- 성명, 아이디, 비밀번호 : 회원제 서비스 이용에 따른 본인 식별 절차에 이용 
                  <br>- 이메일주소, 이메일 수신여부, 전화번호 : 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스/신상품이나 이벤트 정보의 안내 
                  <br>- 주소, 전화번호 : 경품과 쇼핑 물품 배송에 대한 정확한 배송지의 확보 
                  <br>- 비밀번호 힌트용 질문과 답변 : 비밀번호를 잊은 경우의 신속한 처리를 위한 내용 
                  <br>- 그 외 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료 ② 단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.  
          
              </li>
              <li>
                  <h3>개인정보의 수집범위</h3>
                  (주)펫미몰은 별도의 회원가입 절차 없이 대부분의 컨텐츠에 자유롭게 접근할 수 있습니다. (주)펫미몰의 회원제 서비스를 이용하시고자 할 경우 다음의 정보를 입력해주셔야 하며 선택항목을 입력하시지 않았다 하여 서비스 이용에 제한은 없습니다. 
                  <br>1) 회원 가입시 수집하는 개인정보의 범위 
                  <br>- 필수항목 : 희망 ID, 비밀번호, 비밀번호 힌트용 질문과 답변, 성명, 주소, 전화번호, 이메일주소, 이메일 수신 여부 
                  <br>- 선택항목 : 회사주소, 회사전화번호, 생년월일, 결혼여부, 결혼기념일, 직업, 월평균소득, 최종학력, 자녀수, 차량정보  
              </li>
              <li>
                  <h3>비회원의 고객 개인정보보호</h3>
                  (주)펫미몰은 회원 뿐만 아니라 비회원 또한 물품 및 서비스 상품의 구매를 하실 수 있습니다. (주)펫미몰은 비회원 주문의 경우 배송 및 대금 결제, 상품 배송에 반드시 필요한 개인정보 만을 고객에게 요청하고 있습니다.
                  <br>(주)펫미몰에서 비회원으로 구매를 하신 경우 비회원 고객께서 입력하신 지불인 정보 및 수령인 정보는 대금 결제 및 상품 배송에 관련한 용도 외에는 다른 어떠한 용도로도 사용되지 않습니다. 
                  <br>(주)펫미몰 비회원의 경우도 (주)펫미몰 회원과 동일하게 개인정보를 보호합니다.  
              </li>
              <li>
                  <h3>쿠키에 의한 개인정보 수집</h3>
                  ① 쿠키(cookie)란? 
                  <br>(주)펫미몰은 귀하에 대한 정보를 저장하고 수시로 찾아내는 쿠키(cookie)를 사용합니다. 쿠키는 웹사이트가 귀하의 컴퓨터 브라우저(넷스케이프, 인터넷 익스플로러 등)로 전송하는 소량의 정보입니다. 귀하께서 웹사이트에 접속을 하면 (주)펫미몰의 컴퓨터는 귀하의 브라우저에 있는 쿠키의 내용을 읽고, 귀하의 추가정보를 귀하의 컴퓨터에서 찾아 접속에 따른 성명 등의 추가 입력 없이 서비스를 제공할 수 있습니다. 쿠키는 귀하의 컴퓨터는 식별하지만 귀하를 개인적으로 식별하지는 않습니다. 또한 귀하는 쿠키에 대한 선택권이 있습니다. 웹브라우저 상단의 도구 &gt; 인터넷옵션 탭(option tab)에서 모든 쿠키를 다 받아들이거나, 쿠키가 설치될 때 통지를 보내도록 하거나, 아니면 모든 쿠키를 거부할 수 있는 선택권을 가질 수 있습니다. 
                  <br>② (주)펫미몰의 쿠키(cookie) 운용 
                  <br> (주)펫미몰은 이용자의 편의를 위하여 쿠키를 운영합니다. (주)펫미몰이 쿠키를 통해 수집하는 정보는 (주)펫미몰 회원 ID에 한하며, 그 외의 다른 정보는 수집하지 않습니다. (주)펫미몰이 쿠키(cookie)를 통해 수집한 회원 ID는 다음의 목적을 위해 사용됩니다. 
                  <br>- 개인의 관심 분야에 따라 차별화된 정보를 제공 
                  <br>- 회원과 비회원의 접속빈도 또는 머문시간 등을 분석하여 이용자의 취향과 관심분야를 파악하여 타겟(target) 마케팅에 활용 
                  <br>- 쇼핑한 품목들에 대한 정보와 관심있게 둘러본 품목들에 대한 자취를 추적하여 다음번 쇼핑 때 개인 맞춤 서비스를 제공 
                  <br>- 회원들의 습관을 분석하여 서비스 개편 등의 척도 
                  <br>- 게시판 글 등록 
                  <br> 쿠키는 브라우저의 종료시나 로그아웃시 만료됩니다.  
              </li>
              <li>
                  <h3>개인정보의 보유기간 및 이용기간 </h3>
                  ① 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다. 단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다. 
                  <br>- 회원가입정보의 경우, 회원가입을 탈퇴하거나 회원에서 제명된 경우 등 일정한 사전에 보유목적, 기간 및 보유하는 개인정보 항목을 명시하여 동의를 구합니다. 
                  <br>- 계약 또는 청약철회 등에 관한 기록 : 5년  
              </li>
          </ul>
        </div>
          <div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: block;">
            <div class="mCSB_draggerContainer">
            <div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; display: block; height: 94px; max-height: 348px;" oncontextmenu="return false;">
              <div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
            </div>
              <div class="mCSB_draggerRail"></div>
          </div>
        </div>
      </div>
    </div>
                <div class="chk_area mt_20">
                  <input type="radio" name="check_2" id="check_2_yes" value="ok"><label for="check_2_yes">동의합니다.</label>
                  <input type="radio" name="check_2" id="check_2_no" value="no"><label for="check_2_no">동의하지 않습니다.</label>
                </div>
                <p class="mt_10 f_14 _b8 light">개인정보보호를 위한 이용자 동의사항 (자세한 내용은 “개인정보취급방침”을 확인하시기 바랍니다) </p>
              </div>
            </div>
            <div class="con-margin-02 text_center posi_r">
              <!-- 원본 (jsp로 변환후 작업, 현재 하드코딩으로 경로 잡아놓겠습) -->
              <!-- <a href="javascript:;void(0);" class="btn-type-02" onclick="sendcheck();">다음 단계</a> -->
              <a href="<c:url value="/shopping/login/joinform.do" />" class="btn-type-02" onclick="sendcheck();">다음 단계</a>
            </div>
            </form>
          </div>
        </div>
    </div>
  <script type="text/javascript" language="JavaScript">	
    function sendcheck() {	
    
        if ($("input:radio[name='check_1']:checked").val()!="ok") {
            alert("이용약관에 동의하셔야 회원 가입이 가능합니다.");      	      					
              return(false); 
        }
        
        if ($("input:radio[name='check_2']:checked").val()!="ok") {
            alert("개인정보 취급방침에 동의하셔야 회원 가입이 가능합니다.");      	      					
              return(false); 
        }					        													
           theForm.submit();					        						        
    } 				
	</script>
	<script src="../resources/js/shopping/login/lib/jquery.magnific-popup.js"></script>
 	<!-- footer -->
	<div id="footer" class="footer_wrap clearfix"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>
	
	
	<script src="../resources/js/shopping/login/lib/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script> 
	<script src="../resources/js/shopping/login/lib/jquery.easing.1.3.js"></script>
	
	<script src="../resources/js/shopping/login/lib/wow.min.js"></script>
	<script src="../resources/js/shopping/login/lib/slick.min.js"></script>
	<script src="../resources/js/shopping/login/lib/jquery.mCustomScrollbar.min.js"></script>
	<script src="../resources/js/shopping/login/lib/modernizr.custom.js"></script>
	<script src="../resources/js/shopping/login/lib/placeholders.min.js"></script>
	<script src="../resources/js/shopping/login/lib/jquery.magnific-popup.js"></script>	
	
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<script src="../js/common.js?ver=2019-04-25"></script>
  <div id="ch-plugin"><div id="ch-plugin-script" style="display:none"><iframe id="ch-plugin-script-iframe" style="position:relative!important;height:100%!important;width:100%!important;border:none!important;"></iframe></div><div id="ch-plugin-core"><style data-styled="" data-styled-version="4.3.2"></style><style data-styled="" data-styled-version="4.3.2"></style><div hidden="" class="sc-erNlkL gTFkWU sc-RbTVP hrWefY"><div class="sc-eNNmBn cXBieY"><div name="push-exit" width="45" height="45" size="24" class="sc-dnqmqq sc-cBrjTV iByMcc"></div><div class="sc-jUpvKA ccOxya"><div size="34" class="sc-kGXeez kGMzSU"></div><div class="sc-fkyLDJ epSaPl">(알 수 없음)</div><div class="sc-iCwjlJ hRSOFL">9:00am</div></div><div class="sc-eopZyb bYeAnX"><div class="sc-jRuhRL coGTKb"><span class=""></span></div></div></div></div><div hidden="" class="sc-kEmuub llDLR sc-RbTVP hrWefY"><div class="sc-eNNmBn cXBieY"><div name="push-exit" width="45" height="45" size="24" class="sc-dnqmqq sc-cBrjTV iByMcc"></div><div class="sc-jUpvKA ccOxya"><div size="34" class="sc-kGXeez kGMzSU"></div><div class="sc-fkyLDJ epSaPl">(알 수 없음)</div><div class="sc-iCwjlJ hRSOFL">9:00am</div></div><div class="sc-eopZyb bYeAnX"><div class="sc-jRuhRL coGTKb"><span class=""></span></div></div></div></div><style data-styled="" data-styled-version="4.3.2"></style><div class="sc-bZQynM bcTMnS"></div><div hidden="" class="sc-htpNat kpbyxq"><div class="sc-bxivhb fomTXD"><div class="textLauncherContent sc-ifAKCX JIEAE"></div><div class="textLauncherIcon sc-EHOje bMzbQj"><div hidden="" class="sc-bwzfXH sc-htoDjs jiXddj">0</div></div></div></div></div></div>
  <style data-styled="" data-styled-version="4.3.2"></style>
</body>
</html>