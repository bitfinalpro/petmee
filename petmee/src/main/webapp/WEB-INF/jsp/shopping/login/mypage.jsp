<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko" class=" js no-touch">
<head>
    <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">  
    <meta name="viewport" content="width=1200, maximum-scale=1.5, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">

	<%@ include file="/WEB-INF/jsp/include/login/mypagecss.jsp" %>
    
    <script src="<c:url value='/js/login/jquery-1.11.1.min.js' />"></script>
    <script src="<c:url value='/js/login/ch-plugin-web.js' />"></script>
    <title>(주)펫미</title>
</head>

<body cz-shortcut-listen="true">
    <img src="http://asp8.http.or.kr/sr.gif?d=r6790607538803.14" style="width:1px;height:1px;position:absolute;display:none" onload="logCorpAnalysis_full.ch()" alt="">
  <noscript><img src="http://asp8.http.or.kr/HTTP_MSN/Messenger/Noscript.php?key=minipet" style="display:none;width:0;height:0;" alt="" /></noscript>
  <!-- LOG corp Web Analitics & Live Chat END -->
  
  <!-- 2019-02-26 banghg -->
  <script src="http://pop.site3.co.kr/retg.php?c=1808"></script>
  
  <script src="http://pop.site3.co.kr/retg.php?c=1315"></script>
  
  <script src="http://pop.site3.co.kr/retg.php?c=1296"></script>
  
  <!-- 2019-07-12 cafe24스마트 -->
  <!-- Enliple Common Tracker v3.5 [공용] start -->
  <script type="text/javascript">
      function mobRf(){
          var rf = new EN();
          rf.setData("userid", "minipet");
          rf.setSSL(true);
          rf.sendRf();
      }
  </script>
  <script src="https://cdn.megadata.co.kr/js/en_script/3.5/enliple_min3.5.js" defer="defer" onload="mobRf()"></script>
  <!-- Enliple Common Tracker v3.5 [공용] end -->
  
  <!-- Enliple Shop Log Tracker v3.5 start -->
  <script type="text/javascript">
  function mobRfShop(){
    var sh = new EN();      
    // [상품상세정보]
   
    sh.setData("sc", "3b76452d2b83453cd758cbbda8831b28");
    sh.setData("userid", "minipet");
    sh.setData("pcode", "{$product_no}");
    sh.setData("price", "{$product_price}");
    sh.setData("pnm", encodeURIComponent(encodeURIComponent("{$name|striptag}")));
    sh.setData("img", encodeURIComponent("{$big_img}"));
    sh.setData("dcPrice", "{$product_sale_price}");  
    sh.setData("soldOut", "{$soldout_display|display}" == "displaynone" ? "2" : "1");
    sh.setData("mdPcode", ""); 
    sh.setData("cate1", encodeURIComponent(encodeURIComponent(sh.getParam(location.href, "cate_no"))));
    sh.setSSL(true);
    sh.sendRfShop();
  
    }
  </script>
  <script src="https://cdn.megadata.co.kr/js/en_script/3.5/enliple_min3.5.js" defer="defer" onload="mobRfShop()"></script>
  <!-- Enliple Shop Log Tracker v3.5 end  -->
  
  
  <!-- Global site tag (gtag.js) - Google Ads: 720540785 2019-08-02-->
  <script async="" src="https://www.googletagmanager.com/gtag/js?id=AW-720540785"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
  
    gtag('config', 'AW-720540785');
  </script>
  
  
    <title>(주)펫미 </title>
  
  
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/191007/1570443254160/191007.js"></script>
  <script type="text/javascript" src="/static/js/jquery-1.11.1.js"></script>
  <script type="text/javascript" src="/static/js/space_check.js"></script>
  <script type="text/javascript" language="JavaScript">

      window.history.forward(1);
      
      $(document).ready(function(){						
          $("#nickname_check").click(function() {								
              if(isFieldBlank(theForm.nickname)||isFieldSpace(theForm.nickname)) {
                  alert("공백 문자없이 닉네임을 입력해주세요.");
                  theForm.nickname.focus();
                  return(false);
              }
                                                          
              $.ajax({ 
                  url : 'nickname_check.php', 
                  type : "post", 
                  dataType:"JSON",
                  async: false,		    
                  data : {nickname:$("#nickname").val()}, 	    	
                  contentType: "application/x-www-form-urlencoded; charset=utf-8",
                  success:function(data) {			    				  				    				    		    				    				    				data_check = data;	
                  }
              });
              if (data_check=="OK") {								
                  $("#nickname_check_ok").val("1");
                  $("#nickname").attr("readonly",true);
                  $("#nickname_check").prop("disabled",true);								
                  alert("사용 가능한 닉네임 입니다.");
              }			
              else {
                  alert("이미 사용중인 아이디 입니다.");
                  theForm.nickname.focus(); 
              }
              return(false);
          });	
          
          $("#email_check").click(function() {								
              if(isFieldBlank(theForm.user_email)||isFieldSpace(theForm.user_email)) {
                  alert("공백 문자없이 이메일을 입력해주세요.");
                  theForm.user_email.focus();
                  return(false);
              }
                                                          
              $.ajax({ 
                  url : 'email_check.php', 
                  type : "post", 
                  dataType:"JSON",
                  async: false,		    
                  data : {user_email:$("#user_email").val()}, 	    	
                  contentType: "application/x-www-form-urlencoded; charset=utf-8",
                  success:function(data) {			    				  				    				    		    				    				    				
                    data_check = data;	
                  }
              });
              if (data_check=="OK") {								
                  $("#email_check_ok").val("1");
                  $("#user_email").attr("readonly",true);
                  $("#email_check").prop("disabled",true);								
                  alert("사용 가능한 이메일 입니다.");
              }			
              else {
                  alert("이미 사용중인 이메일 입니다.");
                  theForm.user_email.focus(); 
              }
              return(false);
          });										
      });
      
      function sendcheck() {							
          
          var pwReg =/^[A-Za-z0-9]{4,20}$/g;			
          var numReg=/[0-9]/g;
          var engReg=/[a-z]/ig;
                                      
          if (isFieldBlank(theForm.userpasswd)) {  	 			 			
              alert("보안을 위해 현재 비빌번호를 입력해주세요.");
              theForm.userpasswd.focus();
              return(false);
          } 			
                                      
          if (!isFieldBlank(theForm.c_userpasswd)||!isFieldBlank(theForm.c_userpasswd2)) {  	 		
                                              
              if (isFieldBlank(theForm.c_userpasswd) || isFieldSpace(theForm.c_userpasswd)) {  	 			 			
                  alert("새 비밀번호 항목이 비었거나 공백문자를 사용하셨습니다.");
                  theForm.c_userpasswd.focus();
                  return(false);
              } 
                                  
              if (isFieldBlank(theForm.c_userpasswd2) || isFieldSpace(theForm.c_userpasswd2)) {  	 			 			
                  alert("새 비밀번호 확인 항목이 비었거나 공백문자를 사용하셨습니다.");
                  theForm.c_userpasswd2.focus();
                  return(false);
              }
              
              if(theForm.c_userpasswd.value!=theForm.c_userpasswd2.value) {	
                  alert("새 비밀번호와 새 비밀번호 확인이 다르게 입력되었습니다.");
                  theForm.c_userpasswd.focus();
                  return(false);
              }
                          
                  
              if(theForm.c_userpasswd.value.search(numReg) < 0 || theForm.c_userpasswd.value.search(engReg) < 0) {
                  alert("새 비밀번호에 영문 또는 숫자만 있습니다.\n\n영문/숫자 조합4~20자로 입력해주세요.");
                  return(false);
              }
                              
              if (!pwReg.test(theForm.c_userpasswd.value)) {
                  alert("새 비밀번호는 영문/숫자 조합4~20자로 입력해주세요.");
                  return(false);
              }
          }	
                                                  
             
          if(isFieldBlank(theForm.nickname)||isFieldSpace(theForm.nickname)) {
              alert("닉네임을 공백문자 없이 입력해주세요.");
              theForm.nickname.focus();
              return(false);
          }				
          
          if(theForm.nickname.value!=theForm.old_nickname.value) {			
              if (theForm.nickname_check_ok.value=="0") { 
                  alert("닉네임 중복여부를 체크 해주세요.");	 		
                  return(false);
              } 
          }
              
          if (isFieldBlank(theForm.user_email))	{
              alert("이메일 항목이 비어있습니다.");
              theForm.user_email.focus(); 
              return(false);
          }
          
          if(theForm.user_email.value!=theForm.old_user_email.value) {
              if (theForm.email_check_ok.value=="0") { 
                  alert("이메일 중복여부를 체크 해주세요.");	 		
                  return(false);
              }
          }
          if (isFieldBlank(theForm.zipcode))	{
              alert("우편번호 항목이 비어있습니다.");
              theForm.zipcode.focus(); 
              return(false);
          }
          
          if (isFieldBlank(theForm.address1))	{
              alert("주소항목이 비어있습니다.");
              theForm.address1.focus(); 
              return(false);
          }
          
          if (isFieldBlank(theForm.address2))	{
              alert("나머지 주소항목이 비어있습니다.");
              theForm.address2.focus(); 
              return(false);
          } 	     	
          
          
          if (numValue(theForm.mobile_1)) {   			 			
              alert("휴대폰 번호를 입력해 주세요.");
              theForm.mobile_1.focus();
              return(false);
          } 
              
          if (numValue(theForm.mobile_2)) {   			 			
              alert("휴대폰 번호를 입력해 주세요.");
              theForm.mobile_2.focus();
              return(false);
          } 
              
          if (numValue(theForm.mobile_3)) {   			 			
              alert("휴대폰 번호를 입력해 주세요.");
              theForm.mobile_3.focus();
              return(false);
          } 
              
          if(confirm("회원정보를 수정 하시겠습니까?")) theForm.submit();
          return(false);
                                          
      }		 			      	
  
  function DaumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var fullAddr = ''; // 최종 주소 변수
              var extraAddr = ''; // 조합형 주소 변수
  
              // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  fullAddr = data.roadAddress;
  
              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  fullAddr = data.jibunAddress;
              }
  
              // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
              if(data.userSelectedType === 'R'){
                  //법정동명이 있을 경우 추가한다.
                  if(data.bname !== ''){
                      extraAddr += data.bname;
                  }
                  // 건물명이 있을 경우 추가한다.
                  if(data.buildingName !== ''){
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                  fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
              }
  
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
  
              $("#zipcode").val(data.zonecode); //5자리 기초구역번호 사용
              $("#address1").val(fullAddr);
  
              // 커서를 상세주소 필드로 이동한다.
              $("#address2").focus();
          }
      }).open();
  }	
  </script>  
  <div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
