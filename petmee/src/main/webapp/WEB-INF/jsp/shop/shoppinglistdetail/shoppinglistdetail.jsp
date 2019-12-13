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
						<c:forEach var="list" items="${list}">
							<div class="y-content-box">

								<div class="floatbox">

									<div>
										<img class="y-img float-l" src="" />
									</div>
									<div class="y-list-content float-l">${list.explain}</div>
									<div class="y-check-del-box float-r"></div>
									<div class="y-s-amount float-r">
										<span class="y-amount">${list.amount} 개</span>
									</div>
								</div>

								<span class="y-price float-r"> <i
									class="fas fa-won-sign fa-lg"></i> <span class="price">${list.price}</span>
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
									<span>${coupon.name }</span> <span><fmt:formatDate
											value="${coupon.regdate}" pattern="yyyy-MM-dd" /> 까지</span> <span>(-)${coupon.discount }</span>
									<input type="checkbox" name="coupon" class="coupon-ch">
								</div>
							</c:forEach>
						</div>
						<hr />
						<div>
							<input type="text" placeholder="쿠폰번호를 입력하세요." name="couponNo"
								id="couponNo">
							<button id="couponbtn">추가하기</button>
						</div>
						<hr />
					</div>
					<!-- 총 가격 -->
					<div id="y-price-box" class="float-r">

						<div id="p-box1">
							<div class="p-blank">총 결제금액</div>
							<div class="price-box">
								<div class="p-div1">
									<span>총 상품금액</span> <span>\ 12000</span>
									<hr />
								</div>
								<div class="p-div1">
									<span>할인금액</span> <span>(-) 12000</span>
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
								<div class="font-30 text-align-c">\ 12000</div>
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
								<input type="text" name="" class="info-text" />
								<hr />
								<div>휴대폰</div>
								<input type="text" name="" class="info-text" />
								<hr />
								<div>이메일</div>
								<input type="text" name="" class="info-text" />
								<hr />
								<div>주소</div>
								<input type="text" name="" class="info-text" />
								<hr />
								<div>배송메모</div>
								<textarea name="" class="info-text"></textarea>
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
								이메일<span>${order.email}</span>
							</div>
						</div>
						<hr class="bottom-10" />

					</div>
					<!-- 결제방식 박스 -->
					<div id="paymentbox" class="float-r">
						<h2 class="h2-title">결제방식</h2>
						<hr />
					</div>
				</div>
			</div>
		</div>
	</section>
	<div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>

	<script src="<c:url value="/resources/js/shopping/shoppinglist.js" />"></script>
	<script>
		$("textarea.info-text").on('keydown keyup', function() {
			$(this).height(1).height($(this).prop('scrollHeight') + 12);
		});
	</script>
</body>
</html>