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
  <link rel="stylesheet" href="<c:url value="/resources/css/common/gnb.css" />">
  <link href="../resources/css/common/base.css" rel="stylesheet">
  <script src="<c:url value="/resources/js/common/jquery-1.12.4.js" /> "></script>
    <link href="../resources/css/free/detail.css" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <title>Pet Me</title>
  <style>
   #crForm {
       width: 70%;
       margin: 0 auto;
   }
  </style>
</head>
   
<body>
        <div id="header">
            <c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
        </div>
<section>
       <div class="background">
           <h2 class="free"><i class="fas fa-users"></i>자원봉사 후기 게시판</h2>
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
                   <div id="Freecontent">
                          <c:out value="${board.content}" />
                   </div>
                   <div class="button">
                       <a href="updateform.do?no=${board.no}"><button class="b1">수정</button></a>
                       <a href="delete.do?no=${board.no}"><button class="b1">삭제</button></a>
                       <a href="<c:url value="/volunteerreviewboard/list.do" />"><button class="b1">목록</button></a>
                   </div>
                     <form id="crForm" method="post" action="comment_regist.do" >
                        <input type="hidden" id="no" value="${board.no}" />  
                        <textarea type="text" placeholder="댓글을 입력해주세요" class="comment" id="content"></textarea>
                         <input type="hidden" id="writer" value="권성진" /> 
                         <button type="submit" class="comment1" >등록</button>
                      </form>
                   <div class="comlist" id="commentList">
  
                   </div>
               </div>
   </section>
        <div id="footer" class="footer_wrap clearfix"> </div>
         <script>
           let no = ${board.no};
         </script>
        
        <script src="<c:url value='/resources/js/board.js' />"></script>
</body>

</html>