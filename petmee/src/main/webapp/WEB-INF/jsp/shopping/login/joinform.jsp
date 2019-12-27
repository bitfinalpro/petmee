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
	<%-- <script src="<c:url value='/resources/js/shopping/login/lib/jquery-3.4.1.js' />"></script> --%>
	<script src="<c:url value='/resources/js/common/menu.min.js' />"> </script>
	
	<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<title>PetMee </title>
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
	        rf.setData("email", "minipet");
	        rf.setSSL(true);
	        rf.sendRf();
	    }
	//-->
	</script>
	<script src="https://cdn.megadata.co.kr/js/en_script/3.5/enliple_min3.5.js" defer="defer" onload="mobRf()"></script>
	<!-- Enliple Common Tracker v3.5 [공용] end -->
	<script type="text/javascript">
	    function mobRf(){
	        var rf = new EN();
	        rf.setData("user_email", "petmee");
	        rf.setSSL(true);
	        rf.sendRf();
	    }
	</script>
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
	<script type="text/javascript" src="<c:url value='/resources/js/shopping/login/jquery-1.11.1.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/shopping/login/space_check.js' />"></script>
	<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#button_joinus").click(function(){
			    if($.trim($("#input_user_email").val())==''){
			      alert("이메일을 입력해주세요.");
			      return false;
			    } 
			    if($.trim($("#input_user_name").val())==''){
			      alert("이름을 입력해주세요.");
			      return false;
			    } 
			    if($.trim($("#input_user_pass").val())==''){
			      alert("비밀번호를 입력해주세요.");
			      return false;
			    } 
			    if($.trim($("#input_user_pass2").val())==''){
			      alert("비밀번호 확인을 입력해주세요.");
			      return false;
			    } 
			    if($.trim($("#input_resident").val())==''){
			      alert("주민번호 입력해주세요.");
			      return false;
			    } 
			   /*  if($.trim($("#gender").val())==''){
			      alert("성별을 선택해주세요.");
			      return false;
			    }  */
			    if($.trim($("#input_mobile_1").val())==''){
			      alert("핸드폰번호를 입력해주세요.");
			      return false;
			    } 
			    
			    $("#theForm").submit();
			  });
		});		
	</script>
	<script type="text/javascript" language="JavaScript">
		window.history.forward(1);
		$(document).ready(function(){
			
			function checkData(data) {
				if(data == 0) {
					return email_check = "OK";
				}
			}
			$("#email_check").click(function() {		
				let check1 = document.querySelector("#input_user_email");
				if(isFieldBlank(check1) || isFieldSpace(check1)) {
					alert("공백 문자없이 이메일을 입력해주세요.");
					check1.focus();
					return(false);
				}
				/* if (theForm.email_check_ok.value=="0") { 
					alert("이메일 중복여부를 체크 해주세요.");	 		
					return(false);
				} */
				console.log($("#input_user_email").val())	    
				
				$.ajax({ 
					url : 'join04.do',
					type: "POST",
					async: false, // 비동기식 앞에꺼말고 뒤에꺼 처리할때 기다려라
			    	data : {user:$("#input_user_email").val()},
			    	dataType:"text",
		            cache: false,
			    	success:function(data) {		
			    		console.log(data);
			    		checkData(data);
					}
				});
				if (email_check=="OK"){
					$("#email_check_ok").val("1");
					$("#input_user_email").attr("readonly",true);
					$("#email_check").prop("disabled",true);								
					alert("사용 가능한 이메일 입니다.");
				}	
				
				else {
					alert("이미 사용중인 이메일 입니다.");
					check1.focus(); 
				}
				return(false);
			});
			
			<!-- 이메일 유효성 검사 -->
			$("#input_user_email").on("blur", (e) => {
				let onemail = $("#input_user_email").val();
				if(onemail === ""){
					$("#check_email").html("｜ 이메일을 공백문자 없이 입력해주세요.");
					return;
				}
				else if(onemail.indexOf("@",".com") === -1){
					$("#check_email").html("｜ 유효한 형식이 아닙니다. : 예)petmee@domain.com");
					return;
				}else{
					$("#check_email").html("｜ 사용가능한 메일입니다.");
				}
			});
			
			<!-- 이름 유효성 검사 -->
			$("#input_user_name").on("blur", (e) =>{
				let hName= /^[가-힣a-zA-Z]+$/;
				let onName = $("#input_user_name").val();
				if(onName === ""){
					$("#check_name").html("｜ 이름을 공백문자 없이 입력해주세요.");
					return;
				}
				else if(!hName.test(onName)){
					$("#check_name").html("｜ 이름을 한글이나 영문으로만 입력해주세요");
					return;
				}else{
					$("#check_name").html("｜ 사용가능한 이름입니다.");
				}
			});
			
			<!-- 패스워드 유효성 검사 -->
			$("#input_user_pass").on("blur", (e) => {
				let onPass = $("#input_user_pass").val();
				let num = onPass.search(/[0-9]/g);
				let eng = onPass.search(/[a-z]/ig);
				let spe = onPass.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);
				if(onPass === ""){
					$("#check_pass").html("｜ 패스워드를 공백문자 없이 입력해주세요.");
					return;
				}
				else if(onPass.length < 8 || onPass.length > 20){
					$("#check_pass").html("｜ 6~20자리 이내로 입력해 주세요.");
					return;
				}
				else if(num < 0 || eng < 0 || spe < 0){
					$("#check_pass").html("｜ 영문,숫자,특수문자를 혼합하여 입력해주세요.");
					return;
				} else{
					$("#check_pass").html("｜ 사용가능한 패스워드입니다.");
					return true;
				}
			});
			$("#input_user_pass2").on("blur", (e) => {
				let onPass = $("#input_user_pass").val();
				let onPass2 = $("#input_user_pass2").val();
				// 비밀번호 확인
				if(onPass !== onPass2){
					$("#check_pass2").html("｜ 비밀번호를 확인하세요.(영문,숫자를 혼합하여 6~20자 이내)");
					 $('#input_user_pass1').val('');
					 $('#input_user_pass1').focus(); 
					 	return false;
					 }
				else{
					$("#check_pass2").html("｜ 비밀번호가 일치합니다.");
					return true;
				}
			});
				
				
				<!-- 주민번호 유효성 검사 -->
				$("#input_resident").on("blur", (e) =>{
					let hNum = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					let onName = $("#input_resident").val();
					if(onName === ""){
						$("#check_resident").html("｜ 주민등록번호를 공백문자 없이 입력해주세요.");
						return;
					}
					else if(hNum.length < 13){
						$("#check_resident").html("｜ 숫자 13자리로만 입력해주세요");
						return ;
					}else{
						$("#check_resident").html("｜ 사용가능합니다.");
					}
				});	
				
				<!-- 폰번호 유효성 검사 -->
				$("#input_mobile_1").on("blur", (e) => {
					let regPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
					let onName = $("#mobile_1").val();
					if(onName === ""){
						$("#check_phone").html("｜ 공백문자 없이 입력해주세요.");
						return false;
					}
					else if(!regPhone.test(onName) !== 12){
						$("#check_phone").html("｜ 숫자 12자리로만 입력해주세요. : -빼고 입력해주세요");
						return false;
					}else {
						$("#check_phone").html("｜ 사용가능합니다.");
					}
				});	
		});

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
	<div class="sub-visual">
	<div class="wrap">
		<div class="sub-visual-title wowrap">
			<h2 class="wow fadeInUp tit" data-wow-delay="0s" style="visibility: visible; animation-delay: 0s; animation-name: fadeInUp;">회원가입</h2>
			<p class="wow fadeInUp txt" data-wow-delay="0.25s" style="visibility: visible; animation-delay: 0.25s; animation-name: fadeInUp;">삶의 소중한 인연, 미니펫이 만남부터 동행하겠습니다.</p>
		</div>		
	</div>
	<!-- <div class="sub-visual-bg" style="background-image:url(../images/sub/member.jpg)"></div> -->
	</div>
	<!-- 컨텐츠 시작 -->      
	<div class="sub-con sub-pad join_page _step2">
        <div class="sub-title">
          <p class="desc">회원가입</p>
          <p class="title_bold">CREATE YOUT ACCOUNT</p>
        </div>

	<div class="wrapper">
	<div class="join_step">회원정보 입력</div>
	  <p class="tit_36">회원정보 입력
	  	<span class="label"><em>(필수)</em> 입력사항을 꼭 써주시기 바랍니다.</span>
	  </p>  
	
	  <form action="<c:url value="/shopping/login/join02.do" />" method="post" name="theForm" id="theForm" autocomplete="off" >
	  <div class="join_form">
	    <ul class="row">
	      
		  <!-- 이메일 -->
	      <li class="col-lg-6">
	        <div class="inputbox _btn">
	        <input type="email" name="email" id="input_user_email" class="user_email" placeholder="이메일"/>
		        <!-- <div class="check_font" id="check_email" style="font-color:#909090;"></div> -->
	          <label for="email_check">이메일<em>(필수)</em>
	          	<div class="check_font" id="check_email" style="position: absolute; min-width: 400px; float: left; width: 200px; top: 0px; left: 90px;"></div>
	          <!-- <label style="position: relative; left: 10px; font-weight: 400;">: 예)petmee@domain.com</label> -->
	          </label>
	          <a href="javascript:;void(0);" id="email_check" class="btn">중복체크</a>
	        </div>
	      </li>
	      
	      <!-- 이름 -->
	      <li class="col-lg-6">
	        <div class="inputbox _btn">
	        <input type="text" name="name" id="input_user_name" class="user_email" maxlength="20" placeholder="이름">
	          <div class="check_font" id="name_check"></div>
	          <label>이름<em>(필수)</em>
	          	<div class="check_font" id="check_name" style="position: absolute; min-width: 400px; float: left; width: 200px; top: 0px; left: 90px;"></div>
	          </label>
	        </div>
	      </li>
	      
	      <!-- 패스워드 -->
	      <li class="col-lg-6">
	        <div class="inputbox">
	        <input type="password" name="pass" id="input_user_pass" maxlength="50" placeholder="비밀번호">
	          <label>비밀번호<em>(필수)</em>
	          <div class="check_font" id="check_pass" style="position: absolute; min-width: 400px; float: left; width: 200px; top: 0px; left: 90px;"></div>
	          	<!-- <label style="position:relative; left: 10px; font-weight: 400;">: 4~12자리의 영문 대소문자와 숫자로만 입력</label> -->
	          </label>
	        </div>
	      </li>
	      
	      <!-- 패스워드확인 -->
	      <li class="col-lg-6">
	        <div class="inputbox">
	        <input type="password" name="pass2" id="input_user_pass2" maxlength="50" placeholder="비밀번호 확인">
	          <label>비밀번호 확인<em>(필수)</em>
	          	<div class="check_font" id="check_pass2" style="position: absolute; min-width: 400px; float: left; width: 200px; top: 0px; left: 130px;"></div>
	          	<!-- <label style="position:relative; left: 10px; font-weight: 400;">: 4~12자리의 영문 대소문자와 숫자로만 입력</label> -->
	          </label>
	        </div>
	      </li>
	      
	      <!-- 주민번호 -->
	      <li class="col-lg-6">
	        <div class="inputbox">
	        <ul class="num" id="resident">
	           <li><input type="text" name="resident" id="input_resident" maxlength="13" placeholder="주민번호"></li>
	           <!-- <li><input type="password" name="resident2" id="input_mobile_2" maxlength="7"></li> -->
	          </ul>
	          <label>주민번호<em>(필수)</em>
	          	<div class="check_font" id="check_resident" style="position: absolute; min-width: 400px; float: left; width: 200px; top: 0px; left: 130px;"></div>
	          	<!-- <label style="position:relative; left: 10px; font-weight: 400;">: 숫자 13로 입력해주세용</label> -->
	          </label>
	        </div>
	      </li>
	      
	      <!-- 성별 -->
	      <li class="col-lg-6">
	        <div class="inputbox" >
	        <!-- <input type="text" name="gender" id="nickname" placeholder="성별"> -->
		        <div class="chk_area mt_22" style="border-bottom: 1px solid #d8d8d8; ">
					<input type="radio" name="gender" id="check_1_yes" value="남자">
					<label for="check_1_yes">남자</label>
		            <input type="radio" name="gender" id="check_1_no" value="여자">
		            <label for="check_1_no">여자</label>
		        </div>
	          <label>성별<em>(필수)</em></label>
	        </div>
	      </li>
	      
	      <!-- 주소 -->
	      <li class="col-lg-6" style="margin: 1px;">
	        <div class="inputbox">
	          <div class="row_5">
	            <div class="col-lg-3">
	            	<input type="text" name="zipcode" id="zipcode" maxlength="5" readonly="readonly" onclick="DaumPostcode();">
	            </div>
	            <div class="col-lg-3" style="margin-top:-10px;">
	            	<a href="javascript:;void(0);" class="btn" onclick="DaumPostcode();">우편번호</a></div>
	            <div class="col-lg-6">
	            	<input type="text" name="address" id="address1" readonly="readonly" maxlength="100" onclick="DaumPostcode();" placeholder="주소">
	            </div>
	          </div>
	          <label>주소<em>(필수)</em></label>
	        </div>
	      </li>
	      
	      <!-- 상세주소 -->
	      <li class="col-lg-6" style="margin:-1px;">
	        <div class="inputbox">
	          <input type="text" name="addressDetail" id="address2" maxlength="100" placeholder="상세주소">
	          <label>상세주소</label>
	        </div>
	      </li>
	      
	      <!-- 핸드폰 번호 -->
	      <li class="col-lg-6" >
	        <div class="inputbox">
	       	<!-- <ul class="num" id="phone">
	           <li><input type="text" name="phone" id="mobile_1" maxlength="12"></li>
	           <li><input type="text" name="phone" id="mobile_2" maxlength="4"></li>
	           <li><input type="text" name="phone" id="mobile_3" maxlength="4"></li>
	        </ul> -->
	          <input type="text" name="phone" id="input_mobile_1" maxlength="12">
	          <label>핸드폰<em>(필수)</em>
	          	<div class="check_font" id="check_phone" style="position: absolute; min-width: 400px; float: left; width: 200px; top: 0px; left: 130px;"></div>
	          </label>
	        </div>
	      </li>
	      
	      <!-- 전화번호 -->
	      <li class="col-lg-6" >
	        <div class="inputbox">            
	          <!-- <ul class="num">
	            <li><input type="text" name="tel_1" id="tel_1" maxlength="4"></li>
	            <li><input type="text" name="tel_2" id="tel_2" maxlength="4"></li>
	            <li><input type="text" name="tel_3" id="tel_3" maxlength="4"></li>
	          </ul> -->
	         <!-- <input type="text" placeholder="전화번호"> -->
	         <input type="text" name="homePhone" id="input_mobile_1" maxlength="12">
	          <label>전화번호</label>
	        </div>
	      </li>
	    </ul>
	  </div>
	  
	  <div class="con-margin-02 text_center posi_r">
	    <!-- <input type="button" value="회원가입" class="btn-type-02" onclick="return sendcheck();">
	    <a href="../member/join_02.html" class="btn-type-02">회원가입</a>  -->
	    <!-- <input type="button" class="btn-type-02" value="회원가입" /> -->
	    <input type="submit" class="btn-type-02" id="button_joinus" value="회원가입" />
	  </div>
	</form>
	</div>
	</div>
	<!-- c -->
	<!-- footer -->
	<div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> 
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
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script> 
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>

