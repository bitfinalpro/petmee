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
  <%@ include file="/WEB-INF/jsp/include/includecss.jsp" %>
<%@ include file="/WEB-INF/jsp/include/includejs.jsp" %>
    <link rel="stylesheet" href="<c:url value="/resources/css/free/detail.css" /> ">
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
           <h2 class="free"><i class="fas fa-users"></i> Q&A게시판</h2>
       </div>
   </section>
<section id="layout">
       <div class="freeboard">
           <div class="board_list">
                <div id="types">
                      <div class="ll">
                          <div class="left" style="font-size: 24px;"> <c:out value="${board.qnaTitle}" /></div>
                            <div class="right" style="font-size: 16px;"><i class="far fa-clock"></i> <fmt:formatDate value="${board.qnaRegDate}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
                       </div>
               </div>
               <div id="types1">
                   <div class="ll">
                         <div class="left" style="margin-top: 3px;"><i class="far fa-user"></i> ${board.qnaWriter}</div>
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
                          <c:out value="${board.qnaContent}" />
                   </div>
                   <div class="button">
                       <a href="qna-updateform.do?no=${board.qnaNo}"><button class="b1">수정</button></a>
                       <a href="qna-delete.do?no=${board.qnaNo}"><button class="b1">삭제</button></a>
                       <a href="<c:url value="/board/qnaboard/qna-list.do" />"><button class="b1">목록</button></a>
                   </div>
                     <form id="crForm" method="post" action="comment_regist.do" >
                        <input type="hidden" id="no" value="${board.qnaNo}" />  
                        <textarea type="text" placeholder="댓글을 입력해주세요" class="comment" id="content"></textarea>
                         <input type="hidden" id="writer" value="" /> 
                         <button type="submit" class="comment1" >등록</button>
                      </form>
                   <div class="comlist" id="commentList">
  
                   </div>
               </div>
   </section>
        <div id="footer" class="footer_wrap clearfix">
        <c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
        </div>
         <script>
           let no = ${board.qnaNo};
         </script>
        
        <script src="<c:url value='/resources/js/freeboard.js' />"></script>
</body>

</html>
