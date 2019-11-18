<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="../resources/css/common/gnb.css" rel="stylesheet">
<link href="../resources/css/parcel/parcelDetailList.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<script src="../resources/js/common/jquery-1.12.4.js"></script>

<title>시바 먼치킨</title>

</head>

<body>
	<div id="header">
		<c:import url="<c:url value='/jsp/common/menu.jsp' />"></c:import>
	</div>


	<section>
		<div id="y-container">

			<div id="y-parcel-board">
				<strong>Community</strong>
			</div>

			<div id="y-content">
				<hr />
				<div id="y-p-title">
					<input type="text" placeholder="제목을 입력하세요" />
				</div>
				<hr />
				<br>
				<iframe src="sermernote.html" id="sermernote"></iframe>
				<!-- <button id="return-list" class="midle-btn">목록</button> -->
			</div>


		</div>
	</section>

	<div id="footer" class="footer_wrap clearfix">
		<c:import url="<c:url value='/jsp/common/footer.jsp' />"></c:import>
	</div>
</body>

</html>