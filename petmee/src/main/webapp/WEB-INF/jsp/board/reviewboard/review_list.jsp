<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Pet Mee</title>
	<%@ include file="/WEB-INF/jsp/include/includecss.jsp" %>
	<%@ include file="/WEB-INF/jsp/include/includejs.jsp" %>
	<link href="<c:url value='/resources/css/review/review_list.css' />" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board/notice.css" />">
</head>
<style>
  table > tr > th {
  text-align: center;
  }
</style>
<body>
	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>

<section>
    <div style="position:relative; margin: 0 auto; background-color: 10px solid #777;">
        <img src="<c:url value='/resources/images/board/review/top.jpg' />">
    </div>
     <c:import url="/WEB-INF/jsp/common/sideMenu.jsp"></c:import>      
    <div class="boardList">
        <div class="title">
            <div class="top">
                <h1 style="margin: 0 auto;">리뷰게시판</h1>
            </div>
        </div>
        <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
        <table border="" summary="" style="margin-left: 10px;">
        <caption>상품 게시판 목록</caption>
        <colgroup class="">
            <col style="width:10%;">
            <col style="width:10%;" class="">
            <col style="width:10%;" class="">
            <col style="width:20%;">
            <col style="width:10%;">
            <col style="width:10%;" class="">
            <col style="width:10%;" class="">
            <col style="width:10%;" class="">
            <col style="width:10%;" class="">
        </colgroup>
        <thead class="listheader">
            <tr id="top_list" style="margin-top: 20px; height:50px;">
                <th scope="col">번호</th>
                <th scope="col" class="thumb">제품</th>
                <th scope="col">제목</th>
                <th scope="col">내용</th>
                <th scope="col">글쓴이</th>
                <th scope="col">날짜</th>
                <th scope="col" class="displaynone">조회수</th>
                <th scope="col" class="displaynone">별점</th>
                <th scope="col" class="displaynone">상세</th>
            </tr>
        </thead>
        <!-- 제품 -->
        <c:if test="${empty list}">
			<tr>
				<td colspan="5">게시물이 없습니다.</td>
			</tr>				
		</c:if>
        <c:forEach var="b" items="${list}">
        <tbody class="product">
            <tr style="background-color:#FFFFFF; color:#000000;" class="content">
                <!-- 번호 -->
                <td class="number">${b.no}</td>
                <!-- 상품이미지, 상품명 -->
                <td class="thumb b_list">
                        <img src="<c:url value='/resources/images/board/review/캡처.JPG' />" border="0" alt="">
                        <span>하이펫 강아지사료 네츄럴코어</span>
                </td>
                <!-- 제목 -->
                <td class="displaynone b_list"><span>${b.title}</span></td>
                
                <!-- 내용 -->
                
                <td class="displaynone b_list"><span>${b.content}</span></td>
                <td class="b_list">${b.writer}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${b.regDate}" /></td>
                <td>${b.views}</td>
                
                <td class="displaynone b_list"></td>
            	<td >
            		<div style="margin-top: 10px;">
	            		<a href="#" style="background-color:#3f3f3f; width: 100px; display: block; color: #fff; padding: 5px; ">제품보기</a>
	            		<a href="/petmee/board/reviewboard/review_detail.do?no=${b.no}" style="background-color:#3f3f3f; margin-top: 10px; display: block; width: 100px; color: #fff; padding: 5px;">리뷰상세보기</a>
            		</div>
            	</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
    <div style="height:50px;"></div>
    
    <!-- 검색 -->
   <div class="xans-element- xans-board xans-board-search-4 xans-board-search xans-board-4 bbs_normal ">
        <fieldset class="boardSearch">
            <!-- <legend>게시물 검색</legend> -->
            <p><select id="search_date" name="search_date">
            <option value="week">전체</option>
            <option value="month">글쓴이</option>
            <option value="month3">제목</option>
            <option value="all">글쓴이+제목</option>
            </select> 
            <!--  
            <select id="search_key" name="search_key">
            <option value="subject">제목</option>
            <option value="content">내용</option>
            <option value="writer_name">글쓴이</option>
            <option value="member_id">아이디</option>
            <option value="nick_name">별명</option>
            <option value="product">상품정보</option>
            </select>
            --> 
            <input id="search" name="search" class="inputTypeText" placeholder="" value="" type="text"> 
                <a href="#none" onclick="BOARD.form_submit('boardSearchForm');" class="dj_btn_1">검색</a>
            </p>
            <a href="review_writeform.do" class="dj_btn_1" style="position:relative; top:-25px; left:550px; ">글쓰기</a>
        </fieldset>
    </div>


    <div class="xans-element- xans-board xans-board-paging-4 xans-board-paging xans-board-4">
        <p style="width: 50px; height:50px; border: 1px solid #e0e0e0;">
            <a href="">
                <i class="fas fa-chevron-left" style="line-height:1.5em; font-size:30px;" ></i>
            </a>
        </p>
        <ol>
            <li class="xans-record-" style=" box-sizing: border-box; width:50px; height:50px; border: 2px solid #000;">
                <a href="?board_no=4&amp;page=1" class="this">1</a>
            </li>
            <p style="width: 50px; height:50px; margin-left: 5px; border: 1px solid #e0e0e0;">
                <a href="?board_no=4&amp;page=1">
                    <i class="fas fa-chevron-right" style="line-height:1.5em; font-size:30px;"></i>
                </a> 
            </p>
        </ol>
    </div>
</section>
<div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
</body>
</html>