<div id="contents" class="sub-contents">
        <div class="home">
               
        <div class="sub-visual">
            
      <div class="wrap">
          <div class="sub-visual-title wowrap">
              <h2 class="wow fadeInUp tit" data-wow-delay="0s" style="visibility: visible; animation-delay: 0s; animation-name: fadeInUp;">마이페이지</h2>
              <p class="wow fadeInUp txt" data-wow-delay="0.25s" style="visibility: visible; animation-delay: 0.25s; animation-name: fadeInUp;">삶의 소중한 인연, (주)펫미가 만남부터 동행하겠습니다.</p>
          </div>		
          <!-- <ul class="breadcrumb clearfix">
              <li class="depth01" style="display: none;"><a href=""></a></li>
              <li class="depth02"><a>마이페이지</a></li>
          </ul> -->
      </div>
      <!-- <div class="sub-visual-bg" style="background-image:url(../images/sub/mypage.jpg)"></div> -->
  </div>      
  <div class="sub-menu-list sub_dep02" style="display:block;">
    <ul class="clearfix tab tab2">
      <li><a href="#" class="on">회원정보 변경</a></li>
      <li><a href="#">작성 후기 보기</a></li>
      <li><a href="<c:url value='/shop/purchaseList/purchaseList.do' />" >구매내역</a></li>
    </ul>
  </div>      
  <div class="sub-con sub-pad">
          <div class="sub-title">
            <p class="desc">회원정보변경</p>          
            <p class="title_bold">CHANGE INFORMATION</p>
          </div>
  <div class="wrapper">
    <form method="post" name="theForm" action="<c:url value="/shopping/login/mypageUpdate.do" />"><!-- /shopping/login/mypageDelete.do -->
  
    <input type="hidden" name="nickname_check_ok" id="nickname_check_ok" value="0"> 
    <input type="hidden" name="email_check_ok" id="email_check_ok" value="0">
    <p class="tit_36">회원정보 변경
    	<span class="label"><em>(필수)</em>입력사항을 꼭 써주시기 바랍니다.</span>
    </p>
    <div class="join_form">
      <ul class="row">
     <c:forEach var="m" items="${mypagelist}"> 
