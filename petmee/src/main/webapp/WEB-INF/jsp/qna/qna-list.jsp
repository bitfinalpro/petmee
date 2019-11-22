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
</script>
<body>
   <div id="header">
        <%@include file="/WEB-INF/include/menu.jsp" %>
    </div>
           <div>
                <section class="qna-content" style="margin-bottom:0">
                
                   <h1 class="qna-title">Q & A</h1>
                   
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
                             <span><fmt:formatDate value="${b.qnaRegDate}" pattern="yyyy-MM-dd"/></span>
                             <span>${b.viewCnt}</span>
                         </li>
                       </c:forEach> 
                       <c:if test="${empty list}">
                       <li >
                           <span></span>
                           <span colspan='4'>입력된 게시물이 없습니다.</span>
                          </li>
                        </c:if>
                      </ul>
                    </div>
                   
                   <!-- 페이징   -->
        <div id="page">
            	<c:if test="${pr.count != 0 }">
		<nav>
  <ul class="pagination">
  <c:if test="${pr.prev }">
    <li>
      <a href="qna-list.do?pageNo=${pr.beginPage - 1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    <c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage}">
    <li <c:if test="${pr.pageNo == i }">class="active"</c:if>><a href="qna-list.do?pageNo=${i}">${i}</a></li>
    </c:forEach>
    <c:if test="${pr.next }" >
    <li>
      <a href="qna-list.do?pageNo=${pr.endPage + 1} " aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
  </ul>
</nav>
		</c:if>
        </div>
        		
                   <div class="qna-go_write"><button type="button" onclick="location.href='<c:url value="/qna/qna-writeform.do"/>'">글 쓰기</button></div>
                   
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
        <div id="footer" class="footer_wrap clearfix"> 
        <%@include file="/WEB-INF/include/footer.jsp" %> 
        </div>
    </div>
    </div>
</body>
</html>