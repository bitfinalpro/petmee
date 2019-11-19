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
<%@ include file="/WEB-INF/jsp/include/includejs.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/notice/detail.css" />">
</head>
<style>
</style>
<body>
  <div id="header"><c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import></div>
    <section>
   <div class="body">
       <div class="background">
           <h2 class="free"><i class="fas fa-users"></i> 자유게시판</h2>
       </div>
   </section>
<section id="layout">
       <div class="freeboard">
           <div class="board_list">
                <div id="types">
                      <div class="ll">
                          <div class="left" style="font-size: 24px;"> <c:out value="${board.title}" /></div>
                          <div class="right" style="font-size: 16px;"><i class="far fa-clock"></i> <fmt:formatDate value="${board.date}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
                       </div>
               </div>
               <div id="types1">
                   <div class="ll">
                         <div class="left" style="margin-top: 3px;"><i class="far fa-user"></i> ${board.writer}</div>
                         <div class="right"><i class="far fa-eye"></i> ${board.viewCnt}</div>
                   </div>
               </div>
           </div>
           <!--
                   <div id="pic">
                       <img src="../resources/images/image/holly.jpg">
                   </div>
                   -->
                   <div class="title">
                          <c:out value="${board.content}" />
                   </div>
                   <div class="button">
                       <button><a href="#" class="b1" type="button">수정</a></button>
                       <button><a href="#" class="b1" type="button">삭제</a></button>
                       <button><a href="<c:url value="/board/notice/notice.do" />" class="b1">목록</a></button>
                   </div>
                   <div class="com">
                       <textarea type="text" placeholder="댓글을 입력해주세요" class="comment"></textarea>
                       <button type="button" class="comment1"">등록</button>
                   </div>
                   <div class="comlist">
                             <div class="nick">권성진</div>
                             <div class="time">19.11.13 09:43</div>
                             <br><br>
				<div class="com_content">가세요</div>
                   <div class="com_com">
                       <button class="b2" type="button">수정</button>
                       <button class="b2" type="button">삭제</button>
                   </div>
                   </div>
               </div>
   </section>
        <div id="footer" class="footer_wrap clearfix"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>
</body>
</html>