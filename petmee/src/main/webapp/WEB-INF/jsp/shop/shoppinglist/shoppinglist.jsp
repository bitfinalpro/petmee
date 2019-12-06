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

<title>시바 먼치킨</title>

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
			<c:set scope="page" var="price" value="${list.price }" />
			<c:set scope="page" var="sum" value="${sum + price}" />
				<div class="y-content-box">
					<div class="floatbox">

						<div>
							<img class="y-img float-l" src="" />
						</div>
						<div class="y-list-content float-l">${list.explain}</div>
						<div class="y-check-del-box float-r">
							<div class="y-delbox">
								<i class="fas fa-times fa-2x mousepoint y-delete" data-no="${list.no}" ></i>
							</div>
						</div>
					</div>

					<div class="y-amountbox ">
						<div class="y-s-amount">
							<i class="far fa-plus-square fa-2x mousepoint plus" data-amount="${list.amount }"></i> <span
								class="y-amount">${list.amount}</span> <i
								class="far fa-minus-square fa-2x mousepoint minus" data-amount="${list.amount }"></i>
						</div>
						<span class="y-price float-r"> <i
							class="fas fa-won-sign fa-lg"></i> ${list.price }
						</span>
					</div>
				</div>
				
			</c:forEach>
			
			</div>
			<hr class="cline">
			<div class="y-con-price">
				<div id="y-sum-price">
					<span>총 상품금액</span> <span class="float-r"><i
						class="fas fa-won-sign fa-sm"></i> ${sum }</span>
				</div>
				<i class="fas fa-plus fa-lg"></i>
				<div id="delivery-cost">
					<span>배송비</span> <span class="float-r"><i
						class="fas fa-won-sign fa-sm"></i> 2500</span>
				</div>
			</div>
			<hr class="cline">
			<div class="y-con-price">
				<span>예상 결제금액</span> <span class="float-r"><i
					class="fas fa-won-sign fa-sm"></i> ${sum +2500}</span>
			</div>
			<div id="y-con-button">
				<button type="button" class="mousepoint">결제하기</button>
				<button type="button" class="mousepoint">메인페이지</button>
			</div>
		</div>
	</section>
	<div id="footer" class="footer_wrap clearfix">
	<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
	
	<script src="<c:url value="/resources/js/shopping/shoppinglist.js" />"></script>
</body>
</html>