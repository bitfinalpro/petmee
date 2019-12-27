<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Insert title here</title>
<%@ include file="/WEB-INF/jsp/include/includecss.jsp" %>
<%@ include file="/WEB-INF/jsp/include/includejs.jsp" %>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/shopping/detail.css" />">
<link href="<c:url value="/resources/css/shopping/login/login2.css " />" rel="stylesheet">
	<link href="<c:url value="/resources/css/shopping/login/join.css " />" rel="stylesheet">
<script src="<c:url value="/resources/js/shopping/main/soppingDetail.js" />"></script>
<script src="../resources/js/shopping/login/lib/jquery.magnific-popup.js"></script>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>   
<body onload="init();">
    <div id="header"><c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import></div>
    <div id="wrap" class="sub">
	<!-- contents// -->
	<main id="contents" class="goods detail">
	
	 <form method="post" action="<c:url value="/shop/shoppingProductPurchase.do" />" id="">
		<input name="email" value="${user.email}" type="hidden" />
		<div class="inner product">
			<!-- propic// -->
			<div class="product_img">
				<div id="imgGallery">
					<div id="smallImgs">
					<input name ="image" value="<c:url value='${imgfirst}'/>" type ="hidden"/>
					<c:forEach var="f" items="${flist}" >
					<c:if test="${f.type eq 'sum'}">
						<img src="<c:url value='${f.path}${f.oriName}'/>" />
					</c:if>
					</c:forEach>
					</div>
					<div id="bigImg">
					<c:forEach var="f" begin="0" end="0" items="${flist}" varStatus="status">
							<img src="<c:url value='${f.path}${f.oriName}'/>" id="a"/>
					</c:forEach>							
					</div>
				</div>
			</div>
			<!-- //propic -->

			<!-- proinfo// -->
			<div class="proinfo">
				<h2>
				<input name="product" value="${product.productId}" type="hidden" />
				<input name ="dcprice" value="${product.dcPrice}" type="hidden" />
				<input name ="oriprice" value="${product.price}" type="hidden" />
				<input class="allprice" name ="price" value="${product.price - product.dcPrice}" type="hidden" />
					<strong><input value=" ${product.productName}"/></strong>
				</h2>
			
				<div class="pinfo-txt">
					<table>
						<caption>상품주요정보</caption>
						<colgroup>
							<col style="width:120px">
							<col>
						</colgroup>
						<tbody class="pinfo-txt">					
	<tr>
			
		<th>상품간략설명</th>
		<td><input name="subTitle" value="${product.productInfo} " /></td>
	</tr>
</tbody>
<tbody class="pinfo-price">
		<tr>
			<th>판매가</th>
			<td>
				<del><em><input value="${product.price}"/></em>원</del> 
				<span class="txt-price"><em><input name ="price1" value="${product.price - product.dcPrice}" /> <fmt:formatNumber type="number" maxFractionDigits="3" value=""/></em>원</span> 
			</td>
		</tr>
	</tbody>
	

	<tbody class="pinfo-info">
		<tr>
			<th>제조사</th>
			<td>${product.company}</td>
		</tr>
		<tr>
			<th>배송정보</th>
			<td> 16시 30분 이전 주문시 당일출고(공휴일,토/일요일제외)</td>
		</tr>
		<tr>
			<th> 배송비<a href="#" class="btn-popinfo type-over">!</a> </th>
			<td>2,500원 (2만원 이상 주문 시 무료 배송)</td>
		</tr>
	</tbody>
	<tbody class="pinfo-info">
		<tr>
			<th>수량 :</th>
			<td>		
			<input id="amount" name ="amount" class="excessCnt" type ="hidden" value=1 />
				<input class="excessCnt subinput" name="excessCnt" value=1 /><span>개</span>
				<button class="amount_btn" onclick="addtnNofpr.add('amount')" type="button">+</button>
				<button class="amount_btn" onclick="addtnNofpr.remove('amount')" type="button">-</button>
				<span class="subinput">(최소준문수량 1개 이상)</span>
			</td>
			
		</tr>
	
	</tbody>
	</table>
	</div>

		<fieldset>
			<div class="pro-total">
				<strong>총 상품금액(수량)</strong>
				<em id="totalPrice_A">
				<input class="price" name="price" class="inputRltvGoodsAmt" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price - product.dcPrice}" />" />
				</em>원
				(<input id="asd" value="1" name="excessCnt" class="excessCnt" onchange="change();"/>개)
			</div>
			<!-- default// -->
			<div class="btn-area btnarea-default active">
			<c:choose>
