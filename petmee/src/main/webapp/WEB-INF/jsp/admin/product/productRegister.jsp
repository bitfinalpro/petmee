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

    <a class="navbar-brand mr-1" href="<c:url value="/main.do"/>">PETME ADMIN</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

  </nav>

  <div id="wrapper">
      <!-- 사이드 바 -->
      <ul class="sidebar navbar-nav">
        <!-- 메인 -->
        <li class="nav-item active">
          <a class="nav-link" href="<c:url value="/admin/chart/chart.do" />">
            <i class="fas fa-home"></i>
            <span>메인</span>
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
               <!-- 등록 폼 시작 -->
               <!-- #pForm div {
    margin: 20px 10%;} 삭제 (product.css 58줄),
 -->
    <style>
    #classify{margin : 0px 0px; margin-left: 3.5%; margin-top: 30px;}
    #classify span{float: none; font-size: 16px; color: #000; margin-top: 0px; margin-bottom: 15px; }
    #rForm {padding-left: 15%;}
     #rForm ul li span{float: none; font-size: 16px;  color: #000; display: inline-block; margin-top: 0px; margin-right: 0px;}
     #rForm ul li{list-style: none;}
     .file_span {width:133px; }
     .ad_infoinput{width:170px;}
     .ad_file {width:300px}
     #CategoryIdBox{display: inline-block;}
    </style> 
                  <div class="box">
                       <div id="inputtitle">제품 등록</div>
                        <form id="rForm" action="<c:url value="/admin/product/productRegister2.do"/>" onSubmit="return check();" method="post"
						enctype="multipart/form-data">    
                        <div id="classify">
                         <style>
                       #tbProduct {width:80%;border: 1px solid red;}
                      .tbProductTh {background-color: slategray;color: #fff;text-align: center;}
                      .tbProductTr {border:1px solid #ccc}
                      .tbProductTd{padding-left:20px;}
                       </style>
                       <table id="tbProduct">
                       	<tr class="tbProductTr">
                       		<th class="tbProductTh">분류</th>
                       		<td><select name="categoryNo" id="selectCategory">
                          <c:forEach var="c" items="${cList}">
                            <option value="${c.categoryNo}">${c.categoryName}</option>
                           </c:forEach>
                          </select></td>                      	
                       	</tr>
                       	<tr class="tbProductTr">
                       		<th class="tbProductTh">품번</th>
                       		<td class="tbProductTd"><p id="CategoryIdBox">fd- </p> <input class="ad_infoinput" type="text" name="productId" value="${lastNumber}" style="width: 50px"/></span><td>
                       	</tr>
                       	<tr class="tbProductTr">
                       		<th class="tbProductTh">상품명</th>
                       		<td class="tbProductTd"><input class="ad_infoinput" type="text" name="productName"/></span></td>
                       	</tr>
                       	<tr class="tbProductTr">
                       		<th class="tbProductTh">수량</th>
                       		<td class="tbProductTd"><input type="number" id="product_number" name="stock" value="1" min="0"></span></td>
                       	</tr>
                       	<tr class="tbProductTr">
                       		<th class="tbProductTh">판매상태</th>
                       		<td class="tbProductTd"><select name="sellCondition">
                           		<option value="0">판매대기중</option>
                           		<option value="1">판매중</option>
                           		<option value="2">품절</option>
                          		</select> </span></td>
                       	</tr>
                       	<tr class="tbProductTr">
                       		<th class="tbProductTh">애완종류</th>
                       		<td class="tbProductTd"><select name="animalNo" >
                           		<option value="1">강아지</option>
                           		<option value="2">고양이</option>
                           		</select></span></td>
                       	</tr>
                       	<tr class="tbProductTr">
                       		<th class="tbProductTh">가격</th>
                       		<td class="tbProductTd"></span><input class="ad_infoinput" type="text" name="price"/></td>
                       	</tr>
                       	<tr class="tbProductTr">
                       		<th class="tbProductTh">간략 설명</th>
                       		<td class="tbProductTd"><input class="ad_infoinput" type="text" name="productInfo"/></td>
                       	</tr>
                       	<tr class="tbProductTr">
                       		<th class="tbProductTh">제조사</th>
                       		<td class="tbProductTd"><input class="ad_infoinput" type="text" name="company"/></td>
                       	</tr>
                       	<tr class="tbProductTr">
                       		<th class="tbProductTh">할인 가격</th>
                       		<td class="tbProductTd"><input class="ad_infoinput" type="text" name="dcPrice"/></td>
                       	</tr>
                       	<tr class="tbProductTr">
                       		<th class="tbProductTh">상품 이미지</th>
                       		<td class="tbProductTd"><input class="ad_file" name="productfile" multiple="multiple"  type="file" /></td>
                       	</tr>
                       	<tr class="tbProductTr">
                       		<th class="tbProductTh">상품 상세 이미지</th>
                       		<td class="tbProductTd"><input class="ad_file" name="boardfile" multiple="multiple" type="file" /></td>
                       	</tr>
                       </table>  
                      <button id="completebtn1">완료</button>
                      <button class="cancelRegisterbtn"type="button">취소</button>
                        </form>     
                       </div>   
                       
                      
                       
                                        
                  </div>
              
              <!-- 등록 폼 끝 -->            
                
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
