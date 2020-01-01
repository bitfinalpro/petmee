<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="<c:url value='/resources/css/parcel/parcelList.css' />" rel="stylesheet" />

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
a,button,submit{

cursor: pointer;	
}

</style>
<title>Pet Me</title>

</head>

<body>

	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>


	<section id="wrap">
		   <img src="<c:url value="/resources/images/main/1231.jpg"/>" style="width: 100%;">
		<div id="y-container">
			<c:import url="/WEB-INF/jsp/common/sideMenu.jsp"></c:import>

			<div id="y-content">
				<div id="y-parcel-board">
					분양게시판
				</div>
				<div id="y-list">
				
				<c:forEach var="blist" items="${blist}" varStatus="status">
					<c:if test="${blist.type eq 'parcel'}">
					<a href="/petmee/board/parcelboard/parcelDtail.do?no=${blist.no}">
						<li>
						<img class="img-src" src="<c:url value='${flist[status.index].sumpath}${flist[status.index].oriName}'/>">
							<div class="txt-box">
								<p>${blist.title}:${blist.viewCnt}</p>
							</div>
						</li>
					</a>
					</c:if>
					</c:forEach>
				</div>
				<c:choose>
				<c:when test="${user.email == null}">
				</c:when>
				<c:otherwise>
				<br>
				<button id="y-writeform" >글등록</button>
				<br>
				</c:otherwise>
				</c:choose>

				<div id="board-search">
						<select name="searchkeyword" id="top_sel">
							<option value="0">전체</option>
							<option value="1">작성자</option>
                            <option value="2">제목</option>
                            <option value="3">작성자+제목</option>
						</select>
					  <input type="text" id="searchtext" placeholder="검색어 입력" />
						<button id="searchbutton">검색</button>
				</div>
			</div>

		</div>
		<div></div>
		<div id="page" >
        <nav>
  <ul class="pagination">
 
    <c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage}">
    <li <c:if test="${pr.pageNo == i}">class="active"</c:if>><a href="parcelList.do?pageNo=${i}">${i}</a></li>
    </c:forEach>
    
  </ul>
</nav>
	</div>
	</section>

	<div id="footer">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>

<script type="text/javascript">
	$("#y-writeform").click( function () {
		location.href = "/petmee/board/parcelboard/parcelWriteForm.do";
	});
</script>
<script src="../js/lib/jquery.magnific-popup.js"></script>
	<script src="../js/lib/jquery.mCustomScrollbar.min.js"></script>	
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>

</html>