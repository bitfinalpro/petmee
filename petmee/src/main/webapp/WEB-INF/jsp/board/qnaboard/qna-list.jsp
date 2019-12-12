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
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>Pet Me</title>
</head>

<style>
    .top_input {width: 70%; height: 32px; margin: 15px auto; }
    .top_input strong {font-size: 1.2rem; line-height: 2.1rem;}
    .top_input div {width: 40%; display: inline-block; clear: both;}
    .top_input div:nth-child(2) {text-align: right; float: right;}
    .top_input div:nth-child(2) select {height: 29px; vertical-align: middle; border: 1px solid #333;}
    .top_input div:nth-child(2) input {vertical-align: middle; border: 1px solid #333; height: 27px; }
    .top_input div:nth-child(2) button { width: 50px; height: 29px; margin: 10 0; color: #fff;font-weight: bold;
    background-image: linear-gradient(30deg,#333, #333);}
    .notice_tb {width: 70%; margin: 0px auto; border-top: 2px solid #333; text-align: center;}
    .notice_tb tr th {background-color: #e5e5e5; border-right:1px solid #fff; height: 50px; text-align: center;}
    .notice_tb tr td {height: 50px; border-bottom: 2px solid #999;}
    .notice_tb tr td button {width: 50px; height: 30px;}
    .notice_tb tr td button:nth-child(1) { margin: 10 0; color: #fff;font-weight: bold;
    background-image: linear-gradient(30deg,#002a50,#006ecf);}
    .notice_tb tr td button:nth-child(2) { margin: 10 0; color: #fff;font-weight: bold;
    background-image: linear-gradient(30deg,#333, #333);}

    #page {width: 60%; margin: 30px auto; text-align: center;}

    aside {width: 150px; position: absolute; top: 73%; left: 30px; background-color: #fff;}
    aside > div {width: 150px; height: 28px; text-align: center;  background-color: #333; color: #fff;}
    aside > div strong {vertical-align: middle}
    aside > ul li {text-align: center; height: 30px; border-bottom: 2px solid #eee;}
    aside > ul li a { line-height: 1.8rem;}
    .foot_btn {width: 70%; margin: 0 auto; margin-top: 10px;}
          .foot_btn button{width: 80px; height: 30px; margin: 10 0; color: #fff;font-weight: bold;
           background-image: linear-gradient(30deg,#002a50,#006ecf);
           float : right;}
</style>    
<body>
   <div id="header"><c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import></div>
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
        <div id="footer" class="footer_wrap clearfix"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>
    </div>
    </div>
</body>
</html>