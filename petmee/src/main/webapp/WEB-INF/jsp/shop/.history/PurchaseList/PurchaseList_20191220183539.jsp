<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ include file="/WEB-INF/jsp/include/includecss.jsp"%>
    <%@ include file="/WEB-INF/jsp/include/includejs.jsp"%>

    <link rel="stylesheet" href="<c:url value='/resources/css/shopping/shoppingList/shopingList.css'/>">

    <title>(주)펫미</title>

</head>

<body>
    <div id="header">
        <c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
    </div>
    <section>
        <div id="y-container">
            <div id="y-con-head">
                <span id="y-title">구매내역</span>
                <div id="y-title-box">
                    <i class="fas fa-times fa-2x mousepoint" id="y-alldelete"></i>
                </div>
            </div>
            <hr class="y-line">
            <div id="y-con-content">


            </div>
        </div>
    </section>
    <div id="footer" class="footer_wrap clearfix">
        <c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
    </div>

    <script>
    </script>
    <script src="<c:url value="/resources/js/shopping/shoppinglist/shoppinglist.js" />"></script>
</body>

</html>