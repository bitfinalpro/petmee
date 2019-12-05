<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
	<title>Pet Mee</title>
	<link href="<c:url value='/resources/css/common/gnb.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/review/review_detail.css' />" rel="stylesheet">
	<link rel="stylesheet"	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
	<script src="<c:url value='/resources/js/common/jquery-1.12.4.js' />"></script>
</head>
    
<body>
    <div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
    <section>
        <div style="position:relative; margin: 0 auto; background-color: 10px solid #777;">
            <img src="<c:url value='/resources/images/board/review/top.jpg' />"/>
        </div>
        <div class="title">
            <div class="top">
                <h1>리뷰게시판</h1>
                <h4>-Detail-</h4>
            </div>
        </div>
        
        <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
        
        <div class="contents_all">
            <div class="title">
                <div class="board_list_all"></div>
            </div>
			
            <div class="xans-element- xans-board xans-board-product-4 xans-board-product xans-board-4 ">
                <p class="prdThumb">
                    <a href="#">
                        <img src="<c:url value='/resources/images/board/review/food.jpg' />"/>
                    </a>
                </p>
                <div class="prdInfo">
                    <p style="color:#666;">${board.proCatgo}</p>
                    <h3>${board.product} </h3>
                    
                    <p class="price" style="font-size: 20px;">${board.price}원</p>
                    <p class="button">
                        <a href="#" title="새창으로 이동" class="dj_search_btn_2">상품상세보기</a>
                    </p>
                </div>
            </div>
            
        <div class="boardView ">
            <table border="" summary="">
                <caption>상품 게시판 상세</caption>
                <tbody> 
                    <tr class="etcArea" style="border-bottom: #e0e0e0;">
                        <!-- <td style="border-bottom: #e0e0e0;">
                            <th scope="row">작성자</th>
                            <td style="padding: 10px;"> 김준영 <span class="displaynone">(ip:)</span></td>
                        </td> -->
                        <td style="border-bottom: 1px solid #e0e0e0; ">
                            <ul class="sub_title" style="position:relative; float:left;">
                                <li class="writer">
                                    <strong class="th">글쓴이</strong> 
                                    <span class="td">${board.writer}</span>
                                </li>
                                <li class="tit">
                                    <strong class="th">제목</strong> 
                                    <span class="td">${board.title}</span>
                                </li>
                            </ul>
                            <ul class="sub_right" style="position:relative; float:left;">

                                <li class="hit " style="margin-left: 30px;">
                                    <strong class="th">조회수</strong> 
                                    <span class="td">${board.views}</span>
                                </li>
                                <li class="date">
                                    <strong class="th">작성일</strong> 
                                    <span class="td"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" /></span>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <!-- <th scope="row">제목</th> -->
                        <td>
                            <p style="text-align: center; font-size: 30px; font-weight: 300;">${board.title}</p>
                        </td>
                    </tr>
                    
                    <tr>
                        <!-- <th scope="row">내용</th> -->
                        <td>
                            <p style="text-align: center; font-size: 20px;">${board.content}</p>
                        </td>
                    </tr>
                    <tr class="grade displaynone">
                        <th scope="row">평점</th>
                        <td>★★★★★★</td>
                    </tr>
                    <tr class="view" style="position: relative; margin: 0 auto;">
                        <td colspan="2">
                            <div class="detail" style="position: relative; margin: 0 auto;">
                                <c:forEach var="flist" items="${flist}" varStatus="status">
									<div style="display:block; float: left; margin:0 auto;"><img class="img-src" src="<c:url value='${flist.path}${flist.oriName}'/>"/></div>
								</c:forEach>
                            </div>
                        </td>
                    </tr>
                    <tr class="attach displaynone">
	                        <th scope="row">
		                        asdasdas
							</th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        </div>

        <div style="position:relative; margin: 0 auto; top: 20px; width: 150px;">
            <span class="left" style="position:relative; ">
                <a href='/petmee/board/reviewboard/review_list.do' class="dj_search_btn_2">목록</a>
	            <a href='/petmee/board/reviewboard/review_delete.do?no=${board.no}' class="dj_search_btn_2">삭제</a>
	            <a href='/petmee/board/reviewboard/review_updateform.do?no=${board.no}' class="dj_search_btn_2">수정</a>
            </span>
        </div>
        <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
        
       	<div id="commentRegistForm">
			<form id="crForm" method="post" action="comment_regist.do">
				<input type="hidden" id="no" value="${board.no}" />	
				<table width="70%">
				<tr>
					<td><input type="text" id="writer" /></td>
					<td><textarea id="content" rows="2" cols="60" class="recs"></textarea></td>
					<td><input type="submit" value="등록" /></td>
				</tr>	
				</table>
			</form>
		</div>
		<!-- 댓글 목록 -->		
		<div id="commentList"></div>	
    </section>
    
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