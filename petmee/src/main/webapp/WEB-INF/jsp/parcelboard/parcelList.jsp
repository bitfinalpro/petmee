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
<link href="../resources/css/parcel/parcelList.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<script src="<c:url value='/resources/js/common/jquery-1.12.4.js' />"></script>

<title>시바 먼치킨</title>

</head>

<body>

	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>


	<section>
		<div id="y-container">
			<aside class="side_menu">
				<div>
					<strong>Community</strong>
				</div>
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">자유게시판</a></li>
					<li><a href="#">봉사활동</a></li>
					<li><a href="#">분양게시판</a></li>
					<li><a href="#">후기게사판</a></li>
					<li><a href="#">Q&A</a></li>
				</ul>
			</aside>

			<div id="y-content">
				<div id="y-parcel-board">
					<strong>Community</strong>
				</div>
				<div id="y-list">
					<li><img class="img-src" src="../resources/images/main/1.jpg">
						<div class="txt-box">
							<span>safasfsafsafasfsaf간단 메세지</span>
						</div></li>
					<li><img class="img-src" src="../resources/images/main/sub_img.jpg">
						<div class="txt-box">
							<span>safasfsafsafasfsaf간단 메세지</span>
						</div></li>
					<li>1
						<div class="txt-box">
							<span>safasfsafsafasfsaf간단 메세지</span>
						</div>
					</li>
					<li>1
						<div class="txt-box">
							<span>safasfsafsafasfsaf간단 메세지</span>
						</div>
					</li>
					<li>1
						<div class="txt-box">
							<span>safasfsafsafasfsaf간단 메세지</span>
						</div>
					</li>
					<li>1
						<div class="txt-box">
							<span>safasfsafsafasfsaf간단 메세지</span>
						</div>
					</li>
					<li>1
						<div class="txt-box">
							<span>safasfsafsafasfsaf간단 메세지</span>
						</div>
					</li>
					<li>1
						<div class="txt-box">
							<span>safasfsafsafasfsaf간단 메세지</span>
						</div>
					</li>
					<li>1
						<div class="txt-box">
							<span>safasfsafsafasfsaf간단 메세지</span>
						</div>
					</li>
				</div>
				<br>
				<button id="y-writeform">글쓰기</button>
				<br>
				<div id="page-area">
					<ul>
						<li><<</li>
						<li><</li>
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>5</li>
						<li>6</li>
						<li>7</li>
						<li>8</li>
						<li>9</li>
						<li>10</li>
						<li>></li>
						<li>>></li>
					</ul>
				</div>

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
	</section>

	<div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
	
</body>

</html>