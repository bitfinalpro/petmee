<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Pet Me</title>

   <!-- Custom fonts for this template-->
  <link href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.css"/>" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href ="<c:url value="/resources/css/admin/sb-admin.css"/>" rel="stylesheet">
  <link href ="<c:url value="/resources/css/admin/product.css"/>" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
  	let Project;
  </script>
</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="<c:url value="/main.do"/>">PETME ADMIN</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>
  </nav>

  <div id="wrapper">
      <!-- 사이드 바 -->
      <ul class="sidebar navbar-nav">
        <!-- 메인 -->
        <li class="nav-item"><a class="nav-link"
				href="<c:url value="/admin/chart/chart.do"/>"> <i
					class="fas fa-fw fa-chart-area"></i> <span>메인</span></a></li>
        <!-- 회원 관리 -->
        <li class="nav-item">
          <a class="nav-link" href="<c:url value="/admin/user/userlist.do" />">
              <i class="fas fa-user"></i>
            <span>회원관리</span></a>
        </li>
         <!-- 신고 관리 -->
         <li class="nav-item">
          <a class="nav-link" href="<c:url value="/admin/user/reportlist.do" />">
            <i class="fas fa-user-slash"></i>
              <span>신고관리</span>
            </a>
          </li>
        <!-- 주문 관리 -->
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/order/order.do"/>">
              <i class="fas fa-fw fa-table"></i>
              <span>주문관리</span></a>
          </li>
        <!-- 상품 관리 -->
        <li class="nav-item">
          <a class="nav-link" href="<c:url value="/admin/product/product.do"/>">
            <i class="fas fa-fw fa-table"></i>
            <span>상품관리</span></a>
        </li>
        <!-- 쿠폰 관리 -->
			<li class="nav-item"><a class="nav-link"
				href="<c:url value="/admin/coupon/coupon.do"/>"> <i
					class="fas fa-fw fa-table"></i> <span>쿠폰관리</span></a></li>
      </ul>
  

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            쿠폰
          </li>
          <li class="breadcrumb-item active">Coupon</li>
        </ol>

        <!-- 회원정보 / 상세정보는 팝업창으로 -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
           상품관리</div>
          <div class="card-body">
            <div class="table-responsive">
            <div class="inout"><button id="inputcouponbutton" class="nofresh">쿠폰등록</button></div>
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>쿠폰명</th>
                    <th>쿠폰번호</th>
                    <th>할인금액</th>
                    <th>사용가능기한</th>
                    <th>등록여부</th>
                  </tr>
                </thead>
                <tfoot></tfoot> 
                <tbody>
                <c:forEach var="c" items="${list}">
                  <tr>
                    <td> ${c.name}</td>
                    <td> ${c.no}</td>
                    <td><fmt:formatNumber value="${c.discount}" pattern="###,###,###"/></td>
                    <td> ${c.regDate}</td>
                    <td>
                    	<c:if test="${c.used == 0}"><span style="color: red;">등록안됨</span></c:if>
                    	<c:if test="${c.used == 1}"><span style="color: blue; font-weight: bold;">${c.email}</span></c:if>
                    </td>
                  </tr>               
                </c:forEach>
                </tbody>
              </table>
              <!-- 제품정보 변경 모달창 시작 -->
              <div id="updatepopup" class="layer">
                  <div class="box">
                       <a href="#" class="stopnofresh"><span>x</span></a>
                       <div id="inputtitle">제품정보 변경</div>
                       <div>
                        <form id="updateForm" action="updateProduct.do">
                        
                        </form>
                        <button class="cancelModalbtn">취소</button>                        
                       </div>                    
                  </div>
                </div>
              <!-- 모달창 끝 -->            
              <!-- 쿠폰등록 모달창 시작 -->
              <div id="inputcouponpopup" class="layer">
                  <div class="box">
                       <a href="#" class="stopnofresh"><span>x</span></a>
                       <div id="inputtitle">쿠폰 등록</div>
                       <div>
                        <form id="pForm">                         
                        <div>쿠폰이름 : <input type="text" name="couponName"/></div>
                        <div>쿠폰갯수 : <input type="text" name="couponCount"/></div>
                        <div>할인금액 : <input type="text" name="couponDiscount"/></div>
                        <button id="inputcouponlistupbtn" type="button">목록에 올리기</button>
                        </form>
                        <div id="inputcouponlist">
                          <table id="inputlisttable">
                              <thead>
                                  <tr>                                    
                                    <th>쿠폰이름</th>
                                    <th>쿠폰갯수</th>                                    
                                    <th>할인금액</th>
                                  </tr>
                                </thead>
                                <tbody id="inputcouponTbody">                               
                                  
                                </tbody>
                          </table>
                        </div>
                       </div>
                    <button id="couponcompletebtn" class="stopnofresh">완료</button>
                    <button class="cancelModalbtn">취소</button>
                  </div>
                </div>
              <!-- 모달창 끝 -->            
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

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
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

   <!-- 상단 아이콘 로그아웃-->
   <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">로그아웃 하시겠습니까?</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">아뇨</button>
          <a class="btn btn-primary" href="login.html">네</a>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" value="${cList.size()}" id="cList" />	
 <!-- Bootstrap core JavaScript-->
  <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

  <!-- Core plugin JavaScript-->
  <script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js" />"></script>

  <!-- Page level plugin JavaScript-->
  <script src="<c:url value="/resources/vendor/chart.js/Chart.min.js" />"></script>
  <script src="<c:url value="/resources/vendor/datatables/jquery.dataTables.js" />"></script>
  <script src="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.js" />"></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value="/resources/js/admin/sb-admin.min.js" />"></script>

  <!-- Demo scripts for this page-->
  <script src="<c:url value="/resources/js/admin/demo/datatables-demo.js" /> "></script>
  <script src="<c:url value="/resources/js/admin/demo/chart-area-demo.js"/> "></script>
  <script src="<c:url value="/resources/js/admin/coupon.js"/>"></script> 
</body>
</html>
