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
	<title>PetMee</title> 
	<script type="text/javascript" async="" src="https://cdn.channel.io/plugin/ch-plugin-web.js" charset="UTF-8"></script>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
</head>

<body cz-shortcut-listen="true">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.12/jquery.mousewheel.min.js"></script>
	<script type="text/javascript" defer="" async="" src="http://asp8.http.or.kr/HTTP_MSN/UsrConfig/minipet/js/ASP_Conf.js?s=r785516221749.2198"></script>
	<script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/720540785/?random=1576642036171&amp;cv=9&amp;fst=1576642036171&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=2oac61&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=http%3A%2F%2Fminipetmall.co.kr%2Fpc%2Fmember%2Ffind.html&amp;ref=http%3A%2F%2Fminipetmall.co.kr%2Fpc%2Fmain%2Fmain.html&amp;tiba=(%EC%A3%BC)%EB%AF%B8%EB%8B%88%ED%8E%AB%20%EA%B3%B5%EC%8B%9D%EC%82%AC%EC%9D%B4%ED%8A%B8%20-%20%EA%B0%95%EC%95%84%EC%A7%80%EB%B6%84%EC%96%91%20%EA%B3%A0%EC%96%91%EC%9D%B4%EB%B6%84%EC%96%91&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>
	<img id="LtImgS" src="http://asp8.http.or.kr/[sr].gif?r=r1576642036192612693884&amp;cdkey=minipet&amp;surl=http%3A%2F%2Fminipetmall.co.kr%2Fpc%2Fmember%2Ffind.html" style="width: 1px; height: 1px; display: none; position: absolute;"><script type="text/javascript" defer="" id="_Http_LoadODefer" src="http://asp8.http.or.kr/emd_pt.js"></script>
	<script type="text/javascript" id="_Http_loadSvcF" charset="UTF-8" src="http://asp8.http.or.kr/HTTP_MSN/Messenger/HTTP_s.js"></script>
	<script defer="" async="" type="text/javascript" id="_Http_LTgetLSjs" src="http://cnf.http.or.kr/se/sst.php?v=_H&amp;k=minipet&amp;s=E78B5A97271C4AFAA7EE72B7ACB2610F"></script>
	<img alt="log" src="http://asp8.http.or.kr/det/datnie.php?cdkey=minipet&amp;idx=af3309c3217cc98c&amp;ssr=33f072a0fd8af41921600e8b730bb881&amp;dat=aW50ZXJuYWwtbmFjbC1wbHVnaW4yQGludGVybmFsLXBkZi12aWV3ZXIxQG1oamZibWRnY2ZqYmJwYWVvam9mb2hvZWZnaWVoamFpMUBAV2luMzJAa28tS1JAQDgyNEAxNTM2QDg2NEAxNTM2" style="width: 1px; height: 1px; display: none;">
	<script defer="" async="" type="text/javascript" id="_Http_session_Header" src="http://asp8.http.or.kr/HTTP_MSN/Messenger/log_run.php?tmpUss=qf240c8ar0tpo1ihmh0ha13sr5&amp;PHPSESSID=qf240c8ar0tpo1ihmh0ha13sr5&amp;r=1576642036623&amp;HTTP_SERVER_ADDR=http%3A%2F%2Fasp8.http.or.kr&amp;h_domain=minipetmall.co.kr&amp;firstConnection=false&amp;history_length=2&amp;HTTP_MSN_AUTH_CDKEY=minipet&amp;HTTP_MSN_MEMBER_NAME=&amp;LOGSID=&amp;Check_WH=1536%20X%20864&amp;Check_Color=24&amp;Check_java=N&amp;Check_cookie=true&amp;ChatYN=true&amp;random=null&amp;sn=106.240.16.167%2F0%2F0%2F35%2F0%2Fuemrur4s5qjo5aedktnb8t9uf0-201910240813198%2F0%2F0%2F0%2F0%2F0%2F0%2F0%2F0%2F0%2F0%2F2019-12-18%2012%3A47%3A19%2F0%2F0%2F0%2F0%2F0%2F0%2F0%2F0%2F0%2F0%2F0%2F0%2F0%2F0%2FNO%2FNO%2FN%2F2019-10-24%2018%3A08%3A51%2F0&amp;Aurl=&amp;reffer_id=http%3A%2F%2Fminipetmall.co.kr%2Fpc%2Fmain%2Fmain.html&amp;url=http%3A%2F%2Fminipetmall.co.kr%2Fpc%2Fmember%2Ffind.html&amp;son=Y&amp;con=Y&amp;non=Y&amp;lon=Y&amp;_Hclpt_Data=126,385,890,385,1528,722,15322,%2Fpc%2Fmain%2Fmain.html,,http:,minipetmall.co.kr&amp;UAG=&amp;UPR=&amp;UPO=2&amp;SLv=0&amp;FLv=-1&amp;ssr=33f072a0fd8af41921600e8b730bb881&amp;idx=af3309c3217cc98c&amp;gsz=824_1536_864_1536&amp;fsz=0"></script>
	<script defer="" async="" type="text/javascript" id="_Http_LoadChatM" src="http://asp8.http.or.kr/HTTP_MSN/Messenger/HTTP_s1_v4.js?r=1576642036697"></script>
	<!-- <style type="text/css">
		#HTTP_MSN_chat_layer *{
			padding:0;
			margin:0; 
			border:0; 
			color:#000; 
			line-height:120%; 
			font-family:Dotum, Gulim, Verdana, sans-serif; 
			font-size:12px; 
			font-weight:normal; 
			font-style:normal;
		}
		#HTTP_MSN_chat_layer img{
			border:0px; 
			margin:0px; 
			display:inline; 
			vertical-align:top;
		}
		#HTTP_MSN_chat_layer ul{
			list-style-type:none;
		}
		#HTTP_MSN_chat_layer li{
			list-style-type:none;
		}
		#HTTP_MSN_chat_layer a{
			text-decoration:none;
		}
		#HTTP_MSN_chat_layer table{
			border-collapse:inherit;
		}
	</style> -->

	<div class="mfp-bg mfp-ready"></div>
	<div id="aa" class="mfp-wrap mfp-close-btn-in mfp-auto-cursor mfp-ready" tabindex="-1" style="overflow: hidden auto;">
		<div class="mfp-container mfp-ajax-holder mfp-s-ready">
			<div class="mfp-content">
				<div class="pop-con pop-con-modal">
				  <div class="modal-dialog" style="position: fixed; top: 112px;">
				    <button title="Close (Esc)" onclick="closePopup();" class="mfp-close"><i class="xi-close-thin"></i></button>
				    <div class="pop-box">
				      <div class="pop-head _b2">이메일 안내</div>
				      <p class="f_18 _b2">회원님의 이메일</p>
				      <p class="_mc f_24 memberId"></p>
				      <div class="con-margin-01">
				        <!-- <a href="#" onclick="$.magnificPopup.close();" class="btn">확인</a> -->
				        <a href="javascript:;" class="btn">가입일 : 2019-10-25</a>
				      </div>      
				    </div>
				  </div>
				</div>
			</div>
			<div class="mfp-preloader">Loading...</div>
		</div>
	</div>
</body>
<script>
function closePopup(){
	$(".mfp-bg, .mfp-wrap").hide();
}
</script>
</html>