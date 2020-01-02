<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Pet Me</title>

  <!-- 이 템플릿의 사용자 지정 글꼴-->
  <link href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">

  <!-- 페이지 레벨 플러그인 CSS-->
  <link href="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.css"/>" rel="stylesheet">

  <!-- 이 템플릿의 사용자 지정 스타일 -->
   <link href ="<c:url value="/resources/css/admin/sb-admin.css"/>" rel="stylesheet">

<style>
 .u {
    width: 30%;
      text-align: center;
    margin: 0 auto;
    padding-bottom: 10px;
    font-size: 20px;
      }
    .u > strong {
      text-align: center;
      }
    #usermodal {
      border: solid 1px #e9e9e9;
      width: 660px;
      height: 400px;
    }
    #usermodal > tbody > tr > td {
      border: solid 1px  #e9e9e9;
  
    }
    #usermodal > tbody > tr > td:nth-child(2n + 1) {
      background: #e5e5e5;
      padding-left: 8px;
      padding-right: 3px;
    }
    #usermodal > tbody > tr > td:nth-child(2n + 2) {
      padding-left: 8px;
    }

    *{
      margin:0;
      padding:0;
    }
    ul,li{
      list-style:none;
    }
    a{
      text-decoration:none;
      color:inherit;
    }
    .layer{
      display:none;
      justify-content:center;
      align-items:center;
      background:rgba(0,0,0, 0.5);
      position:fixed;
      left:0;
      right:0;
      top:0;
      bottom:0;
    }
    .layer .box{
      padding:20px 20px 60px;
      margin:20px;
      width:700px;
      height: 530px;
      background: white;
      position:relative;
    }
    .layer .close{
      position:absolute;
      right:20px;
      bottom:20px;
      display:block;
      background:#09F;
      color:#fff;
      text-align:center;
      padding:5px 20px;
      font-size:13px;
    }
    .layer:target{
      display:flex;
      animation:open 0.5s;
    }
    @keyframes open {
      from {opacity:0;} to {opacity:1;}
    }
  
  </style>
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
            <a href="#">회원</a>
          </li>
          <li class="breadcrumb-item active">User</li>
        </ol>

        <!-- 회원정보 / 상세정보는 팝업창으로 -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
           회원관리</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>성별</th>
                    <th>주민번호</th>
                    <th>수정/탈퇴</th>
                  </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>주소</th>
                        <th>성별</th>
                        <th>주민번호</th>
                        <th>수정/탈퇴</th>
                      </tr>
                </tfoot>
                  <c:if test="${empty userList}">
               <tr>
                   <td colspan="5">게시물이 없습니다.</td>
                 </tr>
                 </c:if>
                <tbody>
                <c:forEach var="user" items="${userList}">
                  <!-- <tr onclick="document.location.href='#popup'"> -->
                  <tr onclick="popup('${user.email}','${user.name}',
                                     '${user.resident}', '${user.address}',
                                     '${user.phone}', '${user.gender}', '${user.age}','${user.stringUserDate}'
                                     ,'${user.addressDetail}')">
                                     
                        <td>${user.email}</td>
                        <td>${user.name}</td>
                        <td>${user.address}</td>
                        <td>${user.gender}</td>
                        <td>${user.resident}</td>
                        <td><a href="userdelete.do?userNo=${user.userNo}"><button type="button">탈퇴</button></a></td>
                      </tr>
             </c:forEach>
                </tbody>
              </table>
               <!-- 모달창 시작 -->
                <div id="popup" class="layer">
                  <div class="box">
                    <div class="u"><strong>회원정보</strong></div>
                    <table class ="usermodal" id="usermodal">
                        <colgroup>
                          <col width="12%">
                          <col width="25%">
                          <col width="12%">
                          <col width="17%">
                          <col width="6%">
                          <col width="3%">
                      </colgroup>                  
                      <tr>
                        <td>이름</td>
                        <td id="name"></td>
                        <td>아이디 </td>
                        <td id="email" colspan="3"></td>
                      </tr>
                      <tr>
                        <td>주민번호</td>
                        <td id="resident"></td>
                        <td>성별</td>	
                        <td id="gender"></td>
                        <td>나이</td>
                        <td id="age"></td>
                      </tr>
                      <tr>
                        <td>주소 </td>
                        <td id="address"colspan="5"></td>
                      </tr>
                      <tr>
                        <td>상세주소 </td>
                        <td id="addressdetail" colspan="5"></td>
                      </tr>
                      <tr>
                        <td>핸드폰번호</td>
                        <td id="phone"></td>
                        <td>가입일자 </td>
                        <td id="regDate" colspan="3"></td>
                      </tr>
                    </table>
                    <a href="#" class="close">닫기</a>
                  </div>
                </div>
              <!-- 모달창 끝 -->
            </div>
          </div>
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
  <script src="<c:url value="/resources/js/admin/userinfo.js"/>"></script>


</body>

</html>
