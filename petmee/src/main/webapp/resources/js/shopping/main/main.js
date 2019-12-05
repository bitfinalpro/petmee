var $jq = jQuery.noConflict(); 
$jq(document).ready(function () {
    $jq('.slick-items').slick({
      autoplay : true,
      dots: true,
      speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
      infinite: true,
      autoplaySpeed: 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
      arrows: true,
      slidesToShow: 1,
      slidesToScroll: 1,
      fade: false
    });
    $jq('ul.tabs li').click(function(){
          var tab_id = $jq(this).attr('data-tab');
      
          $jq('ul.tabs li').removeClass('current');
          $jq('.tab-content').removeClass('current');
      
          $jq(this).addClass('current');
          $jq("#"+tab_id).addClass('current');
      });
      $jq('.autoplay').slick({
      slidesToShow: 4,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 2000,
      });
  });