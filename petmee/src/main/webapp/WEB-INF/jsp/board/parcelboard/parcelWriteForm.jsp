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
<link href="<c:url value='/resources/css/parcel/parcelWriteForm.css' />" rel="stylesheet" />

	
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/dist/summernote-lite.css" />">
<script src="<c:url value="/resources/css/dist/summernote-lite.js" />"></script>

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

			<div id="y-content">
				<form action="/petmee/board/parcelboard/parcelwrite.do" method="post"
					name="SermernoteVo" enctype="multipart/form-data">
					<div id="yy-img">
						<div class="yy-img">썸네일을 넣어주세요</div>
						<input type="text" name="writer" value="admin" /> <input
							type="file" name="sumfile" />
					</div>
					<hr />
					<div id="y-p-title">
						<input type="text" placeholder="제목을 입력하세요" name="title" />
					</div>
					<hr />
					<br>

					<textarea id="summernote" name="content"> </textarea>

					<input type="file" name="boardfile" multiple="multiple" />
					<div class="midle-btn">
						<button id="y-regist">등록</button>
						<button type="button" id="return-list">목록</button>
					</div>
				</form>
			</div>
		</div>
	</section>

	<div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
	
	<script>
	console.log($)
       $('#summernote').summernote({
           placeholder: '<br>※ 게시판 용도와 무관하거나 아래 내용이 포함된 경우는 사전 안내없이 삭제/제재됩니다.<br><br>- 욕설, 상대 비방 등 타인의 명예를 훼손하는 게시물 <br><br>- 불쾌감을 줄 수 있는 이미지나 내용, 저작권에 위배되는 게시물 <br><br>- 개인정보 노출이 있거나 현금 거래 시도 등에 준하는 행위 ',
           tabsize: 2,
           height: 500,
           minHeight: null,
           maxHeight: null,
           focus: true
         });
    </script>
</body>

</html>