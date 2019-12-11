<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<div id="coupon-box" class="float-r"></div>
					<!-- 총 가격 -->
					<div id="y-price-box" class="float-r"></div>
				</div>
				<div class="con-box float-l">
					<!-- 배송지 폼 -->
					<div id="delivery-info" class="float-l">
						<form action="" name="">
							<h2>배송지 정보</h2>
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
					<div id="order" class="float-r"></div>
					<!-- 결제방식 박스 -->
					<div id="payment-box" class="float-r"></div>
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