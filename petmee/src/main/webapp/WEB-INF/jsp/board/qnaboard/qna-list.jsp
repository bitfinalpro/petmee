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

    aside {width: 150px; position: absolute; top: 78%; left: 30px; background-color: #fff;}
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
  <div id="header">
        <c:import url="/WEB-INF/jsp/common/menu1.jsp"></c:import>
    </div>
    <!-- 사이드메뉴 -->
    <section id="wrap" >
            <img src="<c:url value="/resources/images/main/1231.jpg"/>" style="width: 100%;">
        <c:import url="/WEB-INF/jsp/common/sideMenu.jsp"></c:import>   

        <div class="top_input">
            <div>
                <strong>Q&A게시판</strong>
            </div>
            <div>
                <select name="searchkeyword" id="top_sel">
                    <option value="0">전체</option>
                    <option value="1">작성자</option>
                    <option value="2">제목</option>
                    <option value="3">작성자+제목</option>
                </select>
                <input type="text"  id="searchtext" placeholder="검색어 입력" />
                <button id="searchbutton">검색</button>
            </div>
        </div>
        <table class="notice_tb">
            <colgroup>
                <col width=7%;>
                <col width=50%;>
                <col width=7%;>
                <col width=10%;>
                <col width=7%;>
                <col width=10%;>
            </colgroup>
            <tr>
                <th>NO</th>
                <th>TITLE</th>
                <th>WRITER</th>
                <th>DATE</th>
                <th>VIEW</th>
            </tr>
            <c:if test="${empty list}">
               <tr>
                   <td colspan="5">게시물이 없습니다.</td>
            </tr>
         </c:if>
         <c:set var="cnt" value="${listSize - (pr.pageNo - 1) * 10}"/>
         <c:forEach var="b" items="${list}">
         <c:if test="${b.type eq 'QnA'}">
         <tr>
                <td>${cnt}<c:set var="cnt" value="${cnt-1}"/></td>
                <td><a href="qna-detail.do?no=${b.no}&keyword=${keyword}&searchText=${searchText}">${b.title}</a></td>
                <td>${b.email}</td>
                <td><i class="far fa-clock"></i> <fmt:formatDate pattern="yyyy-MM-dd" value="${b.regDate}" /> </td>
                <td><i class="far fa-eye"></i> ${b.viewCnt}</td>
            </tr>
            </c:if>
                </c:forEach>
        </table>
        <c:choose>
        <c:when test="${user.email==null}">
        </c:when>
        <c:otherwise>
        <div class="foot_btn"><button type="button" onclick="location.href='<c:url value="/board/qnaboard/qna-writeform.do"/>'">글 등록</button></div>
        </c:otherwise>
        </c:choose>        
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
    </section>  
        <div id="footer">
        <c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
        </div>
        <script src="<c:url value='/resources/js/freeboard.js' />"></script>
        <script src="../js/lib/jquery.magnific-popup.js"></script>
	<script src="../js/lib/jquery.mCustomScrollbar.min.js"></script>	
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
</body>
</html>