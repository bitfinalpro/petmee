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
      width:550px;
      height: 650px;
      background: beige;
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

    <a class="navbar-brand mr-1" href="index.html">PETME ADMIN</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

 <div id="wrapper">
      <!-- 사이드 바 -->
      <ul class="sidebar navbar-nav">
        <!-- 메인 -->
        <li class="nav-item active">
          <a class="nav-link" href="index.html">
            <i class="fas fa-home"></i>
            <span>Main</span>
          </a>
        </li>
        <!-- 회원 관리 -->
        <li class="nav-item">
          <a class="nav-link" href="<c:url value="/admin/user/userlist.do" />">
              <i class="fas fa-user"></i>
            <span>회원관리</span></a>
        </li>
         <!-- 신고 관리 -->
         <li class="nav-item">
            <a class="nav-link" href="reportadmin.html">
              <i class="fas fa-user-slash"></i>
                <span>신고관리</span>
              </a>
            </li>
        <!-- 게시판 관리 -->
        <li class="nav-item">
            <a class="nav-link" href="boardadmin.html">
              <i class="fas fa-fw fa-table"></i>
              <span>게시판관리</span></a>
          </li>
        <!-- 상품 관리 -->
        <li class="nav-item">
          <a class="nav-link" href="boardadmin.html">
            <i class="fas fa-fw fa-table"></i>
            <span>상품관리</span></a>
        </li>
  
        <!-- 차트  쓸거면 쓰고 안쓰면 삭제 -->
        <li class="nav-item">
          <a class="nav-link" href="charts.html">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>통계</span></a>
        </li>
      </ul>
  
  
        <!-- 차트  쓸거면 쓰고 안쓰면 삭제 -->
        <li class="nav-item">
          <a class="nav-link" href="charts.html">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>통계</span></a>
        </li>
      </ul>
  

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">회원</a>
          </li>
          <li class="breadcrumb-item active">Tables</li>
        </ol>

        <!-- 회원정보 / 상세정보는 팝업창으로 -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
           신고관리</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>신고번호</th>
                    <th>신고게시판</th>
                    <th>아이디</th>
                    <th>신고사유</th>
                    <th>신고내용</th>
                    <th>신고자</th>
                    <th>탈퇴</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>신고번호</th>
                    <th>신고게시판</th>
                    <th>아이디</th>
                    <th>신고사유</th>
                    <th>신고내용</th>
                    <th>신고자</th>
                    <th>탈퇴</th>
                  </tr>
                </tfoot>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>자유</td>
                        <td>boy9412@naver.cm</td>
                        <td>도박</td>
                        <td>토토사이트를 도배합니다.ddddddddddddddddd</td>
                        <td>dldl@gmail.com</td>
                        <td><a href="#"><button type="button">탈퇴</button></a></td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>자유</td>
                        <td>boy9412@naver.cm</td>
                        <td>도박</td>
                        <td>토토사이트를 도배합니다.ddddddddddddddddd</td>
                        <td>dldl@gmail.com</td>
                        <td><a href="#"><button type="button">탈퇴</button></a></td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>자유</td>
                        <td>boy9412@naver.cm</td>
                        <td>도박</td>
                        <td>토토사이트를 도배합니다.dddddddddddddddd</td>
                        <td>dldl@gmail.com</td>
                        <td><a href="#"><button type="button">탈퇴</button></a></td>
                      </tr>
                </tbody>
              </table>
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

  <!-- Bootstrap core JavaScript-->
  <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

  <!-- Core plugin JavaScript-->
 <script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js" />"></script>

  <!-- Page level plugin JavaScript-->
  <script src="<c:url value="/resources/vendor/datatables/jquery.dataTables.js" />"></script>
  <script src="<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.js" />"></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value="/resources/js/admin/sb-admin.min.js" />"></script>

  <!-- Demo scripts for this page-->
 <script src="<c:url value="/resources/js/admin/demo/datatables-demo.js" /> "></script>

</body>

</html>
