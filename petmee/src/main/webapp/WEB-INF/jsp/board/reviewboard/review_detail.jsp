<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="../resources/css/common/gnb.css" rel="stylesheet">
    <link href="../resources/css/review/review_detail.css" rel="stylesheet">
    <script src="../resources/js/jquery-1.12.4.js"></script>
	<script src="<c:url value='../resources/js/common/jquery-1.12.4.js' />"></script>
	<title>PET ME</title>
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
    <div class="header clearfix">
    <div class="headwrap clearfix">
        <h1 class="logo"><a href="#"><img src="../resources/images/menu/final_logo.png"></a></h1>
        <div class="util_wrap">
            <ul class="clearfix">
                <li><a href="#">LOGIN</a></li>
                <li><a href="#">JOIN</a></li>
                <script>
                    function allsearch(form) {
                        if (form.search_word.value == "") {
                            alert("검색어를 입력해 주세요");
                            form.search_word.focus();
                            return (false);
                        }
                        form.submit();
                    }
                </script>
            </ul>
        </div>
        <div class="search_wrap">
            <div class="search_box">
                <form method="get" action="/pc/main/search.html" onsubmit="return allsearch(this);">
                    <input class="input" type="text" title="검색어" name="search_word"
                        placeholder="검색어를 입력하세요">
                    <input type="submit" class="btn" value="검색">
                </form>
            </div>
        </div>
    </div>
    <nav>
        <div class="gnb">
            <div class="gnb_wrap">
                <ul class="depth clearfix">
                    <li class="depth01" data-id="menu1">
                        <a href="#">FOOD </a>
                        <div class="depth02_box">
                            <ul class="clearfix tab">
                                <li><a href="#">
                                        <div class="imgbox">
                                            <img src="../resources/images/menu/13.jpg" alt="" class="off">
                                            <img src="../resources/images/menu/13_on.jpg" alt="" class="on">
                                        </div>
                                        <div class="txtbox">
                                            <p class="tit">사료</p>
                                            <p class="txt">사료을 소개합니다. </p>
                                        </div>
                                    </a></li>
                                <li><a href="#">
                                        <div class="imgbox">
                                            <img src="../resources/images/menu/14.jpg" alt="" class="off">
                                            <img src="../resources/images/menu/14_on.jpg" alt="" class="on">
                                        </div>
                                        <div class="txtbox">
                                            <p class="tit">간식</p>
                                            <p class="txt">함께 일해 볼래요? <i class="br"></i>브리더, 스텝 大모집 </p>
                                        </div>
                                    </a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="depth01" data-id="menu2">
                        <a href="#">패션</a>
                        <div class="depth02_box">
                            <ul class="clearfix tab">
                                <li><a href="#">
                                    <div class="imgbox">
                                        <img src="" alt="" class="off">
                                        <img src="" alt="" class="on">
                                    </div>
                                    <div class="txtbox">
                                        <p class="tit">패딩/아우터</p>
                                        <p class="txt">신발/양말</p>
                                    </div>
                                </a></li>
                                <li><a href="#">
                                     <div class="imgbox">
                                         <img src="" alt="" class="off">
                                         <img src="" alt="" class="on">
                                     </div>
                                     <div class="txtbox">
                                         <p class="tit">티셔츠/올인원</p>
                                         <p class="txt">악세사리/외출용품</p>
                                     </div>
                                 </a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="depth01 _down" data-id="menu7">
                        <a href="#">미용/목욕(목욕용품,발톱관리,눈/귀/구강관리,미용/털관리)</a>
                    </li>
                    <li class="depth01 _down" data-id="menu7">
                        <a href="#">위생/배변(배변용품,위생용품,털제거/청소용품</a>
                    </li>
                    <li class="depth01 _down" data-id="menu7">
                        <a href="#">장난감()</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    </div>
    </div>
    <section>
        <div style="position:relative; margin: 0 auto; background-color: 10px solid #777;">
            <img src="../resources/images/review/top.jpg">
        </div>
        <div class="title">
            <div class="top">
                <h1>리뷰게시판</h1>
                <h4>-Detail-</h4>
            </div>
        </div>
        <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
        
        <c:forEach var="d" items="${board}">
        <div id="contents_all">
            <div class="title">
                <div class="board_list_all"></div>
            </div>

            <div class="xans-element- xans-board xans-board-product-4 xans-board-product xans-board-4 ">
                <p class="prdThumb">
                    <a href="#">
                        <img src="../resources/images/review/food.jpg" alt="">
                    </a>
                </p>
                <div class="prdInfo">
                    <p style="color:#666;">${board.proCatgo}</p>
                    <h3>${board.product}</h3>
                    
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
                            <p style="text-align: center; font-size: 20px;">${board.content }</p>
                        </td>
                    </tr>
                    <tr class="grade displaynone">
                        <th scope="row">평점</th>
                        <td>★★★★★★</td>
                    </tr>
                    <tr class="view" style="position: relative; margin: 0 auto;">
                        <td colspan="2">
                            <div class="detail" style="position: relative; margin: 0 auto;">
                                <img src="../resources/images/review/minidog.jpg" >
                            </div>
                        </td>
                    </tr>
                    <tr class="attach displaynone">
                        <th scope="row">첨부파일</th>
                        <td></td>
                    </tr>
                   
                </tbody>
            </table>
        </div>
        </c:forEach>

        <div style="position:relative; margin: 0 auto; top: 20px; width: 150px;">
            <span class="left" style="position:relative; ">
                <a href='/petmee/reviewboard/review_list.do' class="dj_search_btn_2">목록</a>
	            <a href='/petmee/reviewboard/review_delete.do?no=${board.no}' class="dj_search_btn_2">삭제</a>
	            <a href='/petmee/reviewboard/review_updateform.do?no=${board.no}' class="dj_search_btn_2">수정</a>
            </span>
        </div>
        <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
        
        
        <!-- 댓글 페이지 -->
        <div id="commentRegistForm" style="border: 5px solid #e0e0e0; padding: 20px;">
			<form id="crForm" method="post" action="comment_regist.do">
				<input type="hidden" id="no" value="${board.no}" style="border: 1px solid #dadada;"/>	
				<table width="70%">
				<tr>
					<td style="width:20%;">글쓴이 : <input type="text" id="writer" /></td>
					<td style="position:relative; float:left; width:100%;"><span style="width: 20%;">내용: </span><textarea id="content"></textarea></td>
					<td style="width:5%; text-align: right;"><input type="submit" class="wribtn" value="등록" /></td>
				</tr>	
				</table>
			</form>
		</div>
		<!-- 댓글 목록 -->		
		<div id="commentList"></div>			
	<script>
		let no = ${board.no};
	</script>
	<script src="<c:url value='../resources/js/board.js' />"></script>
 
            
    </section>
    <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
    <!-- content 끝 -->
    
    <!-- footer 시작 -->
    <div id="footer" class="footer_wrap clearfix">
    	<div class="wrapper clearfix">
    <div class="foot_wrap">
        <div class="foot_logo">
            <a href="./#" class="logo"><img src="../resources/images/menu/footlogo.png" alt=""></a>
        </div>
        <div class="foot_txt">

            <p class="bar_span">
                <span>시바먼치킨</span>
                <span>address</span>
            </p>
            <p class="copy">
                COPYRIGHT ⓒ 2019 사이트명, ALL RIGHTS RESERVED.
            </p>

            <div class="sns_wrap">
                <ul class="clearfix">
                    <li><a href="#" target="_blank" class="blog" title=" "></a></li>
                    <li><a href="#" target="_blank" class="cafe" title=" "></a></li>
                    <li><a href="#" target="_blank" class="kakao" title=" "></a></li>
                    <li><a href="#" target="_blank" class="instagram" title=" "></a></li>
                    <li><a href="#" target="_blank" class="facebook" title=" "></a></li>
                    <li><a href="#" class="location" title=" "></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
    </div>
</body>
</html>