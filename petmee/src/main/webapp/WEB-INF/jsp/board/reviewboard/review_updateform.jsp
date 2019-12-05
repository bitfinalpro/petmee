<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
	<title>Pet Mee</title>
	<link href="<c:url value='/resources/css/common/gnb.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/review/review_writer.css' />" rel="stylesheet">
	<link rel="stylesheet"	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
	<script src="<c:url value='/resources/js/common/jquery-1.12.4.js' />"></script>
</head>
  
<body>
	<div id="header">
		<c:import url="/WEB-INF/jsp/common/menu.jsp"></c:import>
	</div>
<!--      <div style="position:relative; margin: 0 auto; background-color: 10px solid #777;">
        <img src="../resources/images/review/top.jpg">
    </div> -->
    <section>
        <div style="position:relative; margin: 0 auto; background-color: 10px solid #777;">
            <img src="<c:url value='/resources/images/board/review/top.jpg' />"/>
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
	        			<img src="<c:url value='/resources/images/board/review/minidog.jpg' />" style="width:100%;">
	        		</div>
	        	</div>
				<div class="toptit">
			       	<div class="toptit_head">[고양이간식] 고양이 분류</div>
			       	<div class="toptit_content">고양이간식 - 고양이 사료</div>
			       	<div class="toptit_end">옵션 종류 - 111</div>
				</div>
        	</div>
        </div>
	<form method='post' action='review_update.do'>
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
	     <!--  <div class="select2-chosen">
		      <div class="item">
			      <span class="star"></span>
			      <span class="star"></span>
			      <span class="star"></span>
			      <span class="star"></span>
			      <span class="star"></span>
		      	  <span class="text">아주 좋아요</span>
		      </div>
	      </div> -->
	      
	      <select name="searchYear" class="select2-chosen" style="display:block; width: 100%; height: 100%">
				<option value="5">★★★★★ 아주 좋아요</option>
				<option value="4">★★★★ 괜찮네요</option>
				<option value="3">★★★ 그저 그렇네요</option>
				<option value="2">★★ 생각 좀 해볼게요</option>
				<option value="1">★ 별루에요</option>
			</select>

	      <abbr class="select2-search-choice-close"></abbr>
	      
	      <span class="select2-arrow"><b></b></span>
	      <span class="sprites-icon-drop-down select2__dropdown_icon"></span>
      </a>
      <input class="select2-focusser select2-offscreen" type="text" id="s2id_autogen5"></div>
    </div>
    <input type="hidden" value="39533" name="review[product_id]" id="review_product_id">
    <input type="hidden" value="24" name="review[review_source]" id="review_review_source">
    <input type="hidden" value="0" name="review[social_media_type]" id="review_social_media_type">
    <input type="hidden" name="review[sub_order_id]" id="review_sub_order_id">
    <input type="hidden" name="review[position]" id="review_position">
    
    <button class="review_form__submit" type="submit" data-disable-with="저장 중...">
      <span class="review_form__submit_title_icon fa fa-check-circle-o"></span>
      <span class="review_form__post_review_label" >리뷰 수정하기</span>
	</button>  
	
    <div style="position:relative; margin: 0 auto;  width:50px; height:50px;"></div>  
  </div>
	
	<!-- 글쓰기 -->
	<div class="revcontent">
		<div style="position:relative; margin: 0 auto;  width:50px; height: 10px;"></div>  
			<div class="no"><input type="hidden" name="no" value="${board.no}" /></div>
			<div class="revcontent_title">
		       	<h2>어떤 점이 좋았나요?</h2>
		       	<div style="width: 100px; height: 10px; background-color:#e0e0e0; position:relative; top: 15px; margin: 0 auto;"></div>
	       	</div>
	       	<div class="revcontent_writer">
	       		<div class="revcon_writer">
		 			<h3>글쓴이</h3>
				 	<input type="text" id="writer" name="writer" class="recs" readonly="readonly"  value="${board.writer}" />
			 		<script>
						function resize(obj) {
						  obj.style.height = "400px";
						  obj.style.height = (12+obj.scrollHeight)+"px";
						}
					</script>
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
					<input type="text" id="title" name="title" class="recs" placeholder="제목을 입력해주세요" value='<c:out value="${board.title}" />'>
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
				<textarea class="recs" id="content" name='content' placeholder="내용을 입력해주세요" ><c:out value="${board.content}" /></textarea>
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
			<a href='/petmee/board/reviewboard/review_list.do'>목록</a>
        </div>
        <div style="position:relative; margin: 0 auto; width:50px; height: 80px;"></div>
    </div>
		
	</div>
    </section>
    <div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
</body>
</html>