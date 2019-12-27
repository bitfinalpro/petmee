<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Pet Me</title>

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
<link href="<c:url value="/resources/css/admin/product.css"/>"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	let Project;
</script>
</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="<c:url value="/main.do"/>">PETME ADMIN</a>

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
			<li class="nav-item"><a class="nav-link"
				href="<c:url value="/admin/chart/chart.do"/>"> <i
					class="fas fa-fw fa-chart-area"></i> <span>main</span></a></li>
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
		</ul>


		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">상품</a></li>
					<li class="breadcrumb-item active">Product</li>
				</ol>

				<!-- 회원정보 / 상세정보는 팝업창으로 -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> 주문관리
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th class="ordertablehead"><input type="checkbox"
											id="checkall" value="0" /></th>
										<th>주문일시</th>
										<th>주문번호</th>
										<th>구매자</th>
										<th>주문품목</th>
										<th>주문총액</th>
										<th>주문상태</th>
										<th>주문취소</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="8"><button id="checkallbutton">전체선택</button>
											<button id="cancelchoice">선택해제</button>
											<button id="deleteSelected">선택삭제</button></th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="o" items="${list}">
										<tr>
											<td><input type="checkbox" name="choice"
												value="${o.orderId}" /></td>
											<td><fmt:formatDate value="${o.orderDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><a href="" class="detailOrder noRefresh"
												data-no="${o.orderId}">${o.orderId}</a></td>
											<td>${o.userId}</td>
											<c:choose>
											<c:when test="${o.countOfProducts == 1}" ><td>${o.productId}</td></c:when>
											<c:otherwise><td>${o.productId} 외 ${o.countOfProducts - 1}건</td></c:otherwise>
											</c:choose>
											
											<td>${o.sumPrice}</td>
											<td><select name="delieveryStatus"
												class="delieveryStatus" data-no="${o.orderId}"
												data-status="${o.delieveryStatus}">
													<option
														<c:if test='${o.delieveryStatus eq "주문확인중"}'>selected</c:if>>주문확인중</option>
													<option
														<c:if test='${o.delieveryStatus eq "배송준비중"}'>selected</c:if>>배송준비중</option>
													<option
														<c:if test='${o.delieveryStatus eq "배송중"}'>selected</c:if>>배송중</option>
													<option
														<c:if test='${o.delieveryStatus eq "배송완료"}'>selected</c:if>>배송완료</option>
											</select> <span id="${o.orderId}"></span></td>
											<td><a href="delete.do?orderId=${o.orderId}"
												class="cancelModalbtn">취소</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>
				<!-- 주문내역 모달창 시작 -->
				<div id="orderpopup" class="layer">
					<div class="box">
						<a href="#" class="stopnofresh"><span>x</span></a>
						<div id="inputtitle">주문 내역</div>
						<div>
							<div id="orderbox"></div>
							<button class="cancelModalbtn">확인</button>
						</div>
					</div>
				</div>
				<!-- 모달창 끝 -->
				<p class="small text-center text-muted my-5">
					<em>More table examples coming soon...</em>
				</p>

			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright © Your Website 2019</span>
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

	<!-- 상단 아이콘 로그아웃-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그아웃 하시겠습니까?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">아뇨</button>
					<a class="btn btn-primary" href="login.html">네</a>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="${cList.size()}" id="cList" />
	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js" />"></script>

	<!-- Page level plugin JavaScript-->
	<script src="<c:url value="/resources/vendor/chart.js/Chart.min.js" />"></script>
	<script
		src="<c:url value="/resources/vendor/datatables/jquery.dataTables.js" />"></script>
	<script
		src="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.js" />"></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value="/resources/js/admin/sb-admin.min.js" />"></script>

	<!-- Demo scripts for this page-->
	<script
		src="<c:url value="/resources/js/admin/demo/datatables-demo.js" /> "></script>
	<script
		src="<c:url value="/resources/js/admin/demo/chart-area-demo.js"/> "></script>
	<script src="<c:url value="/resources/js/admin/order.js"/>"></script>
</body>
</html>
