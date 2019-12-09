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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
          <a class="nav-link" href="useradmin.html">
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
        <!-- 차트  쓸거면 쓰고 안쓰면 삭제 -->
        <li class="nav-item">
          <a class="nav-link" href="<c:url value="/admin/chart/chart.do"/>">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>통계</span></a>
        </li>
      </ul>
  

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">상품</a>
          </li>
          <li class="breadcrumb-item active">Product</li>
        </ol>

        <!-- 회원정보 / 상세정보는 팝업창으로 -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
           상품관리</div>
          <div class="card-body">
            <div class="table-responsive">
            <div class="inout"><button id="regNdel">제품등록</button><button id="inputbutton">제품 입고</button><button id="outputbutton">제품 출고</button></div>
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th><input type="checkbox" id="checkall" value="0"/> 제품번호</th>
                    <th>상품명</th>
                    <th>대상</th>
                    <th>분류</th>
                    <th>가격</th>
                    <th>재고량</th>
                    <th>제조사</th>
                    <th>삭제</th>
                  </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th colspan="8"><button id="checkallbutton">전체선택</button><button id="cancelchoice">선택해제</button><button id="cancelorder">주문 취소</button></th>
                    </tr>
                  </tfoot> 
                <tbody>
                <c:forEach var="p" items="${list}">
                  <tr>
                    <td><input type="checkbox" name="a" value=""/> &nbsp ${p.productId}</td>
                    <td>${p.productName}</td>
                    <td><c:if test="${p.animalNo == 1}">강아지</c:if><c:if test="${p.animalNo == 2}">고양이</c:if></td>
                    <td>
                    	<c:if test="${p.categoryNo == 1}">의류</c:if>
                    	<c:if test="${p.categoryNo == 2}">식품</c:if>
                    	<c:if test="${p.categoryNo == 3}">식기/주거</c:if>
                    	<c:if test="${p.categoryNo == 4}">장난감</c:if>
                    	<c:if test="${p.categoryNo == 5}">위생</c:if>
                     </td>
                    <td><fmt:formatNumber value="${p.price}" pattern="###,###,###"/></td>
                    <td>${p.stock}</td>
                    <td>${p.company}</td>
                    <td><a href="delete.do?productId=${p.productId}" id="selectDelete" data-no="${p.productId}">삭제</a></td>
                  </tr>               
                </c:forEach>
                </tbody>
              </table>
              <!-- 등록모달창 시작 -->
              <div id="registerpopup" class="layer">
                  <div class="box">
                       <a href="#"><span>x</span></a>
                       <div id="inputtitle">제품 등록</div>
                       <div>
                        <form id="pForm">                            
                        <div>
                          분류: <select name="category" id="selectCategory">
                          <c:forEach var="c" items="${cList}">
                            <option value="${c.categoryNo}">${c.categoryName}</option>
                           </c:forEach>
                          </select>
                        </div>
                        <div>상품명 : <input type="text" name="productname"/></div>                             
                        <div>품번 : <input type="text" name="productno"/></div>
                        <div>가격 : <input type="text" name="productprice"/></div>
                        <div>제조사 : <input type="text" name="company"/></div>
                        <button id="listupbtn" type="button">목록에 올리기</button>
                        </form>
                        <div id="registerlist">
                          <table id="inputlisttable">
                              <thead>
                                  <tr>                                    
                                    <th>분류</th>
                                    <th>상품명</th>
                                    <th>품번</th>                                    
                                    <th>가격</th>
                                    <th>제조사</th>
                                  </tr>
                                </thead>
                                <tbody id="registertbody">
                                                                  
                                </tbody>
                          </table>
                        </div>
                       </div>
                    <button id="completebtn1">완료</button>
                  </div>
                </div>
              <!-- 모달창 끝 -->            
              <!-- 입고모달창 시작 -->
              <div id="inputpopup" class="layer">
                  <div class="box">
                       <a href="#"><span>x</span></a>
                       <div id="inputtitle">제품 입고</div>
                       <div>
                        <form id="pForm">                         
                        <div>품번 : <input type="text" name="productno"/></div>
                        <div>수량 : <input type="number" name="productcount" min="0" max="100" /></div>
                        <button id="listupbtn">목록에 올리기</button>
                        </form>
                        <div id="inputlist">
                          <table id="inputlisttable">
                              <thead>
                                  <tr>                                    
                                    <th>상품명</th>
                                    <th>품번</th>                                    
                                    <th>입고수량</th>
                                    <th>제조사</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td>참맛있는 개껌</td>
                                    <td>fd-001</td>
                                    <td>30</td>
                                    <td>맛있는 식품</td>
                                  </tr>
                                  <tr>
                                    <td>느낌있는 바바리코트</td>
                                    <td>cl-001</td>
                                    <td>5</td>
                                    <td>예쁜옷</td>
                                  </tr>
                                  <tr>
                                    <td>강아지용 헤드라이트</td>
                                    <td>cl-031</td>
                                    <td>15</td>
                                    <td>실용적인 강아지옷</td>
                                  </tr>
                                </tbody>
                          </table>
                        </div>
                       </div>
                    <button id="completebtn2">완료</button>
                  </div>
                </div>
              <!-- 모달창 끝 -->            
              <!-- 출고모달창 시작 -->
              <div id="outputpopup" class="layer">
                  <div class="box">
                       <a href="#"><span>x</span></a>
                       <div id="inputtitle">제품 출고</div>
                       <div>
                        <form id="pForm">                         
                        <div>품번 : <input type="text" name="productno"/></div>
                        <div>수량 : <input type="number" name="productcount" min="0" max="100" /></div>
                        <button id="listupbtn">목록에 올리기</button>
                        </form>
                        <div id="outputlist">
                          <table id="inputlisttable">
                              <thead>
                                  <tr>                                    
                                    <th>상품명</th>
                                    <th>품번</th>                                    
                                    <th>출고수량</th>
                                    <th>매출액</th>
                                    <th>재고수량</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td>참맛있는 개껌</td>
                                    <td>fd-001</td>
                                    <td>3</td>
                                    <td>36,000</td>
                                    <td>2</td>
                                  </tr>
                                  <tr>
                                    <td>참맛있는 개껌</td>
                                    <td>fd-001</td>
                                    <td>3</td>
                                    <td>36,000</td>
                                    <td>2</td>
                                  </tr>
                                  <tr>
                                    <td>참맛있는 개껌</td>
                                    <td>fd-001</td>
                                    <td>3</td>
                                    <td>36,000</td>
                                    <td>2</td>
                                  </tr>
                                  <tr>
                                    <td>참맛있는 개껌</td>
                                    <td>fd-001</td>
                                    <td>3</td>
                                    <td>36,000</td>
                                    <td>2</td>
                                  </tr>
                                </tbody>
                          </table>
                        </div>
                       </div>
                    <button id="completebtn3">완료</button>
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
  <script src="<c:url value="/resources/js/admin/product.js"/>"></script>
</body>

</html>