<%-- 	    <li class="col-lg-6">
	      <div class="inputbox">
	        <label for="">아이디<em>(필수)</em></label>
	        <p class="input">${m.email}</p>
	      </div>
	    </li> --%>
	    <li class="col-lg-6">
          <div class="inputbox _btn">
          	<!-- <input type="text" name="email" id="user_email" placeholder="이메일" value=""> -->
            <%-- <input type="hidden" name="old_user_email" value="${m.email}"> --%>
            <label for="">이메일<em>(필수)</em></label>     
            <p class="input">${m.email}</p>       
            <!-- <a href="javascript:;void(0);" id="email_check" class="btn">중복체크</a> -->
          </div>
        </li>
        <li class="col-lg-6">
          <div class="inputbox">
            <label for="">이름<em>(필수)</em></label>
            <p class="input">${m.name}</p>
          </div>
        </li>
        <li class="col-lg-12">
          <div class="inputbox">
          <input type="password" name="userpasswd" maxlength="100" placeholder="보안을 위해 현재 사용 비밀번호를 입력해주세요.">
            <label for="">비밀번호<em>(필수)</em></label>
            <p class="valid">
              <i class="xi-check" title="비밀번호 일치"></i>            
            </p>
          </div>
        </li>
        <li class="col-lg-6">
          <div class="inputbox">
          	<input type="password" name="c_userpasswd" maxlength="100" placeholder="비밀번호 변경시에만 입력해주세요.">
            <label for="">새비밀번호<em>(필수)</em></label>
            <p class="valid">
              <!-- <i class="xi-check" title="비밀번호 일치"></i> -->
              <i class="xi-close" title="비밀번호 불일치"></i>
            </p>
          </div>
        </li>
        <li class="col-lg-6">
          <div class="inputbox"><input type="password" name="c_userpasswd2" maxlength="100" placeholder="비밀번호 변경시에만 입력해주세요.">
            <label for="">새비밀번호 확인<em>(필수)</em></label>
            <p class="valid">
              <!-- <i class="xi-check" title="비밀번호 일치"></i> -->
              <i class="xi-close" title="비밀번호 불일치"></i>
            </p>
          </div>
        </li>
