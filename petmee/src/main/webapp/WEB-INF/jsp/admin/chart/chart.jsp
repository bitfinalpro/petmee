<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>petmee charts</title>

<!-- Custom fonts for this template-->
<link
	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link
	href="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.css"/>"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value="/resources/css/admin/sb-admin.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/admin/chart.css"/>"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="index.html">Start Bootstrap</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow mx-1"><a
				class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <span
					class="badge badge-danger">9+</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="alertsDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow mx-1"><a
				class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <span
					class="badge badge-danger">7</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="messagesDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a> <a
						class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal">Logout</a>
				</div></li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- 사이드 바 -->
		<ul class="sidebar navbar-nav">
			<!-- 메인 -->
			<li class="nav-item active"><a class="nav-link"
				href="index.html"> <i class="fas fa-home"></i> <span>Main</span>
			</a></li>
			<!-- 회원 관리 -->
			<li class="nav-item"><a class="nav-link" href="<c:url value="/admin/user/userlist.do" />">
					<i class="fas fa-user"></i> <span>회원관리</span>
			</a></li>
			<!-- 신고 관리 -->
			<li class="nav-item"><a class="nav-link" href="<c:url value="/admin/user/reportlist.do" />">
					<i class="fas fa-user-slash"></i> <span>신고관리</span>
			</a></li>
			<!-- 주문 관리 -->
			<li class="nav-item"><a class="nav-link"
				href="<c:url value="/admin/order/order.do"/>"> <i
					class="fas fa-fw fa-table"></i> <span>주문관리</span></a></li>
			<!-- 상품 관리 -->
			<li class="nav-item"><a class="nav-link"
				href="<c:url value="/admin/product/product.do"/>"> <i
					class="fas fa-fw fa-table"></i> <span>상품관리</span></a></li>
			<!-- 차트  쓸거면 쓰고 안쓰면 삭제 -->
			<li class="nav-item"><a class="nav-link"
				href="<c:url value="/admin/chart/chart.do"/>"> <i
					class="fas fa-fw fa-chart-area"></i> <span>통계</span></a></li>
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item">통계</li>
					<li class="breadcrumb-item active">차트</li>
					<li><select id="searchCategory">
							<option value="1">회원아이디</option>
							<option value="2">제품번호</option>
					</select></li>
					<li><input type="text" id="searchKeyword" /></li>
					<li><button id="search-UserStatistics" type="button">검색</button></li>
				</ol>

				<!-- Area Chart Example-->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-chart-area"></i> 월별 매출 추이
					</div>
					<div class="card-body">
						<canvas id="myAreaChart" width="100%" height="30"></canvas>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>

				<div class="row">
					<div class="col-lg-8">
						<div class="card mb-3">
							<div class="card-header">
								<i class="fas fa-chart-bar"></i> 이번달 매출 Top 5
							</div>
							<div class="card-body">
								<canvas id="myBarChart" width="100%" height="50"></canvas>
							</div>
							<div class="card-footer small text-muted">Updated yesterday
								at 11:59 PM</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card mb-3">
							<div class="card-header">
								<i class="fas fa-chart-pie"></i> 카테고리 별 매출 통계
							</div>
							<div class="card-body">
								<canvas id="myPieChart" width="100%" height="100"></canvas>
							</div>
							<div class="card-footer small text-muted">Updated yesterday
								at 11:59 PM</div>
						</div>
					</div>
				</div>

				<p class="small text-center text-muted my-5">
					<em></em>
				</p>

			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright 짤 Your Website 2019</span>
					</div>
				</div>
			</footer>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">�</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

	<!-- Page level plugin JavaScript-->
	<script src="<c:url value="/resources/vendor/chart.js/Chart.min.js"/>"></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value="/resources/js/admin/sb-admin.min.js"/>"></script>

	<!-- Demo scripts for this page-->
	<script
		src="<c:url value="/resources/js/admin/demo/chart-area-demo.js"/>"></script>
	<script
		src="<c:url value="/resources/js/admin/demo/chart-bar-demo.js"/>"></script>
	<script
		src="<c:url value="/resources/js/admin/demo/chart-pie-demo.js"/>"></script>
	<!-- 회원 아이디 검색 모달창 시작 -->
	<div id="searchstasticspopup" class="modal">
		<div class="modal-content">
			<span style="background: #ff7f50;" class="closeModal">&times;</span>
		<p class="searchTitle"></p>
		<div style="width: 100%;">
			<div id="canvasbox">
				<canvas id="myChart"></canvas>
			</div>
		<span id="changeCountChart">구매횟수</span>
		<span id="changePriceChart">구매총액</span>		
		<div id="statisticsInfo">
			
		</div>
		</div>
		<span id="searchOrderTitle">♣ 최근 구매내역</span>
		<div id="searchOrderList">
			<table id="orderListTable">
				<thead>
					<th>주문일시</th>
					<th>주문번호</th>
					<th>주문품목</th>
					<th>수량</th>
					<th>금액</th>
					<th>결제방식</th>
					<th>주문상태</th>
				</thead>
				<tbody id="searchOrderTbody">
				</tbody>
			</table>
		</div>
		<button id="closebtn" class="closebtn">닫기</button>
		</div>
	</div>
	<!-- 모달창 끝 -->	
	<!-- 회원 제품 검색 모달창 시작 -->
	<div id="searchproductpopup" class="modal">
		<div class="modal-content2">
			<div id="titleLine">
			<span style="background: #ff7f50;" class="closeModal">&times;</span>
			<p class="searchTitle2"></p>
			</div>
		<div style="width: 100%;">
			<div id="canvasbox2">
				<canvas id="myProductChart"></canvas>
		</div>
		<span id="changeCountChart2">구매횟수</span>
		<span id="changePriceChart2">구매총액</span>	
		<div id="statisticsInfo2">
			
		</div>
		</div>
		<button id="closebtn2" class="closebtn">닫기</button>
		</div>
	</div>
	<!-- 모달창 끝 -->	
	<script src="<c:url value="/resources/js/admin/chartmain.js"/>"></script>
	

</body>

</html>
