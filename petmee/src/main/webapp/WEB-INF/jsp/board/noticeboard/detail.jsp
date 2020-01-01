<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
<%@ include file="/WEB-INF/jsp/include/includecss.jsp" %>
<script type="text/javascript" src="<c:url value="/resources/js/common/jquery-3.4.1.js" />"></script>
<%@ include file="/WEB-INF/jsp/include/includejs.jsp" %>
<link href="<c:url value="/resources/css/shopping/login/login2.css " />" rel="stylesheet">
	<link href="<c:url value="/resources/css/shopping/login/join.css " />" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board/notice.css" />">
</head>
<style>
</style>
<body>
  <div id="header"><c:import url="/WEB-INF/jsp/common/menu1.jsp"></c:import></div>
    <section id="wrap">
    <img src="<c:url value="/resources/images/main/1231.jpg"/>" style="width: 100%;"/>  
       <div class="background">
           <h2 class="free"><i class="fas fa-users"></i> 공지게시판</h2>
       </div>
   </section>
<section id="layout">
       <div class="freeboard">
           <div class="board_list">
                <div id="types">
                      <div class="ll">
                          <div class="left" style="font-size: 24px;"> <c:out value="${board.title}" /></div>
                          <div class="right" style="font-size: 16px;"><i class="far fa-clock"></i> <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
                       </div>
               </div>
               <div id="types1">
                   <div class="ll">
                         <div class="left" style="margin-top: 3px;"><i class="far fa-user"></i> ${board.email}</div>
                         <div class="right"><i class="far fa-eye"></i> ${board.viewCnt}</div>
                   </div>
               </div>
           </div>
           <!--
                   <div id="pic">
                       <img src="../resources/images/image/holly.jpg">
                   </div>
                   -->
                   <div id="Freecontent">
                          <c:out value="${board.content}" />
                   </div>
                   
                   <div class="button">
                     <c:choose>
                       <c:when test="${board.email == user.email}">
                       <a href="<c:url value="/board/noticeboard/updateform.do?no=${board.no}" />"><button class="b1">수정</button></a>
                       <a href="<c:url value="/board/noticeboard/delete.do?no=${board.no}" />"><button class="b1">삭제</button></a>
                       <a href="<c:url value="/board/noticeboard/notice.do"/>"><button class="b1">목록</button></a>
                   </c:when>
                   <c:otherwise>
                       <a href="<c:url value="/board/noticeboard/notice.do"/>"><button class="b1">목록</button></a>
                   </c:otherwise>
                  </c:choose>
                   </div>
               </div>
   </section>
        <div id="footer"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>
        <script src="../js/lib/jquery.magnific-popup.js"></script>
	<script src="../js/lib/jquery.mCustomScrollbar.min.js"></script>	
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
</body>
</html>