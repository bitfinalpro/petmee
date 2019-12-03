<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="<c:url value="/resources/css/css.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
    <script src="./js/jquery-1.11.1.min.js"></script>
    
    <title>(주)펫미</title>
</head>
    
<body>
    <div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
		<!-- 로그인 모달창 -->
            <div class="modal pop-con-modal" id="login-pop" style="display: none; z-index: 9999999;" aria-hidden="false" >
                <div class="modal_standard">
                        <div class="modal_wrap">
                            <div class="modal-dialog">
                                <div class="modal-con">
                                    <button title="Close (Esc)" type="button" class="mfp-close" data-dismiss="modal"><i class="xi-close-thin"></i></button>
                                    <div class="pop-head">로그인</div>
                                    
                                    <form method="post" name="LoginForm" id="LoginForm" action="login.do" onsubmit="return login_check(this);">
	                                    <div class="pop-box login-box">
                                        
                                        <div class="inputbox"><input type="text" name="user_id" placeholder="아이디" value=""><label>아이디</label></div>
                                        <div class="inputbox"><input type="password" name="user_pwd"  placeholder="비밀번호"><label>비밀번호</label>
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
	</div>
     <div id="contents" class="main-contents">
            <section>
                <img src="/images/menu/section_img.jpg">
                <img src="/images/menu/section_img.jpg">
                <img src="/images/menu/section_img.jpg">
            </section>
        </div>
    
    <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
    <!-- content 끝 -->
  	<script>
		let no = ${board.no};
	</script>
	<script src="<c:url value='/resources/js/reviewboard.js' />"></script>
    <!-- footer 시작 -->
	<div id="footer" class="footer_wrap clearfix">
		<c:import url='/WEB-INF/jsp/common/footer.jsp'></c:import>
	</div>
</body>
</html>