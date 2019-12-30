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
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/free/free.css" />">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
  .btnpagebtn{
  /* padding: 6px 12px !important; */
  }
  </style>
  <title>Pet Me</title>
</head>

<body>
  <div id="header">
      <c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
  </div>
    <!-- 사이드메뉴 -->
    <section id="wrap" >
            <img src="<c:url value="/resources/images/main/1231.jpg"/>" style="width: 100%;">
        <c:import url="/WEB-INF/jsp/common/sideMenu.jsp"></c:import>   

        <div class="top_input">
            <div>
                <strong>자유게시판</strong>
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
         <c:if test="${b.type eq 'free'}">
         <tr>
                <td>${b.no}</td>
                <td><a href="detail.do?no=${b.no}&keyword=${keyword}&searchText=${searchText}">${b.title}</a></td>
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
        <div class="foot_btn"><button type="button" onclick="location.href='<c:url value="/board/freeboard/writeform.do"/>'">글 등록</button></div>
        </c:otherwise>
        </c:choose>
        <!-- 페이징   -->
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
    <li <c:if test="${pr.pageNo == i }">class="active"</c:if>><a class="btnpagebtn" href="list.do?pageNo=${i}">${i}</a></li>
    </c:forEach>
    <c:if test="${pr.next}" >
    <li>
      <a <%-- class="btnpagebtn" --%> href="list.do?pageNo=${pr.endPage + 1} " aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
  </ul>
</nav>
		</c:if>
        </div>
    </section>  
        <div id="footer" class="footer_wrap clearfix">
        <c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
        </div>
</body>
</html>