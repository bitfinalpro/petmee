<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
	<script src="<c:url value='/resources/js/common/jquery-3.4.1.js' />"></script>
	<script src="<c:url value='/resources/js/common/menu.min.js' />"> </script>
	<script src="https://code.jquery.com/jquery-latest.js"></script> 
	

	<!-- jQuery 1.7.2+ or Zepto.js 1.0+ -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<title>PetMee</title> 
	<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" async="" src="https://cdn.channel.io/plugin/ch-plugin-web.js" charset="UTF-8"></script>
	
	<!-- 2019-02-18 -->
	<!--  LOG corp Web Analitics & Live Chat  START -->
	<meta name="naver-site-verification" content="a1222a5b75b9f90af76f783375cbf33669c6c454">
	<script type="text/javascript" async="" src="https://www.googleadservices.com/pagead/conversion_async.js"></script><script type="text/javascript">
	//<![CDATA[
	function logCorpAScript_full(){
		HTTP_MSN_MEMBER_NAME="";/*member name*/
		let prtc=(document.location.protocol=="https:")?"https://":"http://";
		let hst=prtc+"asp8.http.or.kr";
		let rnd="r"+(new Date().getTime()*Math.random()*9);
		this.ch=function(){
			if(document.getElementsByTagName("head")[0]){
				logCorpAnalysis_full.dls();}else{window.setTimeout(logCorpAnalysis_full.ch,30)
					}
		}
		this.dls=function(){
			var h=document.getElementsByTagName("head")[0];
			var s=document.createElement("script");s.type="text/jav"+"ascript";try{s.defer=true;}catch(e){};try{s.async=true;}catch(e){};
			if(h){s.src=hst+"/HTTP_MSN/UsrConfig/minipet/js/ASP_Conf.js?s="+rnd;h.appendChild(s);}
		}
		this.init= function(){
			document.write('<img src="'+hst+'/sr.gif?d='+rnd+'" style="width:1px;height:1px;position:absolute;display:none" onload="logCorpAnalysis_full.ch()" alt="" />');
		}
	}
	if(typeof logCorpAnalysis_full=="undefined"){var logCorpAnalysis_full=new logCorpAScript_full();logCorpAnalysis_full.init();}
	//]]>
	</script>
</head>

<body cz-shortcut-listen="true">
	<img src="http://asp8.http.or.kr/sr.gif?d=r10477069110216.45" style="width:1px;height:1px;position:absolute;display:none" onload="logCorpAnalysis_full.ch()" alt="">
	<noscript><img src="http://asp8.http.or.kr/HTTP_MSN/Messenger/Noscript.php?key=minipet" style="display:none;width:0;height:0;" alt="" /></noscript>
	<!-- LOG corp Web Analitics & Live Chat END -->
	
	<!-- 2019-02-26 banghg -->
	<script src="http://pop.site3.co.kr/retg.php?c=1808"></script>
	
	<script src="http://pop.site3.co.kr/retg.php?c=1315"></script>
	
	<script src="http://pop.site3.co.kr/retg.php?c=1296"></script>
	
	<!-- 2019-07-12 cafe24스마트 -->
	<!-- Enliple Common Tracker v3.5 [공용] start -->
	<script type="text/javascript">
	<!--
	    function mobRf(){
	        var rf = new EN();
	        rf.setData("userid", "minipet");
	        rf.setSSL(true);
	        rf.sendRf();
	    }
	//-->
	</script>
	<script src="https://cdn.megadata.co.kr/js/en_script/3.5/enliple_min3.5.js" defer="defer" onload="mobRf()"></script>
	<!-- Global site tag (gtag.js) - Google Ads: 720540785 2019-08-02-->
	<script async="" src="https://www.googletagmanager.com/gtag/js?id=AW-720540785"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'AW-720540785');
	</script>

	<script type="text/javascript" src="<c:url value='/resources/js/shopping/login/jquery-1.11.1.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/shopping/login/space_check.js' />"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		// 이메일 찾기
		$("#find_id").click(function() {
			let check3 = document.querySelector("#suser_name");
			let check4 = document.querySelector("#suser_phone");
			if (isFieldBlank(check3))  {   			 			
	 			alert("이름을 입력해주세요.");
	 			check3.focus();
	 			return(false);
			}
			
			if (isFieldBlank(check4))  {   			 			
	 			alert("핸드폰번호를 입력해주세요.");
	 			check4.focus();
	 			return(false);
			}	
			
			$.ajax({ 
				url : 'checkEmail.do', 
			    type : "post", 
			    async: false,
			    data : {name:$("#suser_name").val(), phone:$("#suser_phone").val()},
			    contentType: "application/x-www-form-urlencoded; charset=utf-8",
			    success:function(data) {
				   	data_check = data;
				},
			});	
			
			if(data_check!="") {	
				$("#suser_name").val('');
				$("#suser_phone").val('');
		 		$(".memberId").html(data_check);
				$(".mfp-bg, .mfp-wrap").show();
			}
			else {
				alert("해당 회원정보를 찾을 수 없습니다.");
			}			
			return(false);
		});	

		// 비밀번호 찾기
		 $("#find_pwd").click(function() {
			let check5 = document.querySelector("#suser_email");
			let check6 = document.querySelector("#suser_name2");
			if (isFieldBlank(check5)) {   			 			
	 			alert("이메일을 입력해주세요.");
	 			check5.focus();
	 			return(false);
			}
			
			if (isFieldBlank(check6)) {   			 			
	 			alert("이름을 입력해주세요.");
	 			check6.focus();
	 			return(false);
			}	
			
			$.ajax({ 
				url : 'checkPass.do', 
			    type : "post", 
			    async: false,		    
			    data : {email:$("#suser_email").val(), name:$("#suser_name2").val()}, 	    	
			    contentType: "application/x-www-form-urlencoded; charset=utf-8",
			    success:function(data) {	
			    	console.log(data);
			    	data_check = data;
				}								
			});				
			if (data_check!="") {					
				$("#suser_email").val('');
				$("#suser_name2").val('');						
				$(".memberpas").html(data_check);
				$(".mdp-bg, .mdp-wrap").show();
			}
			else {
				alert("해당 회원정보를 찾을 수 없습니다.");
			}			
			return(false);
		});	 
	});	
