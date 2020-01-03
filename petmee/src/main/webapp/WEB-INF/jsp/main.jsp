<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content=="IE=edge"/>
	<meta name="google" value="notranslate"/>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common/base.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common/gnb.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common/slick.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common/slick-theme.css" />">
	<link href="<c:url value="/resources/css/shopping/login/login2.css " />" rel="stylesheet">
	<link href="<c:url value="/resources/css/shopping/login/join.css " />" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/shopping/main/main.css" />">
	
	<script src="<c:url value="/resources/js/common/jquery-3.4.1.js" />"></script>
	<script src="<c:url value="/resources/js/common/menu.js" />"></script>
	<script src="<c:url value="/resources/js/common/slick.js" />"></script>
	<script src="<c:url value="/resources/js/common/slick.min.js" />"></script>
	<script src="<c:url value="/resources/js/shopping/main/main.js" />"></script>
	<title>PetMee</title>
</head>
<body>
	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
	<div class="slick-items">
		<div class="slide"><img src="${pageContext.request.contextPath}/resources/images/main/test1.jpg" style="display: inline-block;"></div>
		<div class="slide"><img src="${pageContext.request.contextPath}/resources/images/main/test2.jpg" style="display: inline-block;"></div>
      <div class="slide"><img src="${pageContext.request.contextPath}/resources/images/main/test3.jpg" style="display: inline-block;"></div>
      <div class="slide"><img src="${pageContext.request.contextPath}/resources/images/main/test4.jpg" style="display: inline-block;"></div>
      <div class="slide"><img src="${pageContext.request.contextPath}/resources/images/main/test5.jpg" style="display: inline-block;"></div>
    </div>
    
<section class="main_section">
  <div class="product_title">
    <h2>NEWEST PRODUCT</h2>
    <span>최신상품을 소개합니다.</span>
  </div>
    <div class="autoplay">
    <c:forEach var="food" items="${food}" varStatus="status">
    <div class="slide">
                  <div class="product_slide ">
                    <a href="<c:url value="shop/shoppingDetail.do?productId=${food.productId}" />">
                      <div class="over-hidden">
                      	<img src="<c:url value='${flist[status.index].path}${flist[status.index].oriName}'/>" class="scale" />
                      	</div>
                      <div class="product_text">
                        <strong>${food.productName}</strong>            
                        <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${food.price}" /></span>
                        <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${food.price - food.dcPrice}" /></span>
                      </div>
                      <div class="sb_img">
                        <c:if test="${food.dcPrice > 1}"><img src="<c:url value="/resources/images/main/sale.png" />"></c:if> 
         		<c:if test="${food.productCnt > 5}"> <img src="<c:url value="/resources/images/main/best.png" />"></c:if>
                      </div>
                    </a>
                      </div>
                    </div>
          	</c:forEach>     
      </div>
</section>
<section class="main_section">
    <div class="product_title">
    <h2>BEST PRODUCT</h2>
    <span>베스트상품을 소개합니다.</span>
  </div>
  <div class="autoplay">
      <c:forEach var="best" items="${best}" varStatus="status">
      	<c:if test="${best.productCnt > 1 }" >
    	<div class="slide">
          <div class="product_slide ">
            <a href="<c:url value="shop/shoppingDetail.do?productId=${best.productId}" />">
              <div class="over-hidden"><img src="<c:url value='${mlist[status.index].path}${mlist[status.index].oriName}'/>" class="scale"></div>
              <div class="product_text">
                <strong>${best.productName}</strong>
               <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${best.price}" /></span>
                <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${best.price - best.dcPrice}" /></span>
              </div>
              <div class="sb_img">
               <c:if test="${best.dcPrice > 1}"><img src="<c:url value="/resources/images/main/sale.png" />"></c:if> 
         		<c:if test="${best.productCnt > 1}"> <img src="<c:url value="/resources/images/main/best.png" />"></c:if>
              </div>
            </a>
          </div>
       </div>
      	</c:if>
     </c:forEach>   
  </div>
</section>
<section class="main_section2">
  <div class="sec2_txt">
      <strong>PetMee</strong>
      <p>For better life with Pets,</p>
  </div>
  <img src="<c:url value="/resources/images/main/subimg.jpg" />" style="width: 100%"> 
</section>


