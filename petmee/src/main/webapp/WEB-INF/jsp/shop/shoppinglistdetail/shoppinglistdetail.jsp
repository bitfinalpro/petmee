<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<%@ include file="/WEB-INF/jsp/include/includecss.jsp"%>
<%@ include file="/WEB-INF/jsp/include/includejs.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/resources/css/shopping/shoppingList/shopingpayment.css'/>">
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>
<title>(주)펫미</title>

</head>

<body>
	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
	<section>
		<div id="container">
			<div id="y-con-head">
				<h2>주문/결제</h2>
			</div>
			<hr />
			<div id="y-con-content" class="float-l">
				<!-- 장바구니정보 -->
				<h3>주문상품</h3>
				
				<div class="con-box float-l">
					<div id="shoppinglist" class="float-l">
						<hr class="hr1" />
						<c:set var="sum" scope="page" value="0" />
						<c:forEach var="ylist" items="${list}">

							<c:set var="sum" scope="page" value="${sum + ylist.price }" />
							<div class="y-content-box">

								<div class="floatbox">

									<div>
										<img class="y-img float-l" src="${ylist.image }" />
									</div>
									<div class="y-list-content float-l">${ylist.subTitle}</div>
									<div class="y-check-del-box float-r"></div>
									<div class="y-s-amount float-r">
										<span class="y-amount">${ylist.amount} 개</span>
									</div>
								</div>

								<span class="y-price float-r"> <i
									class="fas fa-won-sign fa-lg"></i> <span class="price">${ylist.price}</span>
								</span>
							</div> 
						</c:forEach>
					</div>

					<!-- 쿠폰정보 -->
					<div id="coupon-box" class="float-r">
						<h2 class="h2-title">쿠폰 정보</h2>
						<hr />
						<div id="coupon-list">
							<c:forEach var="coupon" items="${coupon}">
								<div class="coupon">
									<div>${coupon.name }</div>
									<div>${coupon.regdate}까지</div>
									<div>(-)${coupon.discount }</div>
									<input type="checkbox" name="coupon" class="coupon-ch"
										value="${coupon.discount }">
									<input type="hidden" class="couponNo" value="${coupon.no}">
								</div>
							</c:forEach>
						</div>
						<hr />
						<div>
							<input type="text" placeholder="쿠폰번호를 입력하세요." name="couponNo"
								id="couponNo">
							<button id="couponbtn" class="mousepoint">추가하기</button>
						</div>
						<hr />
					</div>
					<!-- 총 가격 -->
					<div id="y-price-box" class="float-r">

						<div id="p-box1">
							<div class="p-blank">총 결제금액</div>
							<div class="price-box">
								<div class="p-div1">
									<span>총 상품금액</span> <span>\ ${sum}</span>
									<hr />
								</div>
								<div class="p-div1" id="discount">
									<span>할인금액</span> <span>(-) 0</span>
									<hr />
								</div>
								<div class="p-div1">
									<span>배송비</span> <span>\ 2500</span>
									<hr />
								</div>
							</div>
						</div>
						<hr />
						<div id="p-box2">
							<div class="p-blank" id="sd">최종 결제금액</div>
							<div class="price-box pading-t20">
								<div class="font-30 text-align-c" id="p-price" data-sum="${sum + 2500}">\ ${sum + 2500}</div>
								<div class="text-align-c p-btn">
									<button id="paymentBtn" class="mousepoint">결제하기</button>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="con-box float-l">
					<!-- 배송지 폼 -->
					<div id="delivery-info" class="float-l">
						<form action="" name="">
							<h2 class="h2-title">배송지 정보</h2>
							<hr />
							<div id="info">
								<div>받는분</div>
								<input type="text" id="name" class="info-text" />
								<hr />
								<div>휴대폰</div>
								<input type="text" id="phone" class="info-text" />
								<hr />
								<div>이메일</div>
								<input type="text" id="email" class="info-text" />
								<hr />
								<div>주소</div>
								<div class="address-box">
									<div class="">
										<input type="text" name="zipcode" id="zipcode" maxlength="5"
											readonly="readonly" onclick="DaumPostcode();">
										<button type="button" class="btn" onclick="DaumPostcode();">우편번호</button>
										<div class="">
											<input type="text" name="address" id="address1"
												readonly="readonly" maxlength="100"
												onclick="DaumPostcode();" placeholder="주소">
										</div>
									</div>
								</div>
								<div class="inputbox">
									<label>상세주소</label> <input type="text" class="info-text"
										name="address" id="address2" maxlength="100"
										placeholder="상세주소를 입력해주세요">
								</div>
								<hr />
								<div>배송메모</div>
								<textarea id="content" class="info-text padding10"></textarea>
								<hr />
							</div>
						</form>

					</div>
					<!-- 주문자 정보 -->
					<div id="orderbox" class="float-r">
						<h2 class="h2-title">주문자 정보</h2>
						<hr />
						<div id="order">
							<div class="margin-tb-30">
								주문자<span>${order.name}</span>
							</div>
							<hr />
							<div class="margin-tb-30">
								이메일<span class="email">${order.email}</span>
							</div>
						</div>
						<hr class="bottom-10" />

					</div>
					<!-- 결제방식 박스 -->
					<div id="paymentbox" class="float-r">
						<h2 class="h2-title">결제방식</h2>
						<hr />
						<div>
							<label for="p-naverapy">네이버페이</label> <input type="radio"
								name="pay" value="p-naverapy" id="p-naverapy" class="payment" />
						</div>
						<div>
							<label for="p-kakaopay">카카오페이</label> <input type="radio"
								name="pay" value="p-kakaopay" id="p-kakaopay" class="payment" />
						</div>
						<div>
							<label for="p-cash">무통장 입금</label> <input type="radio" name="pay"
								id="p-cash" value="p-cash" class="payment" />
						</div>
						<div>
							<label for="p-card">카드결제</label> <input type="radio" name="pay"
								id="p-card" value="p-card" class="payment" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>

	<script>
	/* textarea 자동으로 칸늘려주는 스크립트 */
		$("textarea.info-text").on('keydown keyup', function() {
			$(this).height(1).height($(this).prop('scrollHeight') + 12);
		});
	</script>
	
	<script>
	let p = ${sum}+2500;
	console.log(p)
	let oid = '${order.email}';
	console.log(oid)
	
	
	</script>
	
	<script
		src="<c:url value="/resources/js/shopping/shoppinglist/payment.js" />"></script>
	<script
		src="<c:url value="/resources/js/shopping/shoppinglist/couponUpdate.js" />"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script charset="UTF-8" type="text/javascript"
		src="http://t1.daumcdn.net/postcode/api/core/191007/1570443254160/191007.js"></script>
