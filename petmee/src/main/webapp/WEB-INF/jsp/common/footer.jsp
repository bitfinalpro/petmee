<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/includecss.jsp" %>
<%@ include file="/WEB-INF/jsp/include/includejs.jsp" %>
<footer>
  <div class="foot_logo">
    <div class="flogo">
      <a href="./#"><img src="<c:url value='/resources/images/menu/footlogo.png' />"></a>
       <div class="foot_txt">
      <p class="bar_span">
      		상호명 : pet&me<br>
        	평일 10:00~17:00 <br>(점심시간 12:00~13:00 / 주말&공휴일 제외)<br>
        	주소 : 서울 마포구 백범로 23 구프라자 3층 
      </p>  
    </div>
    </div>
    <div class="footerList">
    <ul>
    	<li class="footg1">FOOD
    		<ul class="footg2">
    			<li><a href="<c:url value="/shop/productList.do?categoryNo=1" />">feed</a></li>
    			<li><a href="<c:url value="/shop/productList.do?categoryNo=2" />">snack</a></li>
    		</ul>
    	</li>
    		
    	<li class="footg1">FASHION
    		<ul class="footg2">
    			<li><a href="<c:url value="/shop/productList.do?categoryNo=3" />">shirt/outer</a></li>
    			<li><a href="<c:url value="/shop/productList.do?categoryNo=4" />">shoes</a></li>
    			<li><a href="<c:url value="/shop/productList.do?categoryNo=5" />">accessory</a></li>
    		</ul>
    	</li>
    		
    	<li class="footg1">BEAUTY/BATH
    		<ul class="footg2">
    			<li><a href="<c:url value="/shop/productList.do?categoryNo=6" />">beauty</a></li>
    			<li><a href="<c:url value="/shop/productList.do?categoryNo=7" />">bath</a></li>
    		</ul>
    	</li>
    	<li class="footg1">HYGIENE/EVACUATION
    		<ul class="footg2">
    			<li><a href="<c:url value="/shop/productList.do?categoryNo=8" />">hygiene/evacuation</a></li>
    			<li><a href="<c:url value="/shop/productList.do?categoryNo=9" />">cleaning</a></li>
    		</ul>
    	</li>
    	<li class="footg1"><a href="<c:url value="/shop/productList.do?categoryNo=10" />">TOY</a></li>
    	<li class="footg1">COMMUNITY
    		<ul class="footg2">
    			<li><a href="<c:url value="/board/noticeboard/notice.do" />">notice</a></li>
    			<li><a href="<c:url value="/board/freeboard/list.do" />">free</a></li>
    			<li><a href="<c:url value="/board/parcelboard/parcelList.do" />">parsel</a></li>
    			<li><a href="<c:url value="/board/reviewboard/review_list.do" />">review</a></li>
    			<li><a href="<c:url value="/board/qnaboard/qna-list.do" />">Q&A</a></li>
    		</ul>
    	</li>
    </ul>
    </div>
  </div>
        <div class="foot_txt2">
            <p class="copy">
                COPYRIGHT ⓒ 2019 PET&ME, ALL RIGHTS RESERVED.
            </p>
        </div>
</footer>