<!--         <li class="col-lg-6">
          <div class="inputbox _btn"><input type="text" name="nickname" id="nickname" placeholder="닉네임" value="#">
            <input type="hidden" name="old_nickname" value="wnsdusdsa">
            <label for="">닉네임<em>(필수)</em></label>            
            <a href="javascript:;void(0);" id="nickname_check" class="btn">중복체크</a>
          </div>
        </li> -->
        
        <li class="col-lg-6">
          <div class="inputbox">
            <ul class="num">
              <li><input type="text" name="mobile_1" id="mobile_1" maxlength="12" value="${m.phone}"></li>
<!--               <li><input type="text" name="mobile_2" id="mobile_2" maxlength="4" value=""></li>
              <li><input type="text" name="mobile_3" id="mobile_3" maxlength="4" value=""></li> -->
            </ul>
            <!-- <input type="text" placeholder="핸드폰"> -->
            <label for="">핸드폰<em>(필수)</em></label>
          </div>
        </li>
         
        <li class="col-lg-6">
          <div class="inputbox">            
            <!-- <ul class="num">
              <li><input type="text" name="tel_1" id="tel_1" maxlength="4" value=""></li>
              <li><input type="text" name="tel_2" id="tel_2" maxlength="4" value=""></li>
              <li><input type="text" name="tel_3" id="tel_3" maxlength="4" value=""></li>
            </ul> -->
           <!--  <input type="text" placeholder="전화번호"> -->
           <input type="text" name="home_phone" id="input_mobile_1" maxlength="12" value="${m.home_phone}">
            <label>전화번호</label>
          </div>
        </li>
        
        <li class="col-lg-6">
          <div class="inputbox">
            <div class="row_5">
              <div class="col-lg-3"><input type="text" name="zipcode" id="zipcode" maxlength="5" readonly="" onclick="DaumPostcode();" value=""></div>
              <div class="col-lg-3"><a href="javascript:;" class="btn">우편번호</a></div>
              <div class="col-lg-6"><input type="text" maxlength="100" name="address1" id="address1" readonly="" value="${m.address}"></div>
            </div>
            <label for="">주소<em>(필수)</em></label>
          </div>
        </li>
        <li class="col-lg-6">
          <div class="inputbox">
            <input type="text" maxlength="100" name="address2" id="address2" value="${m.address_detail}">
            <label for="">상세주소</label>
          </div>
        </li>
        
        </c:forEach>
      <!--   <li class="col-lg-12 chk_area mt_20">
          <input type="checkbox" name="email_s" id="email_s" value="y"><label for="email_s">정보메일 수신 동의</label>
          <input type="checkbox" name="mobile_s" id="mobile_s" value="y"><label for="mobile_s">문자서비스 수신 동의</label>
        </li> -->
      </ul>
    </div>
    <div class="con-margin-02 text_center posi_r">
    	 <button type="submit" class="btn-type-01">변경완료</button>
    	<!-- 원본 -->
       <!-- <input type="button" value="변경완료" class="btn-type-01" onclick="return sendcheck('edit');"> -->
       <a href="javascript:;" onclick="$('.quit-pop').modal('show');" class="btn-type-02">회원탈퇴</a>
    </div>
  </form>
  </div>
