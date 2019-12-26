<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<%@ include file="/WEB-INF/jsp/include/includecss.jsp"%>
	<%@ include file="/WEB-INF/jsp/include/includejs.jsp"%>

	<link rel="stylesheet" href="<c:url value='/resources/css/shopping/shoppingList/shopingList.css'/>">

	<title>(주)펫미</title>

</head>

<body>
	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
	<section>
		<div id="y-container">
			<div id="y-con-head">
				<span id="y-title">장바구니</span>
				<div id="y-title-box">
					<i class="fas fa-times fa-2x mousepoint" id="y-alldelete"></i>
				</div>
			</div>
			<hr class="y-line">
			<div id="y-con-content">

				<c:set scope="page" var="sum" value="0" />

				<c:forEach var="list" items="${list}" varStatus="status">
					<c:set scope="page" var="sum" value="${sum + list.price}" />
					<div class="y-content-box">
						<div class="floatbox">

							<div>
								<img class="y-img float-l" src="${list.image}" />
							</div>
							<div class="y-list-content float-l">${list.subTitle}</div>
							<div class="y-check-del-box float-r">
								<div class="y-delbox">
									<i class="fas fa-times fa-2x mousepoint y-delete" data-no="${list.no}"></i>
								</div>
							</div>
						</div>

						<div class="y-amountbox ">
							<div class="y-s-amount">
								<i class="far fa-plus-square fa-2x mousepoint plus" data-amount="${list.amount }"
									data-no="${list.no}" data-oriprice="${list.oriprice}"></i>
								<span class="y-amount">${list.amount}</span>
								<i class="far fa-minus-square fa-2x mousepoint minus" data-amount="${list.amount }"
									data-no="${list.no}" data-oriprice="${list.oriprice}"></i>
							</div>
							<span class="y-price float-r">
								<i class="fas fa-won-sign fa-lg"></i> <span class="price">${list.price}</span>
							</span>
						</div>
					</div>

				</c:forEach>

			</div>
			<hr class="cline">
			<div class="y-con-price">
				<div id="y-sum-price">
					<span>총 상품금액</span> <span class="float-r"><i class="fas fa-won-sign fa-sm"></i> <span id="sum">${sum
							}</span></span>
				</div>
				<i class="fas fa-plus fa-lg"></i>
				<div id="delivery-cost">
					<span>배송비</span> <span class="float-r"><i class="fas fa-won-sign fa-sm"></i> 2500</span>
				</div>
			</div>
			<hr class="cline">
			<div class="y-con-price">
				<span>예상 결제금액</span> <span class="float-r"><i class="fas fa-won-sign fa-sm"></i> <span id="sum1">${sum
						+2500}</span></span>
			</div>
			<div id="y-con-button">
				<button type="button" class="mousepoint" id="paymentbtn">결제하기</button>
				<button type="button" class="mousepoint"
					onclick="location.href='<c:url value="/main.do" />'">메인페이지</button>
			</div>
		</div>
	</section>
	<div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>

	<script>
	</script>
	<script src="<c:url value="/resources/js/shopping/shoppinglist/shoppinglist.js" />"></script>
</body>

</html>