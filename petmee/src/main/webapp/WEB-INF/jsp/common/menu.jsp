<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
      <div class="jbTitle">
           <div id="top_menu">
               <div>
                   <a href="<c:url value='/shopping/shoppingDetail.do'/> "><strong>공지스크롤(쇼핑디테일경로)</strong></a>
                   <a href="<c:url value='/admin/chart/chart.do'/> "><strong>admin</strong></a>
					<span><a href="<c:url value="/shop/shoppinglist/shoppinglist.do" />">장바구니<span>${user.shoppingCnt}</span></a></span>
					<span><a href="<c:url value="/shop/shoppinglistdetail/shoppinglistdetail.do" />">주문/결제</a></span>
                </div>
                <div>
                	<c:if test="${empty user}">
	                    <span><a onclick="$('#login-pop').modal('show');" href="javascript:;">LOGIN</a></span>
	                    <span>/</span>
	                    <span><a href="<c:url value="/shopping/login/join.do"/>">JOIN</a></span>
                	</c:if>
                	<c:if test="${not empty user}">
	                    <span><a href="<c:url value="/shopping/login/logout.do" />">LOGOUT</a></span>
	                    <span>/</span>
	                    <span><a href="<c:url value="/shopping/login/mypage.do"/>">MYPAGE</a></span>
                	</c:if>
                </div>
            </div>
      </div>
      <div class="jbMenu">
        <div class="logo">
        <a href="<c:url value="/main.do"/>"><img src="<c:url value='/resources/images/menu/final_logo.png' />"></a>
      </div>
          <div class="menu">
                <nav>
                    <ul>
                        <li class="drop01"><a href="<c:url value="/shop/productList.do" />"><span>FOOD</span></a>
                            <ul>
                                <li><a class="gnb_a" href="<c:url value="/shop/productList.do?categoryNo=1" />">사료</a></li>
                                <li><a class="gnb_a" href="<c:url value="/shop/productList.do?categoryNo=2" />">간식</a></li>
                            </ul>
                        </li>
                        <li class="drop01"><a href="#">패션</a>
                            <ul id="sub_gnb">
                                <li><a class="gnb_a" href="<c:url value="/shop/productList.do?categoryNo=3" />">티셔츠/아우터</a></li>
                                <li><a class="gnb_a" href="<c:url value="/shop/productList.do?categoryNo=4" />">신발</a></li>
                                <li><a class="gnb_a" href="<c:url value="/shop/productList.do?categoryNo=5" />">악세사리/외출용품</a>
                                    <!-- <ul>
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                    </ul> -->
                                </li>
                            </ul>
                        </li>
                        <li class="drop01"><a href="#">미용/목욕</a>
                            <ul>
                                <li><a class="gnb_a" href="<c:url value="/shop/productList.do?categoryNo=6" />">목욕용품</a></li>
                                <li><a class="gnb_a" href="<c:url value="/shop/productList.do?categoryNo=7" />">미용용품</a></li>
                            </ul>
                        </li>
                        <li class="drop01"><a href="#">위생/배변</a>
                            <ul>
                                <li><a class="gnb_a" href="<c:url value="/shop/productList.do?categoryNo=8" />">위생/배변</a></li>
                                <li><a class="gnb_a" href="<c:url value="/shop/productList.do?categoryNo=9" />">청소용품</a></li>
                            </ul>
                        </li>
                        <li class="drop01"><a href="<c:url value="/shop/productList.do?categoryNo=10" />">장난감</a></li>
                        <li class="drop01"><a href="#" />커뮤니티</a>
                            <ul>
                                <li><a class="gnb_a" href='<c:url value="/board/noticeboard/notice.do" />'>공지사항</a></li>
                                <li><a class="gnb_a" href='<c:url value="/board/freeboard/list.do" />'>자유게시판</a></li>
                                <li><a class="gnb_a" href="<c:url value="/board/parcelboard/parcelList.do" />">분양게시판</a></li>
                                <li><a class="gnb_a" href='<c:url value="/board/reviewboard/review_list.do" />'>리뷰게시판</a></li>
                                <li><a class="gnb_a" href='<c:url value="/board/qnaboard/qna-list.do" />'>Q&A게시판</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
          </div>
      </div>
</header>

<script type="text/javascript" >
window.onload = function(){
$(document).ready(function(){
	$("#logi").click(function(e) {
		let check1 = document.querySelector("#inputs_user_email");
		let check2 = document.querySelector("#inputs_user_pass");
		if(check1.value.length!=check1.value.trim().length) {
			alert("공백 문자없이 이메일을 입력해주세요.");
			check1.focus();
			return(false);
		}
		if(check2.value.length!=check2.value.trim().length) {
			alert("공백문자없이 비밀번호를 입력해주세요.");
			check2.focus();
			return(false);
		}
		
		$.ajax({ 
			url : '<c:url value="/shopping/login/login.do" />',
			type: "POST",
			async: false, // 비동기식 앞에꺼말고 뒤에꺼 처리할때 기다려라
	    	data : {email:$("#inputs_user_email").val(), pass:$("#inputs_user_pass").val()},
	    	dataType:"text",
	        cache: false,
	    	success:function(data) {
				if (data == "f") {
					alert("해당 회원정보를 찾을 수 없습니다.");
				 }
				else {
					alert("로그인되었습니다.");
					location.href="/petmee/main.do"
				}
			}
		});
	});	
});
}
</script>
<!-- 로그인 모달창 -->
<div class="modal pop-con-modal" id="login-pop" style="display: none; z-index: 9999999; color:#fff;" aria-hidden="false" >
	<div class="modal_standard">
		<div class="modal_wrap">
			<div class="modal-dialog">
				<div class="modal-con">
				<button title="Close (Esc)" type="button" class="mfp-close" data-dismiss="modal"><i class="xi-close-thin"></i></button>
				<div class="pop-head">로그인</div>
                <form method="post" name="LoginForm" id="LoginForm" action="<c:url value="/shopping/login/login.do" />">
				<div class="pop-box login-box">   
                                        <div class="inputbox">
                                        	<input type="text" name="email" id="inputs_user_email" placeholder="이메일주소" value=""><label>이메일</label>
                                        </div>
                                        <div class="inputbox">
                                        	<input type="password" name="pass" id="inputs_user_pass" placeholder="비밀번호"><label>비밀번호</label>
                                        </div>			
                                        <div class="util clearfix">
                                            <div class="left chk_area">
                                                <input type="checkbox" name="save_id" value="OK" id="save_id">
                                                <label for="save_id">아이디 저장하기</label>
                                            </div>
                                            <div class="right">
                                                <a href="<c:url value="/shopping/login/find.do"/>">아이디/비밀번호 찾기</a>
                                            </div>
                                        </div>
                                	</div>
                                
	                            	<input type="button" id="logi" class="btn" value="로그인" />
	                            </form>
                                <div class="join_linkbox">
                                    <a href="<c:url value="/shopping/login/join.do"/>">
                                        <p class="f_24 _b2">회원가입</p>
                                        <p>아직 회원이 아니세요? 
                                        	<i class="xi-arrow-right _mc"></i>
                                        </p>
                                    </a>
                                </div>
                            </div>
                        </div> <!-- con -->
                    </div> <!-- dia --> 
                </div> <!-- wrap -->
            </div> <!-- stard -->
            <div class="black"></div>
        </div> <!-- modal -->
	<%-- <script src="<c:url value="/js/jquery.magnific-popup.js" />"></script> --%>
	<script src="<c:url value='/resources/js/common/menu.min.js' />"> </script>