<!--  

결제 api 부트페이 
	<script>
function payments() {
	//실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
	BootPay.request({
		price: '1000', //실제 결제되는 가격
		application_id: "[ WEB SDK용 Application ID ]",
		name: '블링블링 마스카라', //결제창에서 보여질 이름
		pg: '',
		method: '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
		show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
		items: [
			{
				item_name: '나는 아이템', //상품명
				qty: 1, //수량
				unique: '123', //해당 상품을 구분짓는 primary key
				price: 1000, //상품 단가
				cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
				cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
				cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
			}
		],
		user_info: {
			username: '사용자 이름',
			email: '사용자 이메일',
			addr: '사용자 주소',
			phone: '010-1234-4567'
		},
		order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
		params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
		account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
		extra: {
		    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
			end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
	        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
	        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
		}
	}).error(function (data) {
		//결제 진행시 에러가 발생하면 수행됩니다.
		console.log(data);
	}).cancel(function (data) {
		//결제가 취소되면 수행됩니다.
		console.log(data);
	}).ready(function (data) {
		// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
		console.log(data);
	}).confirm(function (data) {
		//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
		//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
		console.log(data);
		var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
		if (enable) {
			BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
		} else {
			BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
		}
	}).close(function (data) {
	    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
	    console.log(data);
	}).done(function (data) {
		//결제가 정상적으로 완료되면 수행됩니다
		//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
		console.log(data);
	});
	}
	
	$(".con-box").on("#paymentBtn","click",(e) => {
		   payments();
	});

	</script>
	-->
</body>
</html>