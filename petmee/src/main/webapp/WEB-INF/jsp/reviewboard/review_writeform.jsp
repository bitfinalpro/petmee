<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="../resources/css/common/gnb.css" rel="stylesheet">
    <link href="../resources/css/review/review_writer.css" rel="stylesheet">
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
                <h1>글쓰기</h1>
                <h4>-Writer-</h4>
            </div>
        </div>
        <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
        
        
        <!-- content시작 -->
        <div id="content" style="position:relative; margin: 0 auto; width:70%; ">
        <!-- 이미지 불러오기 -->
        <div class="toplist" style="border-top: 5px solid #000;">

        	<div class="toto">
        		<div class="font">
	        		<span><strong>상품 주문번호</strong></span>
	        		<span>123123123</span>
        		</div>
        	</div>
        	<div class="bottomlist">
	        	<div class="thumb">
	        		<div class="thumb_img">
	        			<img src="../resources/images/review/minidog.jpg" style="width:100%;">
	        		</div>
	        	</div>
				<div class="toptit">
			       	<div class="toptit_head">[고양이간식] 고양이 분류</div>
			       	<div class="toptit_content">고양이간식 - 고양이 사료</div>
			       	<div class="toptit_end">옵션 종류 - 111</div>
				</div>
        	</div>
        </div>
        
	<form method='post' action='review_write.do'>
       	<div class="review_form_title" >
       	    <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
	       	<h2>상품은 만족하셨나요?</h2>
	       	<div style="width: 100px; height: 10px; background-color:#e0e0e0; position:relative; top: 15px; margin: 0 auto;"></div>
       	</div>
       	
       	<!-- 별점 -->
       	<div class="review_form__submit_container">
      <div class="review_form__add_image_container js-add-image-container" style="cursor: pointer;">
        
        <span class="review_form__add_image_icon sprites-icon-camera-black"></span>
        <div class="review_form__add_image_description" data-org-text="+ 사진추가">+ 사진추가</div>
      </div>
    <div class="review_form__score">
      <div class="select2-container review_form__select_rating select_rating" id="s2id_review_score">
      <a href="javascript:void(0)" onclick="return false;" class="select2-choice" tabindex="-1">   
	      <div class="select2-chosen">
		      <div class="item">
			      <span class="star"></span>
			      <span class="star"></span>
			      <span class="star"></span>
			      <span class="star"></span>
			      <span class="star"></span>
		      	  <span class="text">아주 좋아요</span>
		      </div>
	      </div>
	      <abbr class="select2-search-choice-close"></abbr>
	      
	      <span class="select2-arrow"><b></b></span>
	      <span class="sprites-icon-drop-down select2__dropdown_icon"></span>
      </a>
      <input class="select2-focusser select2-offscreen" type="text" id="s2id_autogen5"></div>
      <select class="review_form__select_rating select_rating select2-offscreen" data-dropdown-css-class="review_form__select_rating_drop" name="review[score]" id="review_score" tabindex="-1">
		<option selected="selected" value="5">아주 좋아요</option>
		<option value="4">맘에 들어요</option>
		<option value="3">보통이에요</option>
		<option value="2">그냥 그래요</option>
		<option value="1">별로에요</option>
	</select>
    </div>
    <input type="hidden" value="39533" name="review[product_id]" id="review_product_id">
    <input type="hidden" value="24" name="review[review_source]" id="review_review_source">
    <input type="hidden" value="0" name="review[social_media_type]" id="review_social_media_type">
    <input type="hidden" name="review[sub_order_id]" id="review_sub_order_id">
    <input type="hidden" name="review[position]" id="review_position">
    
    <button class="review_form__submit" type="submit" data-disable-with="저장 중...">
      <span class="review_form__submit_title_icon fa fa-check-circle-o"></span>
      <span class="review_form__post_review_label" >리뷰 등록하기</span>
	</button>  
	
    <div style="position:relative; margin: 0 auto;  width:50px; height:50px;"></div>  
  </div>
	
	<!-- 글쓰기 -->
	<div class="revcontent">
		<div style="position:relative; margin: 0 auto;  width:50px; height: 10px;"></div>  
			<div class="revcontent_title">
		       	<h2>어떤 점이 좋았나요?</h2>
		       	<div style="width: 100px; height: 10px; background-color:#e0e0e0; position:relative; top: 15px; margin: 0 auto;"></div>
	       	</div>
	       	<div class="revcontent_writer">
	       		<div class="revcon_writer">
		       		<c:choose>
		 			<c:when test="${empty member}">
		 				<h3>글쓴이</h3>
				 		<input type="text" name="writer" class="recs" placeholder="제목을 입력해주세요" >
		 				<script>
							function resize(obj) {
							  obj.style.height = "400px";
							  obj.style.height = (12+obj.scrollHeight)+"px";
							}
						</script>
		 			</c:when>
		 			<c:otherwise>
				 		<input type="hidden" id="writer" name="writer" value="${member.id}" />
					      글쓴이 : ${member.id}
		 			</c:otherwise>
			     </c:choose>
		     	</div>
	       		<!-- <h3>글쓴이</h3>
				<input type="text" class="recs" name="writer" />
				<script>
					function resize(obj) {
					  obj.style.height = "400px";
					  obj.style.height = (12+obj.scrollHeight)+"px";
					}
				</script> -->
		       	<div class="revcon_tit">
		       		<h3>제목</h3>
					<input type="text" id="title" name="title" class="recs" placeholder="제목을 입력해주세요" >
					<script>
						function resize(obj) {
						  obj.style.height = "400px";
						  obj.style.height = (12+obj.scrollHeight)+"px";
						}
					</script>
				</div> 	
			</div> 	
			<div class="revcontent_text">
	       		<h3>내용</h3>
				<textarea class="recs" id="content" name='content' placeholder="내용을 입력해주세요" ></textarea>
				<script>
					function resize(obj) {
					  obj.style.height = "400px";
					  obj.style.height = (12+obj.scrollHeight)+"px";
					}
				</script>
			</div> 
		</div>
		</form>
		
    <div style="position:relative; text-align:center; margin: 0 auto; display:block; top:120px; width:100%; height: 180px; padding: 10px;">
    	<div class="btnArea" style=" width:150px; top:20px; margin:0 auto; border: 1px solid #dadada;">
			<a href="/petmee/reviewboard/review_list.do">목록</a>
        </div>
        <div style="position:relative; margin: 0 auto; width:50px; height: 80px;"></div>
    </div>
		
	</div>
    </section>
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