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
    <link href="<c:url value='/resources/css/css.css' />" rel="stylesheet">
    <link href="<c:url value='/resources/css/login.css' />" rel="stylesheet">
    <script src="<c:url value='/js/common/jquery-1.11.1.min.js' />"></script>
    <title>(주)펫미</title>
</head>
<script type="text/javascript">
    $(document).ready(function(){
       $("#header").load("menu.html")    
    });
    $(document).ready(function(){
       $("#footer").load("footer.html")    
    });
</script>  
<body>
    <div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
		
	<div id="contents" class="main-contents">
		<section>
			<img src="<c:url value='/resources/images/menu/section_img.jpg' />">
			<img src="<c:url value='/resources/images/menu/section_img.jpg' />">
			<img src="<c:url value='/resources/images/menu/section_img.jpg' />">
		</section>
    </div>
    
    <!-- footer 시작 -->
	<div id="footer" class="footer_wrap clearfix">
		<c:import url='/WEB-INF/jsp/common/footer.jsp'></c:import>
	</div>
	<script src="<c:url value='/js/jquery.magnific-popup.js' />"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>