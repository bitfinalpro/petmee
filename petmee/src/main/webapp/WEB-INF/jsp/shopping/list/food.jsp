<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content=="IE=edge"/>
<meta name="google" value="notranslate"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common/slick.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common/slick-theme.css" />">
<script src="<c:url value="/resources/js/common/jquery-3.4.1.js" />"></script>
<script src="<c:url value="/resources/js/common/menu.js" />"></script>
<script src="<c:url value="/resources/js/common/slick.js" />"></script>
<script src="<c:url value="/resources/js/common/slick.min.js" />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/shopping/main/main.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/shopping/list/side.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/shopping/list/default.css" />">
<script src="<c:url value="/resources/js/shopping/main/main.js" />"></script>
<title>PetMee</title>
</head>
<body>
<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
 <div class="slick-items">
      <div class="slide"><img src="${pageContext.request.contextPath}/resources/images/main/test1.jpg" style="display: inline-block;"></div>
      <div class="slide"><img src="${pageContext.request.contextPath}/resources/images/main/test2.jpg" style="display: inline-block;"></div>
      <div class="slide"><img src="${pageContext.request.contextPath}/resources/images/main/test3.jpg" style="display: inline-block;"></div>
      <div class="slide"><img src="${pageContext.request.contextPath}/resources/images/main/test4.jpg" style="display: inline-block;"></div>
      <div class="slide"><img src="${pageContext.request.contextPath}/resources/images/main/test5.jpg" style="display: inline-block;"></div>
    </div>
    
<!-- 사이드 바 부분-->
<header id="header" role="banner"></header>
<section style="width: 70%; margin-left: 25%;">

<nav class="nav" role="navigation" style="position: fixed; left: 0;">
    <ul class="nav__list">
    <li>
    <input id="group-1" type="checkbox" hidden />
    <label for="group-1"><span class="fa fa-angle-right"></span>반려동물</label>
        <ul class="group-list">
            <input id="sub-group-list" type="checkbox" hidden />
            <label for="sub-group-list"><span class="fa fa-angle-right"></span>푸드</label>
                <ul class="sub-group-list">
                    <li><a href="#">사료</a></li>
                    <li><a href="#">간식</a></li>
                </ul> 
            <input id="sub-group-list2" type="checkbox" hidden />
            <label for="sub-group-list2"><span class="fa fa-angle-right"></span>패션</label>
                <ul class="sub-group-list">
                    <li><a href="#">패딩/아우터</a></li>
                    <li><a href="#">신발/양말</a></li>
                    <li><a href="#">티셔츠/올인원</a></li>
                    <li><a href="#">액세서리/외출용품</a></li>
                </ul>   
            <input id="sub-group-list3" type="checkbox" hidden />
            <label for="sub-group-list3"><span class="fa fa-angle-right"></span>미용/목욕</label>
                <ul class="sub-group-list">
                    <li><a href="#">목욕용품</a></li>
                    <li><a href="#">발톱 관리</a></li>
                    <li><a href="#">눈/귀/구강관리</a></li>
                    <li><a href="#">미용/털관리</a></li>
                </ul>  
            <input id="sub-group-list4" type="checkbox" hidden />
            <label for="sub-group-list4"><span class="fa fa-angle-right"></span>위생/배변</label>
                <ul class="sub-group-list">
                    <li><a href="#">배변용품</a></li>
                    <li><a href="#">위생용품</a></li>
                    <li><a href="#">털제거/청소용품</a></li>
                </ul>        
            <input id="sub-group-list5" type="checkbox" hidden />
            <label for="sub-group-list5"><span class="fa fa-angle-right"></span>장난감</label>
                <ul class="sub-group-list">
                    <li><a href="#">봉제장난감</a></li>
                    <li><a href="#">치실장난감</a></li>
                    <li><a href="#">고무장난감</a></li>
                    <li><a href="#">나무장난감</a></li>
                    <li><a href="#">공/원반</a></li>
                </ul>        
        </ul>
    </li>
    </ul>
</nav>


<!-- 리스트 부분-->
<ul class="product_list">
<li>
	<dl class="dl">
    <dt class="dt"><a href="#a">진저맨 피카부 토이</a></dt>
    <dd class="thumbnail"><a href="#a"><img src="images/11.jpg" alt=""></a></dd>
    <dd class="price">19,000</dd>
    <dd class="btm">
    	<div>122개 구매</div>
    	<div><a href="#a"><img src="images/ico_heart.jpg" alt="">찜 21</a></div>
    </dd>
    </dl>
</li>
<li>
	<dl class="dl">
    <dt class="dt"><a href="#a">마사지 부러쉬</a></dt>
    <dd class="thumbnail"><a href="#a"><img src="images/22.jpg" alt=""></a></dd>
    <dd class="price">9,000</dd>
    <dd class="btm">
    	<div>1,688개 구매</div>
    	<div><a href="#a"><img src="images/ico_heart.jpg" alt="">찜 160</a></div>
    </dd>
    </dl>
</li>
<li>
	<dl class="dl">
    <dt class="dt"><a href="#a">BOGS 아동 방한 부츠</a></dt>
    <dd class="thumbnail"><a href="#a"><img src="images/33.jpg" alt=""></a></dd>
    <dd class="price">18,000</dd>
    <dd class="btm">
    	<div>12개 구매</div>
    	<div><a href="#a"><img src="images/ico_heart.jpg" alt="">찜 3</a></div>
    </dd>
    </dl>
</li>
<li>
	<dl class="dl">
    <dt class="dt"><a href="#a">산타 루돌프 라이트볼 & 펭귄 스노우맨 라이트볼</a></dt>
    <dd class="thumbnail"><a href="#a"><img src="images/44.jpg" alt=""></a></dd>
    <dd class="price">22,000</dd>
    <dd class="btm">
    	<div>77개 구매</div>
    	<div><a href="#a"><img src="images/ico_heart.jpg" alt="">찜 21</a></div>
    </dd>
    </dl>
</li>
<li>
	<dl class="dl">
    <dt class="dt"><a href="#a">삼계탕 한 그릇 플레이키트</a></dt>
    <dd class="thumbnail"><a href="#a"><img src="images/55.jpg" alt=""></a></dd>
    <dd class="price">25,000</dd>
    <dd class="btm">
    	<div>188개 구매</div>
    	<div><a href="#a"><img src="images/ico_heart.jpg" alt="">찜 160</a></div>
    </dd>
    </dl>
</li>
<li>
	<dl class="dl">
    <dt class="dt"><a href="#a">줍줍 친환경 풉백</a></dt>
    <dd class="thumbnail"><a href="#a"><img src="images/66.jpg" alt=""></a></dd>
    <dd class="price">5,500</dd>
    <dd class="btm">
    	<div>2,000개 구매</div>
    	<div><a href="#a"><img src="images/ico_heart.jpg" alt="">찜 3</a></div>
    </dd>
</dl>
</li>
</ul>
    
</section>
<div id="footer" class="footer_wrap clearfix"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>
</body>
</html>

