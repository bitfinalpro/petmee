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
  <link href="<c:url value="/resources/css/shopping/login/login3.css " />" rel="stylesheet">
  <link href="<c:url value="/resources/css/shopping/login/join1.css " />" rel="stylesheet">
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
            <c:import url="/WEB-INF/jsp/common/menu1.jsp"></c:import>
        </div>
<section id="wrap">
    <img src="<c:url value="/resources/images/main/1231.jpg"/>" style="width: 100%;"/>  
       <div class="background">
           <h2 class="free"><i class="fas fa-users"></i> Q&A게시판</h2>
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
                         <div class="right">
                         <div id="view"><i class="far fa-eye"></i> ${board.viewCnt}</div>
                         <div id="report" class="right"><img src="<c:url value="/resources/images/board/common/report.png" />"><button onclick="document.location.href='#popup'">신고</button></div>
                         </div>
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
                       <c:when test="${board.email == user.name || board.email == user.name eq 'admin' }">
                       <a href="qna-updateform.do?no=${board.no}"><button class="b1">수정</button></a>
                       <a href="qna-delete.do?no=${board.no}"><button class="b1">삭제</button></a>
                       <a href="<c:url value="/board/qnaboard/qna-list.do" />"><button class="b1">목록</button></a>
                     </c:when>
                     <c:otherwise>
                       <a href="<c:url value="/board/qnaboard/qna-list.do" />"><button class="b1">목록</button></a>
                     </c:otherwise>
                     </c:choose>                    
                   </div>
                     <form id="crForm" method="post" action="comment_regist.do" >
                        <input type="hidden" id="no" value="${board.no}" />
                        <c:if test="${user.email eq 'admin'}">
                        <textarea placeholder="댓글을 입력해주세요" class="comment" id="content"></textarea>
                         <input type="hidden" id="email" name="email" value="${user.name}" /> 
                         <button type="submit" class="comment1" >등록</button>
                         </c:if>
                      </form>
                      
             <!-- 모달창 시작 -->
              <div id="popup" class="layer">
                <div class="box">
                  <div class="s"><strong>신고하기</strong></div>
                  <hr>
                     <div class="reporttitle" data-type="QnA">
                       <div class="reporttype" data-type="게시글">
                      <ul>
                        <li><strong>작성자</strong> :<div class="userbox">&nbsp; ${board.email} </div></li>
                        <li><strong>제 목</strong>  : <div class="userbox">&nbsp; ${board.title}</div></li>
                      </ul>
                      <input type="hidden" id="reportEmail" value="${board.email}"/>
                      </div>
                     </div>
                     <hr>
                     <div>
                       <span><strong>사유선택</strong> : 대표적인 1가지만 선택해주세요. </span>
                     </div>
                       <form action='<c:url value="/admin/user/reportlist.do"/>' method="post" name="reportform">
                     <div>
                        <ul class="reportli">
                          <li><input type="radio" name="report" value="음란성 게시물"> 음란성 게시물
                          <li><input type="radio" name="report" value="광고성 게시물"> 광고성 게시물
                          <li><input type="radio" name="report" value="욕설/반말/부적절한 언어"> 욕설/반말/부적절한 언어
                          <li><input type="radio" name="report" value="도배성 게시물"> 도배성 게시물
                          <li><input type="radio" name="report" value="명예훼손/사생활 침해 및 저작권 침해"> 명예훼손/사생활 침해 및 저작권 침해
                        </ul>
                        <hr>
                        <span><strong>기타 내용</strong> : </span>
                        <div>
                          <textarea class="reportcontent"></textarea>
                        </div>
                     </div>
                  <input type="button" value="신고" onclick="report_chk();" />
                  <a href="#" class="close">닫기</a>
                  </form>
                </div>                   
              </div>
            <!-- 모달창 끝 -->
                   <div class="comlist" id="commentList">
                   </div>
               </div>
               <div>
           </div>
   </section>
        <div id="footer">
        <c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
        </div>
         <script>
           let no = ${board.no};
           let contentVal = "${board.content}";
           let titleVal = "${board.title}";
         </script>
        
        <script src="<c:url value='/resources/js/freeboard.js' />"></script>
        <script src="<c:url value='/resources/js/admin/userreport.js' />"></script>
        <script src="../js/lib/jquery.magnific-popup.js"></script>
	<script src="../js/lib/jquery.mCustomScrollbar.min.js"></script>	
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
</body>

</html>