<c:when test="${empty user }">
<a onclick="$('#login-pop').modal('show');" href="javascript:;" ><button type="button" class="btn-black btn-buy" >바로 구매하기</button></a>
<button type="submit" class="btn-gray btn-cart">장바구니 담기</button>
</c:when>
<c:otherwise>
<button type="submit" class="btn-black btn-buy" >바로 구매하기</button> 
<button type="button" class="btn-gray btn-cart">장바구니 담기</button>
</c:otherwise>
</c:choose>
			</div>
			<!-- //default -->
		</fieldset>

	</div>
			<!-- //proinfo -->
		</div>
			</form>	
		<!-- //product -->



		<!-- pdetail// -->
		<div class="inner pdetail">
			 <!-- 탭타이틀 -->
		<div class="tabs tabs5" >
	<ul>
		<li class="m-detailinfo active"><a href="#detailInfo">상품상세정보</a></li>
		<li class="m-returninfo"><a href="#returnInfo">상품구매안내</a></li>
		<li class="m-review"><a href="#reView">상품리뷰</a></li>
		<li class="m-storypick"><a href="#storyPick">상품Q&A</a></li>
	</ul>
		</div>		


	<div id="detailInfo" class="detailinfo">
 	<h3 class="hide">상품상세정보</h3>
 		<c:forEach var="f" items="${flist}">
			<c:if test="${f.type ne 'sum'}">
				<img src="<c:url value='${f.path}${f.oriName}'/>" />
			</c:if>
		</c:forEach>
	</div>
				 				
	    		
					<!-- 반품교환 안내// -->
<div class="returninfo" id="returnInfo">
<h3 class="hide">&nbsp;</h3>

<table>
	<caption>&nbsp;</caption>
	<colgroup>
		<col style="width:185px" />
	</colgroup>
	<tbody>
		<tr>
			<th>배송정보</th>
			<td>-모나미 물류배송의 경우 :&nbsp;실 결제금액(예치금 포함) 2만원 이상일 경우 무료배송입니다.&nbsp;무료배송 상품이 포함됐을 경우 해당 상품은 구매금액&nbsp;합산에서 제외됩니다.&nbsp;<br />
			-업체직배송 상품 중 무료배송이 아닌 경우 : 업체개별 배송비 정책에 따라 배송비가 개별 부과됩니다.&nbsp;<br />
			-배송비 정책 제외 상품의 경우(개별배송비 부과) : 배송비 정책과는 무관하게 상품에 부과되는 배송비로 배송정책 비용에 비포함되며, 수량*배송비가 부과됩니다. 배송비 정책 제외 대상 상품은 무료배송 조건 합산금액에는 포함되지 않습니다.&nbsp;<br />
			-도서산간비 : 2만원 미만 구매 시 기본 배송료 2,500원에 추가 도선료가 부과됩니다. 2만원 이상 구매 시에는 기본 배송료가 무료이므로 추가 도선료만 부과됩니다. 도서산간비의 경우, 모나미 물류배송, 업체직배송 모두 기준 공통으로 적용합니다.&nbsp;</td>
		</tr>
		<tr>
			<th>주문취소</th>
			<td>-주문 상태가 &lsquo;입금대기&rsquo;, &#39;결제완료&#39; 일 경우는 모나미몰 마이페이지에서 신청하실 수 있습니다.<br />
			-주문 상품의 상태가 &lsquo;배송준비중&rsquo;, &lsquo;배송중&rsquo;, &lsquo;배송완료&rsquo;인 경우는 주문 취소 신청이 진행이 되지 않으며, 반품, 교환으로 진행한 뒤 제품 회수 후 환불 처리됩니다. 환불 처리는 제품 회수 완료 시점으로 최대 15일 이내에 처리해 드립니다.&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<th>교환안내</th>
			<td>교환은 &lsquo;배송중&rsquo;, &#39;배송완료&#39;의 상태일 때 신청이 가능하며 모나미몰 마이페이지에서 신청하실 수 있습니다. 교환신청 후 교환을 원하는 상품을 먼저 모나미몰, 또는 판매자에게 발송하고 모나미몰 또는 판매자가 상품 확인 후 교환 상품 발송이 이루어집니다.</td>
		</tr>
		<tr>
			<th>반품안내</th>
			<td>반품 교환 시점은 제품 수령일로부터 7일 이내 가능하며 수령 받은 상태로 제품이 선회수되어야 합니다. 상품 확인 후 환불이 진행됩니다.&nbsp;고객님의 단순변심으로 인한 반품의 경우, 결제금액(실제 결제한 금액)에서 배송비를 차감한 뒤 환불됨을 알려드립니다.&nbsp;</td>
		</tr>
		<tr>
			<th>교환/반품 배송비 안내</th>
			<td>결제수단에 따라 처리 기간의 차이가 날 수 있으며, 모나미몰의 경우, 토/일요일, 공휴일 제외 5~7일 정도 소요됨을 알려드립니다. 판매자 상품의 경우, 모나미몰 소요기간과 다를 수 있음을 알려드립니다.&nbsp; &nbsp;</td>
		</tr>
		<tr>
			<th>반품/교환 불가사유 안내</th>
			<td>- 제품 하자, 오배송의 이유로 반품, 교환 시에는 모나미몰 또는 판매자가 배송비를 부담합니다. 단, 모나미몰 또는 판매자가 반품상품 확인 후 상품불량이 아닌 것으로 판명 시 반송비(왕복 배송비, 무료배송인 경우에도 왕복 배송비 부과)를 고객님께 부과할 수 있습니다.<br />
			- 고객님 책임에 해당하는 사유로 상품 및 구성품 등이 멸실훼손된 경우(개봉된 제품), 고객님 사용 또는 일부 소비에 의해 상품 가치가 감소한 경우, 상품 제작에 들어가는 각인 서비스의 경우, 그 외 전자상거래 등에서 소비자보호에 관한 법률이 정하는 청약철회 제한에 해당하는 경우에는 반품, 교환이 불가함을 알려드립니다.&nbsp;<br />
			- 단순변심, 고객님의 개인적인 사정으로 인해 교환 및 반품을 진행하실 경우에는 결제금액(실제 결제금액)에서 배송비를 차감한 뒤 환불됨을 알려드립니다.</td>
		</tr>
		<tr>
			<th>취소/반품/환불 소요기간 안내</th>
			<td>반품, 교환 가능 기능을 초과하였을 경우, 고객님 책임에 해당하는 사유로 상품 및 구성품 등이 멸실훼손된 경우(개봉된 제품), 고객님 사용 또는 일부 소비에 의해 상품 가치가 감소한 경우, 상품 제작에 들어가는 각인 서비스의 경우, 그 외 전자상거래 등에서 소비자보호에 관한 법률이 정하는 청약철회 제한에 해당하는 경우입니다.</td>
		</tr>
		<tr>
			<th>사은품 안내</th>
			<td>- 사은품은 프모로션 내용에 따라 지급 대상이 다르게 적용될 수 있습니다.<br />
			- 사은품은 소진 시 사전 예고 없이 변경되거나 지급이 종료될 수 있습니다.<br />
			- 주문 취소, 교환, 반품 등 주문 상태 변경 시 사은품이 회수될 수 있습니다.</td>
		</tr>
	</tbody>
