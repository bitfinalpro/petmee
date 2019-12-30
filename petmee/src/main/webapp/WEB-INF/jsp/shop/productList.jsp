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

	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common/slick.css" />">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common/slick-theme.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/shopping/productList.css" />">
<link href="<c:url value="/resources/css/shopping/login/login2.css " />" rel="stylesheet">
	<link href="<c:url value="/resources/css/shopping/login/join.css " />" rel="stylesheet">
	<script src="<c:url value="/resources/js/common/slick.js" />"></script>
	<script src="<c:url value="/resources/js/common/slick.min.js" />"></script>
    <script src="<c:url value="/resources/js/shopping/main/shoppingProductList.js" />"></script>
   
    
</head>

<body>

    <div id="header"><c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import></div>
    <div id="wrap" style="margin-top:10%">
  <div class="product_page">
      <div class="product_submenu">
		<c:import url="/WEB-INF/jsp/common/productSidemenu.jsp"></c:import>
      </div>
      <div class="product_list">
        <div class="slick-items">
          <div class="slide">
            <img src="${pageContext.request.contextPath}/resources/images/shopping/list/1.png" style="display: inline-block;" />
          </div>
          <div class="slide">
            <img src="${pageContext.request.contextPath}/resources/images/shopping/list/2.png" style="display: inline-block;" />
          </div>
        </div>
        <div class="product_line">
          <img src="${pageContext.request.contextPath}/resources/images/shopping/list/ico_heart.jpg" /><img src="${pageContext.request.contextPath}/resources/images/shopping/list/ico_heart.jpg" /><img src="${pageContext.request.contextPath}/resources/images/shopping/list/ico_heart.jpg" />
          <span>
          <c:choose>
			<c:when test="${catepro eq 1}">FEED(사료)</c:when>
			<c:when test="${catepro eq 2}">SNACK(간식)</c:when>
			<c:when test="${catepro eq 3}">SHIRT/OUTER(티/아우터)</c:when>
			<c:when test="${catepro eq 4}">SHOES(신발)</c:when>
			<c:when test="${catepro eq 5}">ACCESSORY(악세사리)</c:when>
			<c:when test="${catepro eq 6}">BEAUTY(미용)</c:when>
			<c:when test="${catepro eq 7}">BATH(목욕)</c:when>
			<c:when test="${catepro eq 8}">HYGENE/EVACUATION(위생/배변)</c:when>
			<c:when test="${catepro eq 9}">CLEANING(청소)</c:when>
			<c:when test="${catepro eq 10}">TOY(장난감)</c:when>
			<c:otherwise> ... </c:otherwise>
  		  </c:choose>
          </span>
          <img src="${pageContext.request.contextPath}/resources/images/shopping/list/ico_heart.jpg" /><img src="${pageContext.request.contextPath}/resources/images/shopping/list/ico_heart.jpg" /><img src="${pageContext.request.contextPath}/resources/images/shopping/list/ico_heart.jpg" />
        </div>
        <ul id="bodyContents">
        <c:forEach var="product" items="${product}" varStatus="status">
          <li>
          <a href="<c:url value="/shop/shoppingDetail.do?productId=${product.productId}" />">
            <img src="<c:url value="${img[status.index].path}${img[status.index].oriName}" />" />
            <span>${product.productInfo}</span>
            <strong>${product.productName}</strong>
            <span>${product.price}</span>
          </a>
          </li>
        </c:forEach>
        </ul>
      </div>
    </div>
     </div>
      <div id="page" >
        <nav>
  <ul class="pagination">
    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
    	<li <c:if test="${pr.pageNo == i}">class="active"</c:if>><a href="productList.do?categoryNo=${catepro}&pageNo=${i}">${i}</a></li>
    </c:forEach>
  </ul>
</nav>
	</div>
    <div id="footer"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script> 
	<script src="../js/lib/jquery.magnific-popup.js"></script>	
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
</body>
</html>