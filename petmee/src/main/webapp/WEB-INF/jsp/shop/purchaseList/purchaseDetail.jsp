<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko" class=" js no-touch">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=1200, maximum-scale=1.5, user-scalable=yes">
<meta name="format-detection"
	content="telephone=no, address=no, email=no">

<%@ include file="/WEB-INF/jsp/include/login/mypagecss.jsp"%>

<script src="<c:url value='/js/login/jquery-1.11.1.min.js' />"></script>
<script src="<c:url value='/js/login/ch-plugin-web.js' />"></script>

<link rel="stylesheet"
	href="<c:url value='/resources/css/shopping/purchase/purchaseDetail.css'/>">

<style>
.tab-select {
	background-color: white;
}

.tab-back {
	background-color: #202020;
}
</style>
<title>(주)펫미</title>
</head>

<body cz-shortcut-listen="true">
	<img src="http://asp8.http.or.kr/sr.gif?d=r6790607538803.14"
		style="width: 1px; height: 1px; position: absolute; display: none"
		onload="logCorpAnalysis_full.ch()" alt="">
	<noscript>
		<img
			src="http://asp8.http.or.kr/HTTP_MSN/Messenger/Noscript.php?key=minipet"
			style="display: none; width: 0; height: 0;" alt="" />
	</noscript>

	<title>(주)펫미</title>


	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script charset="UTF-8" type="text/javascript"
		src="http://t1.daumcdn.net/postcode/api/core/191007/1570443254160/191007.js"></script>
	<script type="text/javascript" src="/static/js/space_check.js"></script>

	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>

	<div id="contents" class="sub-contents">
		<div class="home">

			<div class="sub-visual">

				<div class="wrap">
					<div class="sub-visual-title wowrap">
						<h2 class="wow fadeInUp tit" data-wow-delay="0s"
							style="visibility: visible; animation-delay: 0s; animation-name: fadeInUp;">마이페이지</h2>
						<p class="wow fadeInUp txt" data-wow-delay="0.25s"
							style="visibility: visible; animation-delay: 0.25s; animation-name: fadeInUp;">삶의
							소중한 인연, (주)펫미가 만남부터 동행하겠습니다.</p>
					</div>
					<!-- <ul class="breadcrumb clearfix">
              <li class="depth01" style="display: none;"><a href=""></a></li>
              <li class="depth02"><a>마이페이지</a></li>
          </ul> -->
				</div>
				<!-- <div class="sub-visual-bg" style="background-image:url(../images/sub/mypage.jpg)"></div> -->
			</div>
			<div class="sub-menu-list sub_dep02" style="display: block;">
				<ul class="clearfix tab tab2">
					<li><a class="tab-back" href="#" class="on">회원정보 변경</a></li>
					<li><a href="#">작성 후기 보기</a></li>
					<li class="tab-select"><a href="<c:url value='/shop/purchaseList/purchaseList.do' />" >구매내역</a></li>
				</ul>
			</div>
			<div class="sub-con sub-pad">
			
				<div class="sub-title">
					<p class="title_bold">주문 정보</p>
				</div>
			
				<!-- 여기가 컨텐츠 내용 -->

				<div id="content">
				
					<c:set var="price1" value="0" scope="page" />
					<c:set var="dc_price1" value="0" scope="page" />

					<!-- <hr class="outline-hr" /> -->
					
					<div class="content-box">

						<c:forEach var="plist" items="${plist}">
							<c:set var="price1" value="${price1 + plist.price}" scope="page" />
							<c:set var="dc_price1" value="${dc_price1 + plist.discount}"
								scope="page" />



							<div class="goods-box">

								<div class="goods-haed">

									<span><fmt:formatDate value="${plist.regDate }"
											pattern="yyyy-MM-dd" /></span>
	   									 <span>주문번호 : ${plist.orderNo}</span>
										 <span class="float-r">상품 가격 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${plist.price}" /> 원</span> 
								</div>

								<div class="goods-body">

									<div class="goods-detail-box">
										<div class="goods-img">
											<img src="${plist.image }" />
										</div>
										<div class="goods-content">${plist.content }</div>
									</div>

									<div class="goods-cnt">${plist.productCnt }개</div>

									<div class="goods-deli">
										<div>${plist.status }</div>
										<c:if test="${plist.status eq '배송중'}">
											<a href="#">배송추적</a>
										</c:if>
									</div>

								</div>

							</div>
						</c:forEach>
					</div>


					<div class="sub-title">
						<p class="title_bold">결제 정보</p>
					</div>
					
					<!-- <hr class="outline-hr" /> -->
					
					<div class="content-box price-box">
					
					<div class="payment-box">
						<div class="goods-price-box">
							<div class="font-20">물건금액</div>
							<div>&nbsp</div>
							<div>
								<span>금액</span><span class="float-r"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price1}" /></span>
							</div>
							<div class="margin-top-15">
								<span>배송비</span><span class="float-r">2,500<!-- 고정 --></span>
							</div>
						</div>

						<div class="dc-box">
							<div class="font-20">할인금액</div>
							<div>&nbsp</div>
							<div>
								<span>기본할인</span><span class="float-r">(-) <fmt:formatNumber type="number" maxFractionDigits="3" value="${dc_price1}" /></span>
							</div>
							<div class="margin-top-15">
								<span>쿠폰</span><span class="float-r">(-) <fmt:formatNumber type="number" maxFractionDigits="3" value="${dlist.couponDc }" /></span>
							</div>
						</div>
						<!-- <div class="카드정보-box"></div> 추후 추가 -->
					</div>
					
					<!-- 종합 박스 -->
					<div class="all-price-box">
						<div>
							<span class="font-20">총 금액</span>
							<span class="float-r"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price1 + 2500}" /> 원</span>
						</div>
						<div class="margin-top-5">
							<span class="font-20">할인금액</span><span class="float-r">(-) <fmt:formatNumber type="number" maxFractionDigits="3" value="${dc_price1 + dlist.couponDc}" /></span>
						</div>
							<div>&nbsp</div>
							<div>&nbsp</div>
						<div>
							<span class="font-20">총 결제금액</span><span class="float-r"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price1 + 2500 - dc_price1 - dlist.couponDc}" /> 원</span>
						</div>
					</div>
					</div>

					
					
					<div class="sub-title">
					<p class="title_bold">배송 정보</p>
				</div>

					<!-- <hr class="outline-hr" /> -->

					<!-- 배송지 박스 -->
					
					<div class="content-box d-box">
					
					<table>
						<tr>
							<td>이름</td>
							<td>${dlist.name }</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td>${dlist.phone }</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>(${dlist.zipcode }) ${dlist.address1 } ${dlist.address2 }</td>
						</tr>
						<tr>
							<td>배송메모</td>
							<td>${dlist.content }</td>
						</tr>
					</table>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- footer 시작 -->
	<div id="footer" class="footer_wrap clearfix">
		<c:import url='/WEB-INF/jsp/common/footer.jsp'></c:import>
	</div>

	<script src="../js/lib/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
	<script src="../js/lib/jquery.easing.1.3.js"></script>
	<script src="../js/lib/wow.min.js"></script>
	<script src="../js/lib/slick.min.js"></script>
	<script src="../js/lib/jquery.mCustomScrollbar.min.js"></script>
	<script src="../js/lib/modernizr.custom.js"></script>
	<script src="../js/lib/placeholders.min.js"></script>
	<script src="../js/lib/jquery.magnific-popup.js"></script>
	<script type="text/javascript"
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="../js/common.js?ver=2019-04-25"></script>

</body>
</html>