<section class="main_section">
    <div class="product_title">
        <h2>CATEGORY BEST</h2>
        <span>이 상품을 추천합니다.</span>
    </div>
    <div class="tab_container">
        <ul class="tabs">
          <li class="tab-link current" data-tab="tab-1">푸드</li>
          <li class="tab-link" data-tab="tab-2">패션</li>
          <li class="tab-link" data-tab="tab-3">미용/목욕</li>
          <li class="tab-link" data-tab="tab-4">배변/위생</li>
          <li class="tab-link" data-tab="tab-5">장난감</li>
        </ul>

        <div id="tab-1" class="tab-content current">
     	 	<ul>
          	<c:forEach var="sailbest" items="${sailbest}" begin="0" end="7" varStatus="status">
     	 		<c:if test="${sailbest.categoryNo eq 1 || sailbest.categoryNo eq 2}">
              <a href="<c:url value="shop/shoppingDetail.do?productId=${sailbest.productId}" />">
             <li>
                  <div class="product_slide" style="width:200px;">
                      <div class="over-hidden"><img src="<c:url value='${sblist[status.index].path}${sblist[status.index].oriName}'/>" class="scale"></div>
                      <div class="product_text1">
                        <strong style="display:none">${sailbest.productId}</strong>
                        <strong>${sailbest.productName}</strong>
                       <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${sailbest.price}" /></span>
                <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${sailbest.price - sailbest.dcPrice}" /></span>
                      <div class="sb_img1">       
         					 <img src="<c:url value="/resources/images/main/sale.png" />">
         					 <img src="<c:url value="/resources/images/main/best.png" />">       
                      </div>
                      </div>
                  </div>
              </li>
                  </a>
              </c:if>
          	</c:forEach>
          </ul>
        </div>
        <div id="tab-2" class="tab-content">
        	 <ul>
          	<c:forEach var="sailbest1" items="${sailbest1}" begin="0" end="7" varStatus="status">
     	 		<c:if test="${sailbest1.categoryNo eq 3 || sailbest1.categoryNo eq 4 || sailbest1.categoryNo eq 5}">
              <a href="<c:url value="shop/shoppingDetail.do?productId=${sailbest1.productId}" />">
             <li>
                  <div class="product_slide" style="width:200px;">
                      <div class="over-hidden"><img src="<c:url value='${sblist1[status.index].path}${sblist1[status.index].oriName}'/>" class="scale"></div>
                      <div class="product_text1">
                        <strong style="display:none">${sailbest1.productId}</strong>
                        <strong>${sailbest1.productName}</strong>
                       <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${sailbest1.price}" /></span>
                <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${sailbest1.price - sailbest1.dcPrice}" /></span>
                      <div class="sb_img1">       
         					 <img src="<c:url value="/resources/images/main/sale.png" />">
         					 <img src="<c:url value="/resources/images/main/best.png" />">       
                      </div>
                      </div>
                  </div>
              </li>
                  </a>
              </c:if>
          	</c:forEach>
          </ul>
        </div>
    
        <div id="tab-3" class="tab-content"> 
      		 <ul>
          	<c:forEach var="sailbest2" items="${sailbest2}" begin="0" end="7" varStatus="status">
     	 		<c:if test="${sailbest2.categoryNo eq 6 || sailbest2.categoryNo eq 7}">
                    <a href="<c:url value="shop/shoppingDetail.do?productId=${sailbest2.productId}" />">
              <li>
                  <div class="product_slide" style="width:200px;">
                      <div class="over-hidden"><img src="<c:url value='${sblist2[status.index].path}${sblist2[status.index].oriName}'/>" class="scale"></div>
                      <div class="product_text1">
                        <strong style="display:none">${sailbest2.productId}</strong>
                        <strong>${sailbest2.productName}</strong>
                       <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${sailbest2.price}" /></span>
                <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${sailbest2.price - sailbest2.dcPrice}" /></span>
                      <div class="sb_img1">       
         					 <img src="<c:url value="/resources/images/main/sale.png" />">
         					 <img src="<c:url value="/resources/images/main/best.png" />">       
                      </div>
                      </div>
                  </div>
              </li>
                    </a>
              </c:if>
          	</c:forEach>
          </ul>
        </div>
        <div id="tab-4" class="tab-content">
         <ul>
          	<c:forEach var="sailbest3" items="${sailbest3}" begin="0" end="7" varStatus="status">
     	 		<c:if test="${sailbest3.categoryNo eq 8 || sailbest3.categoryNo eq 9}">
                    <a href="<c:url value="shop/shoppingDetail.do?productId=${sailbest3.productId}" />">
             <li>
                  <div class="product_slide" style="width:200px;">
                      <div class="over-hidden"><img src="<c:url value='${sblist3[status.index].path}${sblist3[status.index].oriName}'/>" class="scale"></div>
                      <div class="product_text1">
                        <strong style="display:none">${sailbest3.productId}</strong>
                        <strong>${sailbest3.productName}</strong>
                       <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${sailbest3.price}" /></span>
                <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${sailbest3.price - sailbest3.dcPrice}" /></span>
                      <div class="sb_img1">       
         					 <img src="<c:url value="/resources/images/main/sale.png" />">
         					 <img src="<c:url value="/resources/images/main/best.png" />">       
                      </div>
                      </div>
                  </div>
              </li>
                    </a>
              </c:if>
          	</c:forEach>
          </ul>
        </div>
     
        <div id="tab-5" class="tab-content">
         <ul>
          	<c:forEach var="sailbest4" items="${sailbest4}" begin="0" end="7" varStatus="status">
     	 		<c:if test="${sailbest4.categoryNo eq 10}">
                    <a href="<c:url value="shop/shoppingDetail.do?productId=${sailbest4.productId}" />">
              <li>
                  <div class="product_slide" style="width:200px;">
                      <div class="over-hidden"><img src="<c:url value='${sblist4[status.index].path}${sblist4[status.index].oriName}'/>" class="scale"></div>
                      <div class="product_text1">
                        <strong style="display:none">${sailbest4.productId}</strong>
                        <strong>${sailbest4.productName}</strong>
                       <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${sailbest4.price}" /></span>
                <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${sailbest4.price - sailbest4.dcPrice}" /></span>
                      <div class="sb_img1">       
         					 <img src="<c:url value="/resources/images/main/sale.png" />">
         					 <img src="<c:url value="/resources/images/main/best.png" />">       
                      </div>
                      </div>
                  </div>
              </li>
                    </a>
              </c:if>
          	</c:forEach>
          </ul>
        </div>  
   
      </div>
