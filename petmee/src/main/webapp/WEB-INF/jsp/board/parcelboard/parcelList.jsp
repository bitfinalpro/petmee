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
		<div id="y-container">
		   <img src="<c:url value="/resources/images/main/1231.jpg"/>" style="width: 100%;">
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
				<br>
				<button id="y-writeform" >글쓰기</button>
				<br>

				<div id="board-search">
					<form action="" name="search">
						<select name="" id="">
							<option value="">전체</option>
						</select> <input type="text" name="" />
						<button>검색</button>
					</form>
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

	<div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>

<script type="text/javascript">
	$("#y-writeform").click( function () {
		location.href = "/petmee/board/parcelboard/parcelWriteForm.do";
	});
</script>

</body>

</html>