</table>
</div>
<!-- //반품교환 안내 -->


	<div id="reView" class="review">
		<div class="board_title"><strong>Review Board</strong></div>
			<table class="notice_tb">
					<colgroup>
						<col width=7%;>
						<col width=20%;>
						<col width=20%;>
						<col width=10%;>
						<col width=10%;>
						<col width=10%;>
						<col width=7%;>
						<col width=10%;>
					</colgroup>
					<tr>
						<th>NO</th>
						<th>PRODUCT</th>
						<th>TITLE</th>
						<th>WRITER</th>
						<th>DATE</th>
						<th>RATING</th>
						<th>VIEW</th>
						<th></th>
					</tr>
				
					 <c:if test="${empty list}">
					<tr>
						<td colspan="5">게시물이 없습니다.</td>
					</tr>				
				</c:if>
			<c:forEach var="b" items="${list}">
				<c:if test="${b.type eq 'reviwe'}">
				<tr onclick="document.location.href='detail.do?no=${b.no}'">
					<td>${b.no}</td>
					<%-- <td>${b.product}</td> --%>
					<td>${b.title}</td>
					<%-- <td>${b.writer}</td> --%>
					<td><i class="far fa-clock"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${b.regDate}" /></td>
					<%--<td>${b.rating}</td>--%>
					<td>${b.viewCnt}</td>
					<td>
                     <a href="<c:url value="/board/reviewboard/updateform.do?no=${b.no}"/> "><button>수정</button></a>
                     <a href="<c:url value="/board/reviewboard/delete.do?no=${b.no}"/> "><button>삭제</button></a>
                   </td>
				</tr>
				</c:if>
			</c:forEach>
				</table>
		<div id="page" >
        	<nav>
			  <ul class="pagination">
			    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
			    <li <c:if test="${pr.pageNo == i}">class="active"</c:if>><a href="review.do?pageNo=${i}">${i}</a></li>
			    </c:forEach>
			  </ul>
			</nav>
		</div>
 	</div>
			 						
 <div id="storyPick" class="storypick">
		<div class="board_title"><strong>Q&A Board</strong></div>
		<table class="notice_tb">
				<colgroup>
					<col width=7%;>
					<col width=50%;>
					<col width=7%;>
					<col width=10%;>
					<col width=7%;>
					<col width=10%;>
				</colgroup>
				<tr>
					<th>NO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
					<th>VIEW</th>
					<th></th>
				</tr>
				 <c:if test="${empty list}">
					<tr>
						<td colspan="5">게시물이 없습니다.</td>
					</tr>				
				</c:if>
			<c:forEach var="b" items="${list}">
			<c:if test="${b.type eq 'QnA'}">
				<tr onclick="document.location.href='detail.do?no=${b.no}'">
					<td>${b.no}</td>
					<%-- <td>${b.product}</td> --%>
					<td>${b.title}</td>
					<%-- <td>${b.writer}</td> --%>
					<td><i class="far fa-clock"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${b.regDate}" /></td>
					<%--<td>${b.rating}</td>--%>
					<td>${b.viewCnt}</td>
					<td>
                     <a href="<c:url value="/board/reviewboard/updateform.do?no=${b.no}"/> "><button>수정</button></a>
                     <a href="<c:url value="/board/reviewboard/delete.do?no=${b.no}"/> "><button>삭제</button></a>
                   </td>
				</tr>
				</c:if>
			</c:forEach>
			</table>
			<div id="page" >
        	<nav>
			  <ul class="pagination">
			    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
			    <li <c:if test="${pr.pageNo == i}">class="active"</c:if>><a href="notice.do?pageNo=${i}">${i}</a></li>
			    </c:forEach>
			  </ul>
			</nav>
		</div>
 </div>
		<!-- bottombuybtn// -->
		<div class="bottombuybtn">
			<div class="inner">
				<div class="bbuybtn" id="">
					<span class="txt-total">총 상품금액(수량) <strong><em id="totalPrice_B"><input class="price" name="price1" class="inputRltvGoodsAmt" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}" />">
				(<input value="1" name="excessCnt" class="excessCnt" onchange="change();"/>개)</strong></span>
						<!-- default// -->
						<div class="btn-area btnarea-default active">
							<button type="button" class="btn-black btn-buy" onclick="_orderGoods();">바로 구매하기</button>							
							<button type="button" class="btn-gray btn-cart" onclick="_addCart();">장바구니 담기</button>
						</div>	
				</div>
			</div>
		</div>
		</div>
		<!-- //bottombuybtn -->
	</main>
	<!-- //contents -->
