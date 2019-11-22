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
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/volunteer/volunteerreview.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/page.css" />">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>Pet Me</title>
</head>

 
<body>
  <div id="header"><c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import></div>
    <section id="wrap" >
        <c:import url="/WEB-INF/jsp/common/sideMenu.jsp"></c:import>
        <img src="<c:url value="/resources/images/main/1231.jpg"/>" style="width: 100%;"/>   
        <div class="top_input">
            <div>
                <strong>자원봉사 후기 게시판</strong>
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
         <c:forEach var="b" items="${list}">
         <tr>
                <td>${b.no}</td>
                <td><a href="detail.do?no=${b.no}">${b.title}</a></td>
                <td>${b.writer}</td>
                <td><i class="far fa-clock"></i> <fmt:formatDate pattern="yyyy-MM-dd" value="${b.regDate}" /> </td>
                <td><i class="far fa-eye"></i> ${b.viewCnt}</td>
            </tr>
                </c:forEach>
        </table>
        <div class="foot_btn"><button type="button" onclick="location.href='<c:url value="/board/volunteerreviewboard/writeform.do"/>'">글 등록</button></div>
         <div id="page">
            	<c:if test="${pr.count != 0 }">
		<nav>
  <ul class="pagination">
  <c:if test="${pr.prev }">
    <li>
      <a href="list.do?pageNo=${pr.beginPage - 1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    <c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage}">
    <li <c:if test="${pr.pageNo == i }">class="active"</c:if>><a href="list.do?pageNo=${i}">${i}</a></li>
    </c:forEach>
    <c:if test="${pr.next }" >
    <li>
      <a href="list.do?pageNo=${pr.endPage + 1} " aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
  </ul>
</nav>
		</c:if>
        </div>
    </section>  
    <style>.foot_btn {width: 70%; margin: 0 auto; margin-top: 10px; }
           .foot_btn button{width: 80px; height: 30px; margin: 10 0; color: #fff;font-weight: bold;
            background-image: linear-gradient(30deg,#002a50,#006ecf);
            float : right;}</style>
        <div id="footer" class="footer_wrap clearfix">
           <c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
        </div>
        <script src="<c:url value='/resources/js/volunteer.js' />"></script>
</body>
</html>