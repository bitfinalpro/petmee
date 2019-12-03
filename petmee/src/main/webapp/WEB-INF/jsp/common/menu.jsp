<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header clearfix">
        <div class="headwrap clearfix">
            <h1 class="logo">
            	<a href="<c:url value="/main.do" />"></a>
            </h1>
            <div class="util_wrap">
                <ul class="clearfix">
                    <li>
                    	<a onclick="$('#login-pop').modal('show');" href="javascript:;">LOGIN</a>
                    </li>
                    <li><a href="<c:url value="/main/member/join.do"/>">JOIN</a></li>
                    <li><a href="<c:url value="/main/member/mypage.do"/>">MYPAGE</a></li>
                </ul>
            </div>
            <div class="search_wrap">
                <div class="search_box">
                    <form method="get" action="/pc/main/search.html" onsubmit="return allsearch(this);">
                        <input class="input" type="text" title="검색어" name="search_word"
                            placeholder="검색어를 입력하세요">
                        <input type="submit" class="btn" value="검색">
                    </form>
                </div>
            </div>
        </div>
        <nav>
            <div class="gnb">
                <div class="gnb_wrap">
                    <ul class="depth clearfix">
                        <li class="depth01" data-id="menu1">
                            <a href="#">ABOUT MINIPET </a>
                            <div class="depth02_box">
                                <ul class="clearfix tab">
                                    <li><a href="#"></a></li>
                                    <li><a href="#"></a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="depth01" data-id="menu2">
                            <a href="#">분양시스템</a>
                            <div class="depth02_box">
                                <ul class="clearfix tab">
                                    <li><a href="#"></a></li>
                                    <li><a href="#"></a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="depth01 _down" data-id="menu7">
                            <a href="#">WEDDING</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- 로그인 모달창 -->
        <div class="modal pop-con-modal" id="login-pop" style="display: none; z-index: 9999999;" aria-hidden="false" >
			<div class="modal_standard">
                        <div class="modal_wrap">
                            <div class="modal-dialog">
                                <div class="modal-con">
                                    <button title="Close (Esc)" type="button" class="mfp-close" data-dismiss="modal"><i class="xi-close-thin"></i></button>
                                    <div class="pop-head">로그인</div>
                                    
                                    <form method="post" name="LoginForm" id="LoginForm" action="../member/login_ok.php" onsubmit="return login_check(this);">
                                    <div class="pop-box login-box">   
                                        <div class="inputbox">
                                        	<input type="text" name="user_id" placeholder="아이디" value=""><label>아이디</label>
                                        </div>
                                        <div class="inputbox">
                                        	<input type="password" name="user_pwd"  placeholder="비밀번호"><label>비밀번호</label>
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
                                        <p>아직 회원이 아니세요? <i class="xi-arrow-right _mc"></i></p>
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
<script src="<c:url value='/resources/lib/jquery-3.4.1.js' />"></script>
<script src="<c:url value='/resources/js/commen/menu.min.js' />"> </script>
