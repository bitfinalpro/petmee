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
	href="<c:url value='/resources/css/shopping/purchase/purchaselist.css'/>">

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
	<script type="text/javascript" src="/static/js/jquery-1.11.1.js"></script>
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
					<li><a href="#" class="on">회원정보 변경</a></li>
					<li><a href="#">작성 후기 보기</a></li>
					<li><a href="#">구매내역</a></li>
				</ul>
			</div>
			<div class="sub-con sub-pad">
				<div class="sub-title">
					<p class="desc">구매내역</p>
					<p class="title_bold">Purchase details</p>
				</div>
				<!-- 여기가 컨텐츠 내용 -->
				<hr class="outline-hr" />
				<div id="content">

					<table class="listbox">

						<thead>
							<tr>
								<th>주문날자</th>
								<th>주문상품</th>
								<th>결제금액</th>
								<th>배송상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="purchase-date">2019-12-12</td>
								<td class="purchase-goods">
									<img class="goods-img" src="" /> 
								</td>
								<td class="purchase-price"></td>
								<td class="purchase-state"></td>
							</tr>
						</tbody>

					</table>
				</div>
				<hr class="outline-hr" />
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