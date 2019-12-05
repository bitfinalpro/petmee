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
  <script src="<c:url value="/resources/js/common/jquery-1.12.4.js" /> "></script>
  <link href="../resources/css/common/base.css" rel="stylesheet">
  <link href="../resources/css/qna/style.css" rel="stylesheet"> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <title>Pet Me</title>
</head>
<script type="text/javascript">
	let qnaNo = '${qnaDetail.qnaNo}';
	let cmtPageNo = '${cpr.pageNo}';
	// let UserGrade = '${sessionScope.user.userGrade}';
	// let UserNo = '${sessionScope.user.userNo}';

    $(document).ready(function(){
       $("#header").load("menu.html")    
    });
    $(document).ready(function(){
       $("#footer").load("footer.html")    
    });
</script>
	<script src="<c:url value='/resources/js/qna/like.js' />"></script>
    <script src="<c:url value='/resources/js/qna/qnaComment.js' />"></script>
    <script src="<c:url value='/resources/js/qna/qnaWriteCheckForm.js' />"></script>
<body>
   <div id="header"><c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import></div>
    <div>
        <section class="qna-content" style="margin-bottom:0">
            <h1 class="qna-title">Q & A</h1>
           
            <div class="qna-table">
                <ul class="qna-TableListHead">
                    <li>
                        <span>${board.qnaNo}</span>
                        <span>${board.qnaTitle}</span>
                        <span>${board.qnaWriter}</span>
                        <span><fmt:formatDate value="${board.qnaRegDate}" pattern="MM-dd hh:mm"/></span>
                        <span>조회수${board.viewCnt}</span>
                    </li>
     
                </ul>
                <ul class="qna-TableDetailBody">
                  <li>
                    ${board.qnaContent}
                  </li>                  
                </ul>
                <a class="qna-qna_like" href="javascript:;" onclick="likeUpdateAjax(${qnaDetail.qnaNo}, ${pr.pageNo})">
                   <!-- <i class="far fa-thumbs-up fa-2x" id="likeUpdate">1</i> -->
                    <i class="far fa-thumbs-up fa-2x" id="likeUpdate">${qnaDetail.likeCnt}</i>
                </a>
                <ul class="qna-TableListBody">
         		        <div id="qna-list"></div>
                </ul>
             
		              <div class="qna-go_update"> 
			            <a href="qna-updateForm.do?no=${board.qnaNo}"> 
			               	 수정
			            </a>
		              </div>
			            <a class="qna-go_delete" href="qna-delete.do?no=${board.qnaNo}"> 
			              <div> 
			               	 삭제
			              </div>
			            </a>
	           
    
 		<div class="qna-coment_list">
          <div id="qna-cmt"></div>
           <div class="qna-member_coment">
 															
        <form  method="post" name="updateForm" onsubmit="return inputCheck();">
				<input type="hidden" name="boardqnaNo" value="${qnaDetail.qnaNo}" />
				<input type="hidden" name="cmtNo" value="${param.cmtNo}" />
				<input type="hidden" name="pageNo" value="${pr.pageNo}" />
				<input type="hidden" name="cmtPageNo" value="${cpr.pageNo}" />
        <div id="AjaxCmtList">      
          
          <c:if test="${empty comment}">
				 <tr>
				    <td colspan='4'>댓글이 존재하지 않습니다.</td>
				 </tr>
			</c:if>	 
       
      </div>
			</form>	

			 </div>
		
       </div>
      </div>
      </div>
				<form class="qna-comment_write" method="post" 
			       name="writeForm" onsubmit="return inputCheck();">
                    <input type="text" name=cmtContent id="cmtContent" class="qna-comment_write" placeholder="댓글을 입력하세요">
                    <input type="hidden" name="userNo" value="${sessionScope.user.userNo}"/>
                    <input type="hidden" name="boardqnaNo" value="${qnaDetail.qnaNo}"/>
                    <input type="hidden" name="pageNo" value="${pr.pageNo}"/>
                  	<button onclick="inputCheck();" type="button" class="qna-comment_do">등록</button>
				</form>
            </div>
          
          
             
           <c:choose>
	          <c:when test="${ not empty sessionScope.user.userNo }">
		          <a class="qna-go_write" href="/petmee/qna/qna-writeForm.do"> 
		            <div> 
		            	  글쓰기
		            </div>
		          </a>
	          </c:when>
	          <c:otherwise></c:otherwise>
           </c:choose>
          
          
           <div class="qna-table">
              <ul class="qna-TableListHead">
                  <li>
                      <span>번호</span>
                      <span>제목</span>
                      <span>작성자</span>
                      <span>작성일</span>
                      <span>조회수</span>
                  </li>
              </ul>
              <ul class="qna-TableListBody">
                  <c:forEach var="b" items="${list}">
                  	<li>
                      <span>${b.qnaNo}</span>
                      <span><a href="qna-detail.do?no=${b.qnaNo}">${b.qnaTitle}</a></span>
                      <span>${b.qnaWriter}</span>
                      <span><fmt:formatDate pattern="yyyy-MM-dd" value="${b.qnaRegDate}" /></span>
                      <span>${b.viewCnt}</span>
                    </li>
                   </c:forEach> 
                   <c:if test="${empty list}">
                       <li >
                          <span></span>
                          <span colspan='5'>입력된 게시물이 없습니다.</span>
                       </li>
                    </c:if>
                </ul>
                   
    
              <!--    <c:if test="${sessionScope.user.userGrade eq 3 }">  --> 
                 <a class="qna-go_write" href="/petmee/jsp/qna/qna-write.do"> 
                  <div> 
                      	글쓰기
                  </div>
                </a>
        <!--  </c:if> --> 
              <!-- 검색창 -->
				<div class='qna-container' tabindex='1'>
					<div class='qna-search-container' tabindex='1'>
						<input class='qna-input' id='qna-input-content' placeholder='search' type='text'> 				
						<a class='qna-button' id='qna-submit-button'>
							<i class="fa fa-search icon-search" ></i>
						</a>	
					</div>
						<a class='qna-button' id='qna-refresh-button'>
							<i class="fa fa-retweet icon-search" ></i>
						</a>
				</div>
          
        </section>
    </div>
    <div id="footer" class="footer_wrap clearfix"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>
  </div>
  </div>
</body>
</html>