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
				<strong>${board.title}no:${board.no}</strong> <span>2019-11-11</span>
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
			<button id="return-list" class="midle-btn">목록</button>

			<div id="commentbox">
				<!-- <div>댓글</div>
				<br>
				<form action="" name="commen">
					<input type="text">
					<button id="comment-regist">등록</button>
				</form>
				<br> -->
					<!-- 	<hr />
					<br>
					<div class="c-title">
						<div class="c-id">아이고</div>
						<div class="c-date">2019-11-11</div>
					</div>
					<div class="c-content">
						안녕하세요 :) 미니펫몰입니다~ <br> 예나 지금이나 마루 외모가 열일중이네요ㅠㅠ 길고 긴 후기 읽느라 눈이
						아파용ㅎㅎ 읽는 내내 너무 귀엽고 사랑스러워서 미소가 한가득 지어지네요 <br> 사랑스러운 우리 마루 무사히
						일본까지 잘 도착할 수 있도록 저희도 함께 응원할게요!!! 감사합니다
					</div>
					<br>
					<hr /> -->
				</div>
				
				<div id="commentRegistForm">
			<form id="crForm" method="post" action="comment_regist.do">
				<input type="hidden" id="no" value="${board.no}" />	
				<table width="70%">
				<tr>
					<td><input type="text" id="writer" /></td>
					<td><textarea id="content" rows="2" cols="60"></textarea></td>
					<td><input type="submit" value="등록" /></td>
				</tr>	
				</table>
			</form>
		</div>
		<!-- 댓글 목록 -->		
		<div id="commentList"></div>	
		
				<br>
				<div id="move-board">
					<hr>
					<div id="move-board-p">
						<strong>이전글</strong> <span>특수묘 랙돌분양 진솔한 후기 올립니다^^</span>
					</div>
					<hr>
					<div id="move-board-n">
						<strong>다음글</strong> <span>슈나우저 입양후기</spa>
					</div>
					<hr>
				</div>
			</div>

		</div>
	</section>

	<div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
	<script>
		let no = ${board.no};
	</script>
	<script src="<c:url value='/resources/js/parcelcomment.js' />"></script>
</body>

</html>