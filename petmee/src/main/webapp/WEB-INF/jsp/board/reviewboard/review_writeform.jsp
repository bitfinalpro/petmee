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
	<link href="<c:url value='/resources/css/review/review_writer.css' />" rel="stylesheet">
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
                <h1>글쓰기</h1>
                <h4>-Writer-</h4>
            </div>
        </div>
        <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
        <!-- content시작 -->
        <div id="content" style="position:relative; margin: 0 auto; width:70%; ">
  
	<form method='post' action='review_write.do' name="SermernoteVo" enctype="multipart/form-data" >
       	<div class="review_form_title" >
       	    <div style="position:relative; margin: 0 auto; top: 10px; width:50px; height: 50px;"></div>
	       	<h2>상품은 만족하셨나요?</h2>
	       	<div style="width: 100px; height: 10px; background-color:#e0e0e0; position:relative; top: 15px; margin: 0 auto;"></div>
       	</div>
       	
       	<!-- 별점 -->
       	<div class="review_form__submit_container">
       	<input type="file" name="boardfile" multiple="multiple" />
      <div class="review_form__add_image_container js-add-image-container" style="cursor: pointer; margin-top: 2px;">
        <div class="files">
             <!-- <div><i class="fas fa-download"></i></div> -->
        	<div> <input type="file" name="sumfile" /></div>
        </div>
      </div>
    <div class="review_form__score">
      <div class="select2-container review_form__select_rating select_rating" id="s2id_review_score">
      <a href="javascript:void(0)" onclick="return false;" class="select2-choice" tabindex="-1">   
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
    
    <script>
        $('#summernote').summernote({
            placeholder: '<br>※ 게시판 용도와 무관하거나 아래 내용이 포함된 경우는 사전 안내없이 삭제/제재됩니다.<br><br>- 욕설, 상대 비방 등 타인의 명예를 훼손하는 게시물 <br><br>- 불쾌감을 줄 수 있는 이미지나 내용, 저작권에 위배되는 게시물 <br><br>- 개인정보 노출이 있거나 현금 거래 시도 등에 준하는 행위 ',
            tabsize: 2,
            height: 500,
            minHeight: null,   
            maxHeight: null,             
            focus: true 
          });
        let buEle = document.getElementById("BoardWrite")
        function onWrite(){
        	let userCheck = true;
        	if (buEle.content.value == ''){
        		alert("내용을 입력해주세요.");
        		return false;
        	}
        	BoardWrite.submit();
        }
     </script>
     <script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script> 
     <script src = "simple-image.js" ></script> 
     <link  href = "simple-image.css"  rel = "stylesheet" /> 
    
    
    <div id="footer" class="footer_wrap clearfix">
		<c:import url="/WEB-INF/jsp/common/footer.jsp"></c:import>
	</div>
</body>
</html>