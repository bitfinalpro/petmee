<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
      <div class="jbTitle">
           <div id="top_menu">
               <div>
                   <a href="<c:url value='/shopping/shoppingDetail.do'/> "><strong>공지스크롤(쇼핑디테일경로)</strong></a>
                   <a href="<c:url value='/admin/user/menu.do'/> "><strong>admin</strong></a>
					<span><a href="<c:url value="/shop/shoppinglist/shoppinglist.do" />">장바구니</a></span>
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
        <a href="<c:url value="main.do"/>"><img src="<c:url value='/resources/images/menu/final_logo.png' />"></a>
      </div>
          <div class="menu">
                <nav>
                    <ul>
                        <li class="drop01"><a href="#"><span>FOOD</span></a>
                            <ul>
                                <li><a href="#">사료</a></li>
                                <li><a href="#">간식</a></li>
                            </ul>
                        </li>
                        <li class="drop01"><a href="#">패션</a>
                            <ul>
                                <li><a href="#">패딩/아우터</a></li>
                                <li><a href="#">신발/양말</a></li>
                                <li><a href="#">티셔츠/올인원</a>
                                <li><a href="#">악세사리/외출용품</a>
                                    <!-- <ul>
                                        <li><a href="#">HTML</a></li>
                                        <li><a href="#">CSS</a></li>
                                    </ul> -->
                                </li>
                            </ul>
                        </li>
                        <li class="drop01"><a href="#">미용/목욕</a>
                            <ul>
                                <li><a href="#">목욕용품</a></li>
                                <li><a href="#">발톱관리</a></li>
                                <li><a href="#">눈/귀/구강관리</a></li>
                                <li><a href="#">미용/털관리</a></li>
                            </ul>
                        </li>
                        <li class="drop01"><a href="#">위생/배변</a>
                            <ul>
                                <li><a href="#">배변용품</a></li>
                                <li><a href="#">위생용품</a></li>
                                <li><a href="#">털제거/청소용품</a></li>
                            </ul>
                        </li>
                        <li class="drop01"><a href="#">장난감</a></li>
                        <li class="drop01"><a href="#">커뮤니티</a>
                            <ul>
                                <li><a href='<c:url value="/board/noticeboard/notice.do" />'>공지사항</a></li>
                                <li><a href='<c:url value="/board/freeboard/list.do" />'>자유게시판</a></li>
                                <li><a href="#">봉사활동</a></li>
                                <li><a href="<c:url value="/board/parcelboard/parcelList.do" />">분양게시판</a></li>
                                <li><a href='<c:url value="/board/volunteerreviewboard/list.do"/>'>후기게시판</a></li>
                                <li><a href='<c:url value="/board/reviewboard/review_list.do" />'>리뷰게시판</a></li>
                                <li><a href='<c:url value="/board/reviewboard/review_list.do" />'>Q&A게시판</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
          </div>
      </div>
</header>
       <!-- 로그인 모달창 -->
        <div class="modal pop-con-modal" id="login-pop" style="display: none; z-index: 9999999;" aria-hidden="false" >
			<div class="modal_standard">
                        <div class="modal_wrap">
                            <div class="modal-dialog">
                                <div class="modal-con">
                                    <button title="Close (Esc)" type="button" class="mfp-close" data-dismiss="modal"><i class="xi-close-thin"></i></button>
                                    <div class="pop-head">로그인</div>
<!--                                      onsubmit="return login_check(this); -->
                                    <form method="post" name="LoginForm" id="LoginForm" action="<c:url value="/shopping/login/login.do" />">
                                    <div class="pop-box login-box">   
                                        <div class="inputbox">
                                        	<input type="text" name="email" placeholder="이메일주소" value=""><label>이메일</label>
                                        </div>
                                        <div class="inputbox">
                                        	<input type="password" name="pass"  placeholder="비밀번호"><label>비밀번호</label>
                                        </div>			
                                        <div class="util clearfix">
                                            <div class="left chk_area">
                                                <input type="checkbox" name="save_id" value="OK" id="save_id">
                                                <label for="save_id">아이디 저장하기</label>
                                            </div>
                                            <div class="right">
                                                <a href="../member/find.html">아이디/비밀번호 찾기</a>
                                            </div>
                                        </div>
                                	</div>
                                
	                            	<input type="submit" class="btn" value="로그인" />
	                            </form>
                                <div class="join_linkbox">
                                    <a href="../join.html">
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
	<script src="<c:url value='/resources/js/common/jquery-3.4.1.js' />"></script>
	<script src="<c:url value='/resources/js/common/menu.min.js' />"> </script>