</div>

  
    <div id="footer" class="footer_wrap clearfix"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>

	<script>

	var big;
	var smallImgs;
	var bigImg;
	var smallImgThumb;
	
	function init () {
		
		big = document.getElementById('bigImg');
		smallImgs= document.getElementById('smallImgs');
		bigImg = big.getElementsByTagName('img')[0];
		smallImgThumb = smallImgs.getElementsByTagName('img');
		for(var i = 0; i<smallImgThumb.length; i++){
			smallImgThumb[i].onmouseover = function(){
				bigImg.src=this.src;
			}
		}	
	}
	
	
		function AddtnNofpr(){

			//상품에서 아래 내용 세팅
			this.constMnmmAccptCnt = 1;
			this.constMxmmAccptCnt = ${product.stock};
			
			//상품 최소수량으로 세팅
			this.amount = 1;//수량
			
			this.chargeYn = "Y";
			this.perPersonAmt = (this.chargeYn=="Y") ? ${product.price - product.dcPrice} : 1;
			
			var p = this;
			
			this.add = function (type){
				var nowCnt = p.amount;
			
				if(nowCnt > p.constMxmmAccptCnt){
					alert("최대 수량을 초과했습니다."); 
					return false;
				}
				
				eval("p."+type+"++;");
				p.afterProc();			
			}
			
			this.remove = function (type){
				if($('.'+type).val()==1) return false;
				
				eval("p."+type+"--;");
				p.afterProc();			
			}
			
			//계산 후처리.
			this.afterProc = function (){
				
				// 계산
				var nowCnt = p.amount;
				var excessCnt = (nowCnt - p.constMnmmAccptCnt < 0 )? 0 : nowCnt - p.constMnmmAccptCnt ;
				$('.excessCnt').val(excessCnt);
				//초과 가격 계산
				$('.price').val((excessCnt*p.perPersonAmt).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				$('.allprice').val(excessCnt * (${product.price - product.dcPrice}));
			}

		}
					
		var addtnNofpr = new AddtnNofpr();
		</script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script> 
	<script src="../js/lib/jquery.magnific-popup.js"></script>	
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
</body>
</html>