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
    $(document).ready(function(){
       $("#header").load("menu.html")    
    });
    $(document).ready(function(){
       $("#footer").load("footer.html")    
    });
    let qnaNo = '${qnaDetail.qnaNo}';
    let cmtPageNo = '${cpr.pageNo}';
    let UserGrade = '${sessionScope.user.userGrade}';
    let UserNo = '${sessionScope.user.userNo}';
</script>
	<script src="<c:url value='/resources/qna/js/like.js' />"></script>
    <script src="<c:url value='/resources/qna/js/qnaComment.js' />"></script>
    <script src="<c:url value='/resources/qna/js/qnaWriteCheckForm.js' />"></script>
<body>
   <div id="header">
        <%@include file="/WEB-INF/include/menu.jsp" %>
    </div>
    <div>
        <section class="qna-content" style="margin-bottom:0">
            <h1 class="qna-title">질문 답변</h1>
            <!--<div class="qna-remote">
              <ul>
                <li>
                    <a href="#qna-top"><i class="fas fa-angle-double-up fa-2x"></i></a>
                    <a href="#qna-list"><i class="fas fa-align-justify fa-2x"></i></a>
                    <a href="#qna-bottom"><i class="fas fa-angle-double-down fa-2x"></i></a>
                </li>
              </ul>
            </div> -->
            <div class="qna-table">
                <ul class="qna-TableListHead">
                    <li >
                    <li >
                        <span>${qnaDetail.qnaNo}</span>
                        <span>${qnaDetail.title}</span>
                        <span>${qnaDetail.writer }</span>
                        <span><fmt:formatDate value="${qnaDetail.regDt}" pattern="MM-dd hh:mm"/></span>
                        <span>조회수${qnaDetail.viewCnt}</span>
                    </li>
     
                </ul>
                <ul class="qna-TableDetailBody">
                  <li>
                    ${qnaDetail.content}
                  </li>                  
                </ul>
                <a class="qna-qna_like" href="javascript:;" onclick="likeUpdateAjax(${qnaDetail.qnaNo}, ${sessionScope.user.userNo}, ${pr.pageNo})">
                   <!-- <i class="far fa-thumbs-up fa-2x" id="likeUpdate">1</i> -->
                    <i class="far fa-thumbs-up fa-2x" id="likeUpdate">${qnaDetail.likeCnt}</i>
                </a>
                <ul class="qna-TableListBody">
         		        <div id="qna-list"></div>
                </ul>
             <c:choose>
	             <c:when test="${qnaDetail.userNo eq sessionScope.user.userNo || sessionScope.user.userGrade eq 3 }">   
		              <div class="qna-go_update"> 
			            <a  href="/petmee/qna/updateQnaForm.do?qnaNo=${qnaDetail.qnaNo}"> 
			               	 수정
			            </a>
		              </div>
			            <a class="qna-go_delete" href="/petmee/qna/qnadelete.do?qnaNo=${qnaDetail.qnaNo}"> 
			              <div> 
			               	 삭제
			              </div>
			            </a>
	             </c:when>
	             <c:otherwise></c:otherwise>
             </c:choose>
    
 		<div class="qna-coment_list">
          <div id="qna-cmt"></div>
           <div class="qna-member_coment">
 															
        <form  method="post" name="updateForm" onsubmit="return inputCheck();">
				<input type="hidden" name="boardqnaNo" value="${qnaDetail.qnaNo}" />
				<input type="hidden" name="cmtNo" value="${param.cmtNo}" />
				<input type="hidden" name="pageNo" value="${pr.pageNo}" />
				<input type="hidden" name="cmtPageNo" value="${cpr.pageNo}" />
        <div id="AjaxCmtList">      
          <!--
          <c:if test="${empty comment}">
				 <tr>
				    <td colspan='4'>댓글이 존재하지 않습니다.</td>
				 </tr>
			</c:if>	 
        -->
      </div>
			</form>	
      <!--
			<c:if test="${cpr.count > 10}">
             <div>
	             <ul class="pagination cmt_nams">
			      	 <c:if test="${cpr.count != 0}">
					  	<c:if test="${cpr.prev}">
					    <li>
					      <a href="qna-detail.do?qnaNo=${qnaDetail.qnaNo}&pageNo=${pr.pageNo}&CmtPageNo=${cpr.beginPage - 1}" aria-label="previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    </c:if>
					    <c:forEach var="i" begin="${cpr.beginPage}" end="${cpr.endPage}">
							<li <c:if test="${cpr.pageNo == i}">class="active"</c:if>>
								<a href="qna-detail.do?qnaNo=${qnaDetail.qnaNo}&pageNo=${pr.pageNo}&CmtPageNo=${i}">${i}</a>
							</li>
					    </c:forEach>
					  	<c:if test="${cpr.next}">
					    <li>
					      <a href="qna-detail.do?qnaNo=${qnaDetail.qnaNo}&pageNo=${pr.pageNo}&CmtPageNo=${cpr.endPage + 1}" aria-label="next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
              </c:if>
          </c:if>
        -->
				</ul>
			 </div>
			</c:if>
       </div>
      </div>
      <!--
				<form class="qna-comment_write" method="post" 
			       name="writeForm" onsubmit="return inputCheck();">
                    <input type="text" name=cmtContent id="cmtContent" class="qna-comment_write" placeholder="댓글을 입력하세요">
                    <input type="hidden" name="userNo" value="${sessionScope.user.userNo}"/>
                    <input type="hidden" name="boardqnaNo" value="${qnaDetail.qnaNo}"/>
                    <input type="hidden" name="pageNo" value="${pr.pageNo}"/>
                  	<button onclick="inputCheck();" type="button" class="qna-comment_do">등록</button>
				</form>
            </div>
          
           <c:if test="${pr.count > 10 }"> 
             <ul class="pagination nams">
	             <c:if test="${pr.count != 0}">
				  	<c:if test="${pr.prev}">
					    <li>
					      <a href="qna_detail.do?qnaNo=${qnaDetail.qnaNo}&pageNo=${pr.beginPage - 1}&searchType=${search.searchType}&searchWord=${search.searchWord}" aria-label="previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
				    	<li <c:if test="${pr.pageNo == i}">class="active"</c:if>>
				    	<a href="qna_detail.do?qnaNo=${qnaDetail.qnaNo}&pageNo=${i}&searchType=${search.searchType}&searchWord=${search.searchWord}">${i}</a></li>
				    </c:forEach>
				  	<c:if test="${pr.next}">
					    <li>
					      <a href="qna_detail.do?qnaNo=${qnaDetail.qnaNo}&pageNo=${pr.endPage + 1}&searchType=${search.searchType}&searchWord=${search.searchWord}" aria-label="next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				</c:if>
			</ul>
           </c:if>
             
           <c:choose>
	          <c:when test="${ not empty sessionScope.user.userNo }">
		          <a class="qna-go_write" href="/petmee/qna/qna_write_form.do"> 
		            <div> 
		            	  글쓰기
		            </div>
		          </a>
	          </c:when>
	          <c:otherwise></c:otherwise>
           </c:choose>
          
          -->
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
                 <li>
                   <span>2</span>
                   <span>와이파이 비밀번호</span>
                   <span>admin</span>
                   <span>2019-11-15</span>
                   <span>2</span>
                </li>
                 <li>
                   <span>1</span>
                   <span>와이파이 비밀번호</span>
                   <span>admin</span>
                   <span>2019-11-15</span>
                   <span>5</span>
                </li>
    
                 <c:if test="${sessionScope.user.userGrade eq 3 }">  
                 <a class="qna-go_write" href="/petmee/jsp/qna/qna-write.do"> 
                  <div> 
                      글쓰기
                  </div>
                </a>
          </c:if>
            <!-- 검색창 -->
            <div class="qna-search">
                <form method="post" action="/petmee/qna/qnaList.do">
                  <div class='qna-container' tabindex='1'>
                  <div class='qna-search-container' tabindex='1'>
                    <input class='qna-input' id='qna-input-content' placeholder='search' type='text'> 				
                      <a class='qna-button' id='qna-submit-button'>
                        <i class="fa fa-search" aria-hidden="true"></i>
                      </a>	
                  </div>
                    <a class='qna-button' id='qna-refresh-button'>
                      <i class="fa fa-retweet" aria-hidden="true"></i>
                    </a>
                  </div>
                </form>
                 </div>
          
        </section>
    </div>
    <div id="footer" class="footer_wrap clearfix">
    	<%@include file="/WEB-INF/include/footer.jsp" %> 
     </div>
  </div>
  </div>
</body>
</html>