</div>
</div> 
<!-- c -->
</div>
	<div class="modal pop-con-modal quit-pop " id="quit-pop" style="display: none;" aria-hidden="false">
	<div class="modal_standard text_left">
 	<div class="modal_wrap">
	<div class="modal-dialog">
	<div class="modal-con">
	<button title="Close (Esc)" type="button" class="mfp-close" data-dismiss="modal">
		<i class="xi-close-thin"></i>
	</button>
	<div class="pop-head _b2">회원탈퇴</div>
	<div class="pop-box text_left">
		<div class="join scroll-con-y mCustomScrollbar _mCS_1 mCS_no_scrollbar">
			<div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0">
				<div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
					그동안 펫미를 이용해 주셔서 감사합니다.
		              <br>더 좋은 서비스와 품질로 보답하겠습니다.
		              <br>
		              <br>* 탈퇴 후에는 아이디와 예약내역 등의 데이터 복구가 불가능합니다.
		              <br>* 탈퇴 후에는 등록된 게시물 삭제가 불가능합니다.
		          </div>
		          <div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;">
			          <div class="mCSB_draggerContainer">
				          <div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;" oncontextmenu="return false;">
				          	<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
				          </div>
				          <div class="mCSB_draggerRail"></div>
			          </div>
		          </div>
	          </div>
          </div>
          <script type="text/javascript" language="JavaScript">
              function memout_check(form) {				        													
                  if (form.check_1.checked!=true) { 
                      alert("내용 확인을 체크해 주세요.");      	      					
                      return(false); 
                  }    	    	    	
                  form.submit();					        						        
              } 
          </script>
          <form method="post" name="Memout" action="<c:url value="/shopping/login/mypageDelete.do" />">
              <div class="chk_area mt_20">
                  <input type="checkbox" name="check_1" id="quit_chk" value="ok">
                  <label for="quit_chk">위 내용을 모두 확인하였습니다.</label>
              </div>
              <div class="con-margin-01 row_5">
                  <div class="col-lg-6">
                  	  <a href='mypageDelete.do?no=${user.userNo}' class="btn-type-01">회원탈퇴</a>
                      <!-- <input type="button" style="width:100%" class="btn-type-01" onclick="memout_check(this.form);" value="회원탈퇴"> -->
                  </div>
                  <div class="col-lg-6">
                      <a href="javascript:;void(0);" style="width:100%" data-dismiss="modal" class="btn-type-02">취소</a>
                  </div>
              </div>
          </form>
      </div>
  </div>
  </div>
  </div>
  </div>
  </div> 
  <!-- footer 시작 -->
	<div id="footer" class="footer_wrap clearfix">
		<c:import url='/WEB-INF/jsp/common/footer.jsp'></c:import>
	</div>
  
  <!-- Channel Plugin Scripts -->
  <script>
    ;window.channelPluginSettings = {
      "pluginKey": "aa9fe4c5-bbb6-429f-a5f3-e31662509e80",
      "customLauncherSelector": ".custom-ch-btn",
      "hideDefaultLauncher": true
    };
    (function() {
      var w = window;
      if (w.ChannelIO) {
        return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
      }
      var d = window.document;
      var ch = function() {
        ch.c(arguments);
      };
      ch.q = [];
      ch.c = function(args) {
        ch.q.push(args);
      };
      w.ChannelIO = ch;
      function l() {
        if (w.ChannelIOInitialized) {
          return;
        }
        w.ChannelIOInitialized = true;
        var s = document.createElement('script');
        s.type = 'text/javascript';
        s.async = true;
        s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
        s.charset = 'UTF-8';
        var x = document.getElementsByTagName('script')[0];
        x.parentNode.insertBefore(s, x);
      }
      if (document.readyState === 'complete') {
        l();
      } else if (window.attachEvent) {
        window.attachEvent('onload', l);
      } else {
        window.addEventListener('DOMContentLoaded', l, false);
        window.addEventListener('load', l, false);
      }
    })();
  </script>
  <!-- End Channel Plugin --> 
  </div>
  
  <script src="../js/lib/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script> 
  <script src="../js/lib/jquery.easing.1.3.js"></script>
  <script src="../js/lib/wow.min.js"></script>
  <script src="../js/lib/slick.min.js"></script>
  <script src="../js/lib/jquery.mCustomScrollbar.min.js"></script>
  <script src="../js/lib/modernizr.custom.js"></script>
  <script src="../js/lib/placeholders.min.js"></script>
  <script src="../js/lib/jquery.magnific-popup.js"></script>	
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="../js/common.js?ver=2019-04-25"></script>

  </body>
  </html>