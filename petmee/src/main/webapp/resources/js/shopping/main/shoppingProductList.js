var $jq = jQuery.noConflict(); 
$jq(document).ready(function () {
    $jq('.slick-items').slick({
      autoplay : true,
      dots: true,
      speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
      infinite: true,
      autoplaySpeed: 300 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
      arrows: true,
      slidesToShow: 1,
      slidesToScroll: 1,
      fade: false
    });
});


function acyncMovePage(no){
	// ajax option
	var ajaxOption = {
			url : "productList.do",
			async : true,
			type : "POST",
			data: "categoryNo="+categoryNo,
			dataType:"json",
			cache : false,
			success: (result) => {
				
			},
			error:function(req, status, error) {
				alert(error);
			}

	};	
	$.ajax(ajaxOption).done(function(data){
		// Contents 영역 삭제
		$('#bodyContents').children().remove();
		// Contents 영역 교체
		$('#bodyContents').jsp(data);
	});
}

 