</section>
<div class="main_section2">
    <div class="sec2_txt">
        <strong>Community</strong>
        <p>For better life with Pets,</p>
    </div>
  <img src="<c:url value="/resources/images/main/subimg.jpg" />" style="width: 100%"> 
</div>
<section class="main_section">
  <div class="main_board">
      <div class="main_board_l">
        <img src="<c:url value="/resources/images/main/board_left.png" />">
        <div class="main_board_l_text">
          <strong>게시판</strong>
          <p>Board</p>
        </div>
      </div>
      <div class="main_board_r">
        <div class="main_board_r_text">
          <strong>게시판</strong>
          <p>자유롭게 사용 가능한 게시판</p>
          <div class="lean_more">
            <a href="<c:url value="/board/parcelboard/parcelList.do" />">lean more</a>
          </div>
        </div>
      </div>
  </div>
  <%--
  <div class="main_board1"> 
      <div class="main_board_l">
        <div class="main_board_l_text">
          <strong>분양 게시판</strong>
          <p>분양받을 수 있는 게시판</p>
          <div class="lean_more">
            <a href="/board/volunteerreviewboard/list.do">lean more</a>
          </div>
        </div>
      </div>
      <div class="main_board_r">
          <img src="<c:url value="/resources/images/main/board_left.png" />">
          <div class="main_board_r_text">
            <strong>봉사활동 게시판</strong>
            <p>voluntary Board</p>
          </div>
        </div>
  </div>
   --%>
</section>
<div id="footer"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>
 
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script> 
	<script src="../js/lib/jquery.easing.1.3.js"></script>
	
	<script src="../js/lib/wow.min.js"></script>
	<script src="../js/lib/jquery.mCustomScrollbar.min.js"></script>
	<script src="../js/lib/modernizr.custom.js"></script>
	<script src="../js/lib/placeholders.min.js"></script>
	<script src="../js/lib/jquery.magnific-popup.js"></script>	
	
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<script src="../js/common.js?ver=2019-04-25"></script>
</body>
</html>















