<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<%@ include file="/WEB-INF/jsp/include/includecss.jsp"%>
<%@ include file="/WEB-INF/jsp/include/includejs.jsp"%>
<link
	href="<c:url value='/resources/css/parcel/parcelDetailList.css' />"
	rel="stylesheet" />
<title>시바 먼치킨</title>
<style type="text/css">

.comment-regist {
    width: 90px;
    height: 100px;
    margin-left: 10px;
    position: absolute;
}
#content{
  width: 90%;
    height: 100px;
    border: 1px solid gainsboro;
    resize: none;
    padding: 15px auto 15px 15px;
}
.yy-con{

 	width: 974px !important;
    height: 100px;
    border: 1px solid gainsboro;
}
#crForm{
padding: 20px 0 20px 0;
}
.modifiy{
float: right;
padding-right: 30px;
}
#modRow16{
width: 1080px;
}
.y-row{
width: 1080px;
}
a,button,submit{
cursor: pointer;	
}
#modi > button{
display: inline-block;
margin: 0;
}
#modi {
padding-left: 100px;
text-align: center;
}
</style>
</head>

<body>
	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>


	<section>
		<div id="y-container">

			<div id="y-parcel-board">
				<strong>Community</strong>
			</div>
			<hr />
			<div id="y-p-title">
				<strong>${board.title}</strong> <span>2019-11-11</span>
			</div>
			<hr />
			<div id="y-p-content">

				<c:forEach var="flist" items="${flist}" varStatus="status">
					<div>
						<img class="img-src"
							src="<c:url value='${flist.path}${flist.oriName}'/>">
					</div>
				</c:forEach>
				${board.content}
			</div>
			<hr />
			<div id="modi">
			<button id="return-list" class="midle-btn">목록</button>
			<button id="y-update" class="midle-btn">수정</button>
			<button id="y-delete" class="midle-btn">삭제</button>
			</div>
			<div id="commentbox">
				<div>댓글</div>
				<div id="commentRegistForm">
			<form id="crForm" method="post" action="comment_regist.do">
				<input type="hidden" id="no" value="${board.no}" />	
					<input type="hidden" id="writer" value="admin"/>
				
					<textarea id="content" rows="2" cols="60"></textarea>
					<button class="comment-regist">등록</button>
			
			</form>
		</div>
				<hr/>
		<!-- 댓글 목록 -->		
		<div id="commentList"></div>	
			</div>
	</section>

	<div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
	<script>
		let no = ${board.no};
		$("#return-list").click( function () {
			location.href = "/petmee/board/parcelboard/parcelList.do";
		});
		$("#y-delete").click( function () {
			location.href = "/petmee/board/parcelboard/delete.do?no=${board.no}";
		});
		
		$("#y-update").click( function () {
			location.href = "/petmee/board/parcelboard/parcelUpdateForm.do?no=${board.no}";
		});
	</script>
	<script src="<c:url value='/resources/js/parcelcomment.js' />"></script>
</body>

</html>