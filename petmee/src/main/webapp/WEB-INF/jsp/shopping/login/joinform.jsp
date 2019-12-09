<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko" class=" js no-touch">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">  
	<meta name="viewport" content="width=1200, maximum-scale=1.5, user-scalable=yes">
	<meta name="format-detection" content="telephone=no, address=no, email=no"> 
	<%@ include file="/WEB-INF/jsp/include/login/joincss.jsp" %>
	<link href="<c:url value='/resources/js/shopping/login/jquery-1.11.1.min.js' />" rel="stylesheet">
	<link href="<c:url value='/resources/js/shopping/login/ch-plugin-web.js' />" rel="stylesheet">
	<%-- <link href="<c:url value='/resources/js/shopping/login/validate.js' />" rel="stylesheet"> --%>
	<script type="text/javascript" async="" src="https://cdn.channel.io/plugin/ch-plugin-web.js" charset="UTF-8"></script>
	<title>(주)펫미 </title>
</head>

<body cz-shortcut-listen="true">
	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
	
	<img src="http://asp8.http.or.kr/sr.gif?d=r11405762786439.953" style="width:1px;height:1px;position:absolute;display:none" onload="logCorpAnalysis_full.ch()" alt="">
	<noscript>
	<img src="http://asp8.http.or.kr/HTTP_MSN/Messenger/Noscript.php?key=minipet" style="display:none;width:0;height:0;" alt="" />
	</noscript>
	<!-- LOG corp Web Analitics & Live Chat END -->
	<img src="http://asp8.http.or.kr/sr.gif?d=r11405762786439.953" style="width:1px; height:1px; position:absolute;display:none" onload="logCorpAnalysis_full.ch()" alt="">
	<noscript>
	<img src="http://asp8.http.or.kr/HTTP_MSN/Messenger/Noscript.php?key=minipet" style="display:none;width:0;height:0;" alt="" />
	</noscript>
	<!-- LOG corp Web Analitics & Live Chat END -->
	
	<!-- 2019-02-26 banghg -->
	<script src="http://pop.site3.co.kr/retg.php?c=1808"></script>
	
	<script src="http://pop.site3.co.kr/retg.php?c=1315"></script>
	
	<script src="http://pop.site3.co.kr/retg.php?c=1296"></script>
	
	<!-- 2019-07-12 cafe24스마트 -->
	<!-- Enliple Common Tracker v3.5 [공용] start -->
	<script type="text/javascript">
	//<!--
	    function mobRf(){
	        var rf = new EN();
	        rf.setData("userid", "minipet");
	        rf.setSSL(true);
	        rf.sendRf();
	    }
	//-->
	</script>
	<script src="https://cdn.megadata.co.kr/js/en_script/3.5/enliple_min3.5.js" defer="defer" onload="mobRf()"></script>
	<!-- Enliple Common Tracker v3.5 [공용] end -->
	
	<!-- Enliple Shop Log Tracker v3.5 start -->
	<script type="text/javascript">
	//<!--
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
	//} 
	//-->
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
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/191007/1570443254160/191007.js"></script>
	<script type="text/javascript" src="../resources/js/shopping/login/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="../resources/js/shopping/login/space_check.js"></script>
	<script type="text/javascript" language="JavaScript">
	//<!--
		window.history.forward(1);
		
		$(document).ready(function(){
			$("#id_check").click(function() {								
				var idReg =/^[A-Za-z0-9]{4,20}$/g;								
				if(isFieldBlank(theForm.user_id)||isFieldSpace(theForm.user_id)) {
					alert("공백 문자없이 아이디 항목을 입력해주세요.");
					theForm.user_id.focus();
					return(false);
				}
										    		    
				if (!idReg.test(theForm.user_id.value)) {
		        	alert("아이디는 영문 또는 숫자 4~20자로 입력해주세요.");
		        	theForm.user_id.focus();
		        	return(false);
		    	}	
		
				$.ajax({ 
					url : 'id_check.php', 
			    	type : "post", 
			    	dataType:"JSON",
			    	async: false,		    
			    	data : {user_id:$("#user_id").val()}, 	    	
			    	contentType: "application/x-www-form-urlencoded; charset=utf-8",
			    	success:function(data) {			    				  				    				    		    				    				    				data_check = data;	
					}
				});
				if (data_check=="OK") {								
					$("#id_check_ok").val("1");
					$("#user_id").attr("readonly",true);
					$("#id_check").prop("disabled",true);								
					alert("사용 가능한 아이디 입니다.");
				}			
				else {
					alert("이미 사용중인 아이디 입니다.");
					theForm.user_id.focus(); 
				}
				return(false);
			});		
			
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
					alert("이미 사용중인 닉네임 입니다.");
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
			    	success:function(data) {			    				  				    				    		    				    				    				data_check = data;	
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
			
			var idReg =/^[A-Za-z0-9]{4,20}$/g;			
			var pwReg =/^[A-Za-z0-9]{4,20}$/g;			
			var numReg=/[0-9]/g;
	        var engReg=/[a-z]/ig;
							
			
			if(isFieldBlank(theForm.user_id)||isFieldSpace(theForm.user_id)) {
				alert("공백 문자없이 아이디 항목을 입력해주세요.");
				theForm.user_id.focus();
				return(false);
			}				
			    		    
			if (!idReg.test(theForm.user_id.value)) {
	        	alert("아이디는 영문 또는 숫자 4~20자로 입력해주세요.");
	        	return(false);
	    	}	
			
			if (theForm.id_check_ok.value=="0") { 
				alert("아이디 중복여부를 체크 해주세요.");	 		
				return(false);
			} 
			
			if(isFieldBlank(theForm.user_name)||isFieldSpace(theForm.user_name)) {
				alert("이름을 공백문자 없이 입력해주세요.");
				theForm.user_name.focus();
				return(false);
			}
			
									        	        							
			if (isFieldBlank(theForm.userpasswd) || isFieldSpace(theForm.userpasswd)) {  	 			 			
				alert("비밀번호 항목이 비었거나 공백문자를 사용하셨습니다.");
			 	theForm.userpasswd.focus();
			 	return(false);
			} 
								
			if (isFieldBlank(theForm.userpasswd2) || isFieldSpace(theForm.userpasswd2)) {  	 			 			
				alert("비밀번호 확인 항목이 비었거나 공백문자를 사용하셨습니다.");
			 	theForm.userpasswd2.focus();
			 	return(false);
			}
				
			if(theForm.userpasswd.value!=theForm.userpasswd2.value) {	
				alert("비밀번호와 비밀번호 확인이 다르게 입력되었습니다.");
	        	theForm.userpasswd.focus();
	        	return(false);
	        }        	        	        			
			    
			if (!pwReg.test(theForm.userpasswd.value)) {
	        	alert("비밀번호는 영문/숫자 조합4~20자로 입력해주세요.");
	        	return(false);
	    	}	
			
			if(theForm.userpasswd.value.search(numReg) < 0 || theForm.userpasswd.value.toLowerCase().search(engReg) < 0) {
				alert("비밀번호에 영문 또는 숫자만 있습니다.\n\n영문과 숫자를 혼용하여 4~20자로 입력해주세요.");
	        	return(false);
			}
					
			if(isFieldBlank(theForm.nickname)||isFieldSpace(theForm.nickname)) {
				alert("닉네임을 공백문자 없이 입력해주세요.");
				theForm.nickname.focus();
				return(false);
			}				
			
			if (theForm.nickname_check_ok.value=="0") { 
				alert("닉네임 중복여부를 체크 해주세요.");	 		
				return(false);
			} 
			
				
			if (isFieldBlank(theForm.user_email))	{
				alert("이메일 항목이 비어있습니다.");
				theForm.user_email.focus(); 
				return(false);
			}
			
			if (theForm.email_check_ok.value=="0") { 
				alert("이메일 중복여부를 체크 해주세요.");	 		
				return(false);
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
					
					
			theForm.submit();			  								
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
	// -->
	</script>

<!--// 2019-02-27 banghg 메뉴추가 -->      
<div class="sub-con sub-pad join_page _step2">
        <div class="sub-title">
          <p class="desc">회원가입</p>
          <p class="title_bold">CREATE YOUT ACCOUNT</p>
        </div>

<div class="wrapper">
  <div class="join_step">회원정보 입력</div>
  <p class="tit_36">회원정보 입력<span class="label"><em>(필수)</em> 입력사항을 꼭 써주시기 바랍니다.</span></p>  

  <form action="<c:url value="/shopping/login/join02.do" />" method="post" name="theForm" id="theForm" autocomplete="off">
  <input type="hidden" name="id_check_ok" id="id_check_ok" value="0"> 
  <input type="hidden" name="nickname_check_ok" id="nickname_check_ok" value="0"> 
  <input type="hidden" name="email_check_ok" id="email_check_ok" value="0"> 
  <div class="join_form">
    <ul class="row">
 <!--      <li class="col-lg-6">
        <div class="inputbox _btn">
			<input type="text" name="user_id" id="user_id" maxlength="20" placeholder="아이디">
			<label>아이디<em>(필수)</em></label>
			<a href="javascript:;void(0);" id="id_check" class="btn">중복체크</a>
        </div>
      </li> -->
      
	  <!-- 이메일 -->
      <li class="col-lg-6">
        <div class="inputbox _btn">
        <input type="text" name="email" id="user_email" placeholder="이메일">
          <label>이메일<em>(필수)</em></label>            
          <a href="javascript:;void(0);" id="email_check" class="btn">중복체크</a>
        </div>
      </li>
      
      <!-- 이름 -->
      <li class="col-lg-6">
        <div class="inputbox">
        <input type="text" name="name" id="user_name" maxlength="20" placeholder="이름">
          <label>이름<em>(필수)</em></label>
        </div>
      </li>
      
      <!-- 패스워드 -->
      <li class="col-lg-6">
        <div class="inputbox">
        <input type="password" name="pass" maxlength="50" placeholder="비밀번호">
          <label>비밀번호<em>(필수)</em></label>
          <!-- 
          <p class="valid">
            <i class="xi-check" title="비밀번호 일치"></i>
            <i class="xi-close" title="비밀번호 불일치"></i>
          </p> -->
        </div>
      </li>
      
      <!-- 패스워드확인 -->
      <li class="col-lg-6">
        <div class="inputbox">
        <input type="password" name="pass2" maxlength="50" placeholder="비밀번호 확인">
          <label>비밀번호 확인<em>(필수)</em></label>
          <p class="valid">
            <i class="xi-check" title="비밀번호 일치"></i>
            <i class="xi-close" title="비밀번호 불일치"></i>
          </p>
        </div>
      </li>
      
      <!-- 주민번호 -->
      <li class="col-lg-6">
        <div class="inputbox">
        <ul class="num">
            <li><input type="text" name="phone" id="mobile_1" maxlength="6"></li>
            <li><input type="text" name="phone" id="mobile_2" maxlength="7"></li>
          </ul>
          <label>주민번호<em>(필수)</em></label>
        </div>
      </li>
      
      <!-- 성별 -->
      <li class="col-lg-6">
        <div class="inputbox" >
        <!-- <input type="text" name="gender" id="nickname" placeholder="성별"> -->
	        <div class="chk_area mt_20" style="border-bottom: 1px solid #d8d8d8; ">
				<input type="radio" name="check_1" id="check_1_yes" value="ok">
				<label for="check_1_yes">남자</label>
	            <input type="radio" name="check_1" id="check_1_no" value="no">
	            <label for="check_1_no">여자</label>
	        </div>
          <label>성별<em>(필수)</em></label>
        </div>
      </li>
   
      <!-- 닉네임 -->
      <!-- <li class="col-lg-6">
        <div class="inputbox _btn">
        <input type="text" name="nickname" id="nickname" placeholder="닉네임">
          <label>닉네임<em>(필수)</em></label>            
          <a href="javascript:;void(0);" id="nickname_check" class="btn">중복체크</a>
        </div>
      </li> -->
      
      <!-- 핸드폰 번호 -->
      <li class="col-lg-6" style="margin: 1px;">
        <div class="inputbox">
          <ul class="num">
            <li><input type="text" name="phone" id="mobile_1" maxlength="12"></li>
            <li><input type="text" name="phone" id="mobile_2" maxlength="4"></li>
            <li><input type="text" name="phone" id="mobile_3" maxlength="4"></li>
          </ul>
          <!-- <input type="text" placeholder="핸드폰"> -->
          <label for="">핸드폰<em>(필수)</em></label>
        </div>
      </li>
      
      <!-- 나이 -->
      <!-- <li class="col-lg-6" style="margin: -1px;">
        <div class="inputbox">            
          <ul class="num">
            <li><input type="text" name="tel_1" id="tel_1" maxlength="4"></li>
            <li><input type="text" name="tel_2" id="tel_2" maxlength="4"></li>
            <li><input type="text" name="tel_3" id="tel_3" maxlength="4"></li>
          </ul>
          <label for="">나이</label>
        </div>
      </li> -->
      
      <!-- 전화번호 -->
      <li class="col-lg-6" style="margin:-1px;">
        <div class="inputbox">            
          <ul class="num">
            <li><input type="text" name="tel_1" id="tel_1" maxlength="4"></li>
            <li><input type="text" name="tel_2" id="tel_2" maxlength="4"></li>
            <li><input type="text" name="tel_3" id="tel_3" maxlength="4"></li>
          </ul>
         <!-- <input type="text" placeholder="전화번호"> -->
          <label for="">전화번호</label>
        </div>
      </li>
      
      <!-- 주소 -->
      <li class="col-lg-6">
        <div class="inputbox">
          <div class="row_5">
            <div class="col-lg-3">
            	<input type="text" name="zipcode" id="zipcode" maxlength="5" readonly="readonly" onclick="DaumPostcode();">
            </div>
            <div class="col-lg-3">
            	<a href="javascript:;void(0);" class="btn" onclick="DaumPostcode();">우편번호</a></div>
            <div class="col-lg-6">
            	<input type="text" name="address" id="address1" readonly="readonly" maxlength="100" onclick="DaumPostcode();" placeholder="주소">
            </div>
          </div>
          <label>주소<em>(필수)</em></label>
        </div>
      </li>
      
      <!-- 상세주소 -->
      <li class="col-lg-6">
        <div class="inputbox">
          <input type="text" name="address" id="address2" maxlength="100" placeholder="상세주소">
          <label>상세주소</label>
        </div>
      </li>
      
      
      <!-- <li class="col-lg-6">
        <div class="inputbox"><input type="text" name="pet_species" placeholder="견종/묘종" maxlength="100">
          <label for="">견종/묘종</label>
        </div>
      </li>
      <li class="col-lg-6">
        <div class="inputbox"><input type="text" name="pet_name" placeholder="반려동물 이름" maxlength="100">
          <label for="">반려동물 이름</label>
        </div>
      </li>
      <li class="col-lg-6">
        <div class="inputbox"><input type="text" name="parcel_day" placeholder="미니펫에서 분양받으신 날" maxlength="100">
          <label for="">미니펫에서 분양받으신 날</label>
        </div>
      </li>
      <li class="col-lg-6">
        <div class="inputbox"><input type="text" name="memo" placeholder="남기는 말씀" maxlength="100">
          <label>남기는 말씀</label>
        </div>
      </li>
      -->
      
     <!--  <li class="col-lg-12 chk_area mt_20">
        <input type="checkbox" name="email_s" id="email_s" value="y"><label for="email_s">정보메일 수신 동의</label>
        <input type="checkbox" name="mobile_s" id="mobile_s" value="y"><label for="mobile_s">문자서비스 수신 동의</label>
      </li> -->
    </ul>
  </div>
  
  <div class="con-margin-02 text_center posi_r">
    <!-- <input type="button" value="회원가입" class="btn-type-02" onclick="return sendcheck();">
    <a href="../member/join_02.html" class="btn-type-02">회원가입</a>  -->
    <input type="submit" class="btn-type-02" value="회원가입" />
  </div>
  </form>
</div>
</div>
<!-- c -->
<!-- footer -->
<div id="footer" class="footer_wrap clearfix"><c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> </div>


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

