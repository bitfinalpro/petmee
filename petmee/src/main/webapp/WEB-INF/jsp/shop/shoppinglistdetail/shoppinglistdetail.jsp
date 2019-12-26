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
							<div class="p-blank">최종 결제금액</div>
							<div class="price-box pading-t20">
								<div class="font-30 text-align-c" id="p-price">\ ${sum + 2500}</div>
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
	let p = ${sum};
	console.log(p)
	let oid = '${order.email}';
	</script>
	
	<script
		src="<c:url value="/resources/js/shopping/shoppinglist/payment.js" />"></script>
	<script
		src="<c:url value="/resources/js/shopping/shoppinglist/couponUpdate.js" />"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script charset="UTF-8" type="text/javascript"
		src="http://t1.daumcdn.net/postcode/api/core/191007/1570443254160/191007.js"></script>

</body>
</html>