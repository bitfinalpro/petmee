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
<script src="<c:url value="/resources/js/common/jquery-3.4.1.js" />"></script>
<%-- 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
 --%>
<link href="<c:url value="/resources/css/shopping/login/login3.css " />" rel="stylesheet">
	<link href="<c:url value="/resources/css/shopping/login/join1.css " />" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/dist/summernote-lite.css" />">
<script src="<c:url value="/resources/css/dist/summernote-lite.js" />"></script>


<style type="text/css">
a,button,submit{
cursor: pointer;	
}
.midle-btn {
    position: relative;
    width: auto;
    height: a;
    font-size: 20px;
    top: auto;
    left: auto;
}
}
.midle-btn >button {
display: inline-block;
}
#mar-20{
margin: 25px 0;
}
#img_ment {
	position: relative;
    bottom: 100px;
    font-size: 14px;
    left: 5px;
}
.z-index {
z-index: -1;
}
</style>
<title>Pet & Me</title>

</head>

<body>
	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>


	<section id="wrap">
	<img src="<c:url value="/resources/images/main/1231.jpg"/>" style="width: 100%;">
		<div id="y-container">

			<div id="y-parcel-board">
				<strong>Community</strong>
			</div>

			<div id="y-content">
				<form action="/petmee/board/parcelboard/parcelwrite.do" method="post"
					name="SermernoteVo" enctype="multipart/form-data">
					<div id="yy-img">
						<img class="yy-img">
						<div id="img_ment">썸네일을 넣어주세요</div>
						<input type="file" name="sumfile" id="sumfile" />
					</div>
					<hr />
					<input type="hidden" name="type" value="parcel" />
					<div id="y-p-title">
						<input type="text" placeholder="제목을 입력하세요" name="title"  />
						<input type="hidden" name="writer" value="${user.email}" />
					</div>
					<hr />
					<br>
					<textarea id="summernote" name="content"> </textarea>
					<input id="mar-20" type="file" name="boardfile" multiple="multiple" />
					<div class="midle-btn">
						<button id="y-regist">등록</button>
						<button type="button" id="return-list">목록</button>
					</div>
				</form>
			</div>
		</div>
	</section>

	<script>
    $('#summernote').summernote({
        placeholder: '<br>※ 게시판 용도와 무관하거나 아래 내용이 포함된 경우는 사전 안내없이 삭제/제재됩니다.<br><br>- 욕설, 상대 비방 등 타인의 명예를 훼손하는 게시물 <br><br>- 불쾌감을 줄 수 있는 이미지나 내용, 저작권에 위배되는 게시물 <br><br>- 개인정보 노출이 있거나 현금 거래 시도 등에 준하는 행위 ',
        tabsize: 2,
        height: 500,
        minHeight: null,   
        maxHeight: null,             
        focus: true 
      });
	$("#return-list").click( function () {
		location.href = "/petmee/board/parcelboard/parcelList.do";
	});
    </script>

	<script type="text/javascript">
	
	let sel_file;
	
	$(document).ready(function () {
		$("#sumfile").on("change", handleImgFileSelect);		
	})
	
	function handleImgFileSelect(e) {
		let files = e.target.files;
		let filesArr = Array.prototype.slice.call(files)
		
		filesArr.forEach(function (f) {
			if(!f.type.match("image.*")) {
				alert("이미지 파일만 가능합니다.");
				return;
			}
			
			sel_file = f;
			
			let reader = new FileReader();
			reader.onload = function (e) {
				$(".yy-img").attr("src", e.target.result);
				$("#img_ment").attr("class","z-index");
			}
			reader.readAsDataURL(f);
		})
	}
	</script>

	<div id="footer">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
	<script src="../js/lib/jquery.magnific-popup.js"></script>
	<script src="../js/lib/jquery.mCustomScrollbar.min.js"></script>	
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
</body>

</html>