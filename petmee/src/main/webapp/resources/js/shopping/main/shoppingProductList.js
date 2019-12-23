var $jq = jQuery.noConflict(); 
$jq(document).ready(function () {
    $jq('.slick-items').not('.slick-initialized').slick({
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



 