</script>


<div id="contents" class="sub-contents">   
	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
	
    <div class="sub-visual">
	<div class="wrap">
		<div class="sub-visual-title wowrap">
			<h2 class="wow fadeInUp tit" data-wow-delay="0s" style="visibility: visible; animation-delay: 0s; animation-name: fadeInUp;">ID/PW 찾기</h2>
			<p class="wow fadeInUp txt" data-wow-delay="0.25s" style="visibility: visible; animation-delay: 0.25s; animation-name: fadeInUp;">삶의 소중한 인연, 펫미가 만남부터 동행하겠습니다.</p>
		</div>
	</div>
	<!-- <div class="sub-visual-bg" style="background-image:url(../images/sub/member.jpg)"></div> -->
</div>      

<!-- 상단 메인이미지 폰트 -->      
<div class="sub-con sub-pad idpw_find">
	<div class="sub-title">
		<p class="desc">아이디/패스워드 찾기</p>
          <p class="title_bold">ID/PW 찾기</p>
        </div>

<div class="wrapper">
<form method="post" name="searchuserForm" id="searchuserForm" autocomplete="off">
  <div class="row">
    <div class="col-lg-6">
      <div class="login-box">
        <p class="tit_36">이메일 찾기</p>
        <div class="inputbox">
        	<input type="text" name="suser_name" id="suser_name" placeholder="이름"><label>이름</label>
        </div>
        <div class="inputbox">
        	<input type="text" name="suser_phone" id="suser_phone" maxlength="16" placeholder="핸드폰 번호"><label>핸드폰 번호</label>
        </div>      
      <div class="con-margin-01">
      <a href="javascript:;void(0);" class="btn-type-02" id="find_id" onclick="$('#model-pop').modal('show');">이메일 찾기</a></div>
      </div>      
    </div>
    <div class="col-lg-6">
      <div class="login-box">
        <p class="tit_36">비밀번호 찾기</p>
        <div class="inputbox">
        	<input type="text" name="suser_email" id="suser_email" placeholder="가입 이메일 주소"><label>이메일</label>
        </div>
        <div class="inputbox">
        	<input type="text" name="suser_name2" id="suser_name2" placeholder="이름"><label>이름</label>
        </div>     
	      <div class="con-margin-01">
	      	<a href="javascript:;void(0);" class="btn-type-02" id="find_pwd" onclick="$('#model-pop').modal('show');">비밀번호 찾기</a>
	      </div>
      </div>      
    </div>
  </div>
 	<div class="con-margin-02 text_center posi_r animated fadeIn">
    <a onclick="$('#login-pop').modal('show');" href="javascript:;" class="btn-type-02">로그인 하기</a>
  </div>
</form>
</div>
</div>
 <!-- footer -->
<div id="footer">
	<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import> 
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script> 
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<c:import url="/WEB-INF/jsp/shopping/login/find_id.jsp"></c:import>
<c:import url="/WEB-INF/jsp/shopping/login/find_pwd.jsp"></c:import>
</div>
</body>
</html>