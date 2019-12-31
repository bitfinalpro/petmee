<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<%@ include file="/WEB-INF/jsp/include/includecss.jsp"%>
<%@ include file="/WEB-INF/jsp/include/includejs.jsp"%>
	<link rel="stylesheet" href="<c:url value="/resources/css/free/detail.css" /> ">
<title>Pet Me</title>
<style>
 .suck {
   width: 100%;
  text-align: center;
  padding: 30px;
 }
</style>
</head>

<body>
	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
	<section>
       <div class="background">
           <h2 class="free"><i class="fas fa-users"></i> 분양게시판</h2>
       </div>
   </section>


	<section id="layout">
		<div class="freeboard">
			<div class="board_list">
			  <div id="types">
			     <div class="ll">
			        <div id="boardDetailTitle"class="left" style="font-size: 24px;"> <c:out value="${board.title}" /></div>
			           <div class="right" style="font-size: 16px;"><i class="far fa-clock"></i> <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
			     </div>
			   </div>
			   <div id="types1">
			      <div class="ll">
			         <div class="left" style="margin-top: 3px;"><i class="far fa-user"></i>${board.email}</div>
			            <div class="right">
                         <div id="view"><i class="far fa-eye"></i> ${board.viewCnt}</div>
                         <div id="report" class="right"><img src="<c:url value="/resources/images/board/common/report.png" />"><button onclick="document.location.href='#popup'">신고</button></div>
			      </div>
			   </div>
			 </div>
			</div>
				<c:forEach var="flist" items="${flist}" varStatus="status">
					<div class="suck">
						<img class="img-src"
							src="<c:url value='${flist.path}${flist.oriName}'/>">
					</div>
				</c:forEach>
						<div id="Freecontent">${board.content}</div>
				  <div class="button">
                       <a href="updateform.do?no=${board.no}"><button class="b1">수정</button></a>
                       <a href="delete.do?no=${board.no}"><button class="b1">삭제</button></a>
                       <a href="<c:url value="/board/parcelboard/parcelList.do" />"><button class="b1">목록</button></a>
                   </div>

			 <form id="crForm" method="post" action="comment_regist.do" >
                 <input type="hidden" id="no" value="${board.no}" />  
                   <textarea placeholder="댓글을 입력해주세요" class="comment" id="content"></textarea>
                     <input type="hidden" id="email" value="권성진" /> 
                      <button type="submit" class="comment1" >등록</button>
              </form>
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