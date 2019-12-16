<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
<%@ include file="/WEB-INF/jsp/include/includecss.jsp" %>
<%@ include file="/WEB-INF/jsp/include/includejs.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board/notice.css" />">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
</style>
<body>
  <div id="header"><c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import></div>
    <section id="wrap" >
        <c:import url="/WEB-INF/jsp/common/sideMenu.jsp"></c:import>
        <img src="<c:url value="/resources/images/main/1231.jpg"/>" style="width: 100%;"/>    
        <div class="top_input">
            <div>
                <strong>공지사항</strong>
            </div>
            <div>
                <select name="" id="top_sel">
                    <option>전체</option>
                </select>
                <input type="text"  placeholder="검색어 입력" />
                <button>검색</button>
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
                <th>email</th>
                <th>DATE</th>
                <th>VIEW</th>
                <th></th>
            </tr>
              <c:if test="${empty list}">
					<tr>
						<td colspan="5">게시물이 없습니다.</td>
					</tr>				
				</c:if>
			<c:forEach var="b" items="${list}">
				<tr onclick="document.location.href='detail.do?no=${b.no}'">
					<c:choose>
					<c:when test="${b.topChk eq 1}" >
						<td style="display:none">${b.no}</td>
						<td><img src="<c:url value="/resources/images/board/notice/dog_img.png"/>" style="height: 70%;"/></td>
					</c:when>
					<c:when test="${b.topChk eq 0}" >
						<td>${b.no}</td>
					</c:when>
					</c:choose>
					<td>${b.title}</td>
					<td>${b.email}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${b.regDate}" /></td>
					<td>${b.viewCnt}</td>
					<td>
                     <a href="<c:url value="/board/noticeboard/updateform.do?no=${b.no}"/> "><button>수정</button></a>
                     <a href="<c:url value="/board/noticeboard/delete.do?no=${b.no}"/> "><button>삭제</button></a>
                   </td>
				</tr>
			</c:forEach>
        </table>
        <style>
        .foot_btn {width: 70%; margin: 0 auto; margin-top: 10px;}
           .foot_btn button{width: 80px; height: 30px; margin: 10 0; color: #fff;font-weight: bold;
            background-image: linear-gradient(30deg,#002a50,#006ecf);
            float : right;}</style>
        <div class="foot_btn"><a href="<c:url value="/board/noticeboard/writeform.do"/>"><button>글 등록</button></a></div>
        
        <div id="page" >
        <nav>
  <ul class="pagination">
  <c:if test="${pr.prev}">
    <li>
      <a href="notice.do?pageNo=${pr.beginPage - 1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
    <li <c:if test="${pr.pageNo == i}">class="active"</c:if>><a href="notice.do?pageNo=${i}">${i}</a></li>
    </c:forEach>
    <c:if test="${pr.next}">
    <li>
      <a href="notice.do?pageNo=${pr.endPage + 1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
  </ul>
</nav>
	</div>
    </section>  
        <div id="footer" class="footer_wrap clearfix"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>
</body>
</html>