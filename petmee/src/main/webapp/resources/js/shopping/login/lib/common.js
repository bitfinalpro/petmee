/*답글*/
$(document).ready(function() {
  var post_li = $('.txt_post_wrap .post_list .post_li');
  $(post_li).each(function() {
    $(this).find('.btn_answer').on('click', function() {
      $(this).parent().parent().parent().parent().find('.answer_box').toggle();
    })
  });
  $(".btn_modify").click(function() {
    if ($(this).parent().parent().parent().parent().find('.modify_box').css('display') === 'none') {
      $(this).parent().parent().parent().parent().find('.modify_box').show();
      $(this).parent().parent().parent().find('.des_txt').hide();
      $(this).text("수정취소");
    } else {
      $(this).parent().parent().parent().parent().find('.modify_box').hide();
      $(this).parent().parent().parent().parent().find('.des_txt').show();
      $(this).text("수정");
    }
  })
});

function videoBtn(){
  if( $('.videoWrapper .videoBtn').length>0){
    $('.videoBtn').click(function(){
      $(this).parent().addClass('active');
    });
  }
}videoBtn();

var wow = new WOW({
				boxClass:     'wow',      // animated element css class (default is wow)
				animateClass: 'animated', // animation css class (default is animated)
				offset:       50,          // distance to the element when triggering the animation (default is 0)
				mobile:       true,       // trigger animations on mobile devices (default is true)
				live:         true,       // act on asynchronously loaded content (default is true)
				callback:     function(box) {
					// the callback is fired every time an animation is started
					// the argument that is passed in is the DOM node being animated
			},
				scrollContainer: null // optional scroll container selector, otherwise use window
		}
);

var wowrap = $('.wowrap');
		$(wowrap).each(function() {
				$(this).find('.wow').each(function(index){
				var eq = (index)/4+"s"; //2.5s 씩 추가
				$(this).attr('data-wow-delay',eq);
		});
		$(this).find('.animated').each(function(index){
				var eq = (index)*250;
				$(this).attr('data-id','delay-'+eq);
		});
});



/*
gnb 
*/
var navFun = {
	init: function() {
    this.navAction();
    this.navAction2();
		this.navAction_2dep();
		// this.navAction_freeweb();
	},
	navAction: function() {
		var gnb_link_01			= $('.gnb .depth01:not(._manual)').children('a');
		var gnb_link_02			= $('.gnb .depth02_box:not(._manual) li').children('a');
		var gnb_link_02_sub		= $('.sub_dep02 li a');
		var gnb_link_03			= $('.sub_dep03 li').children('a');

		var url = window.location.href;
				src = url.split('/')[url.split('/').length-1].split('.')[0];
				src01 = src.split('?')[0].split('-')[0].split('_')[0];
				src02 = src.split('?')[0].split('-')[0].slice(0, -3);
				src03 = src.split('?')[0].split('-')[0];

		gnb_link_01.each(function(){
			var this_href = $(this).attr('href');
			var href = this_href.split('/')[this_href.split('/').length-1].split('.')[0].split('_')[0];            
			if (href==src01) {
				$(this).addClass('on');
				$(this).siblings('.depth02_box').addClass('on');
			}else{
				$(this).removeClass('on')
			}
		});	
		gnb_link_02.each(function(){
			var this_href = $(this).attr('href'); 
			var href =  this_href.split('/')[this_href.split('/').length-1].split('.')[0].split('-')[0].slice(0, -3);
			if (href==src02) {
				$(this).addClass('on');
			}else{
				$(this).removeClass('on')
			}
		});
		
		gnb_link_02_sub.each(function(){
			var this_href = $(this).attr('href'); 
			var href =  this_href.split('/')[this_href.split('/').length-1].split('.')[0].split('-')[0].slice(0, -3);
			if (href==src02) {
				$(this).addClass('on');
			}else{
				$(this).removeClass('on')
			}
		});

		gnb_link_03.each(function(){
		  var this_href = $(this).attr('href');
		  var href3 = this_href.split('/')[this_href.split('/').length-1].split('.')[0];          
		  if (href3==src03) {
			$(this).addClass('on');
		  }else{
			$(this).removeClass('on')
		  }
		});
	},
  navAction2: function(){ 
    var navopen  = $('.full_navbtn');
    var navclose = $('.full_nav .navbtn');
    var full     = $('.full_nav');

    navopen.on('click',onOver);
    navclose.on('click',Over);

    function onOver(){
      if(full.css('display') === 'none'){ 
        $(full).fadeIn(300);   
        setTimeout(function() {   
          $(full).addClass('on');
          // $(navclose).addClass('on');   
        },100);
        $('html').css({'overflow-y':'hidden'})
      }
    };
    function Over(){
      // $(navclose).removeClass('on');
      setTimeout(function() {
        $(full).removeClass('on');
        $(full).fadeOut(500);
      }, 100);
      $('html').css({'overflow-y':'auto'})
    }
  },
  navAction_2dep: function(){
    var depth_02 = $('.gnb_wrap .depth01 .depth02_box');    
    $('.gnb_wrap .depth01').children('a').on('mouseover focus',onOn);     
    function onOn(){
      depth_02.hide();
      $(this).parent('.depth01').children('.depth02_box').show();
      // $(this).parent('.depth01').children('.depth02_box').addClass('onover');
    }
    $('.gnb_wrap .depth').on('mouseleave',function(){
      // $('.depth02_box').hide();
      $('.depth02_box').slideUp();
      // $('.depth02_box').removeClass('onover');
    })
  }
};

var subFun = {
    init:function(){
        this.breadcrumb();
        this.submenu();
    },
    breadcrumb : function(){
        var breadcrumb = $('.sub-visual .breadcrumb');
        if ($('.gnb .depth01 > a.on').length > 0){
        var dep1_txt  = $('.gnb .depth01').children('a.on').text();
        var dep1_href  = $('.gnb .depth01').children('a.on').attr('href');
        // var dep1_txt  = $(dep1).text();
        $('.sub-visual .breadcrumb .depth01 a').text(dep1_txt);
        $('.sub-visual .breadcrumb .depth01 a').attr('href', dep1_href);
      }
      else{
        $('.sub-visual .breadcrumb .depth01').hide();
      }
    },
    submenu: function(){      
      var submenu = $('.depth01').children('a.on').parent('.depth01').data('id');
      console.log(submenu);
      // $('.sub-menu-list').hide();
      // $('#'+submenu).show();
      $('#'+submenu).addClass('on');//show();

    //   $('.sub-menu-list').append(submenu);
    }
}
// var navMobile = {
//     init: function() {
//         this.moAction();
//     },
//     moAction: function() {
//         var depth_1 = $('.mo_gnb_wrap .depth01:not(._down)');
//         var depth_2 = $('.mo_gnb_wrap .depth02_box');
//         var depth_3 = $('.mo_gnb_wrap .depth03');
//         var depth_1_down = $('.mo_gnb_wrap .depth01._down');
//         var depth_2_down = $('.mo_gnb_wrap .depth02._down');
//         var nav_bg = $('.nav_bg');
        
//         $(depth_2).hide();
//         $(depth_3).hide();
//         // $(nav_bg).hide();

//         $(depth_1).children('a').click(function(){
//             if ( $(this).next('div').css('display') === 'none') {
//                 $(depth_1).children('a').removeClass('selected1');
//                 $(this).addClass('selected1');
//                 $(depth_3).hide();
//                 $(depth_2_down).children('a').removeClass('selected2');
//                 $(depth_2).slideUp(300);
//                 $(this).next().stop().slideDown(300);
//             } else{
//                 $(this).next('div').slideUp(200); 
//                 $(depth_1).children('a').removeClass('selected1');       
//             }
//             return false;
//         });

//         $(depth_2_down).children('a').click(function(){
//             if($(this).next('div').css('display') === 'none'){
//                 $(depth_2_down).children('a').removeClass('selected2');
//                 $(this).addClass('selected2');
//                 $(depth_3).slideUp(300);
//                 $(this).next().stop().slideDown(300);
//             }else{
//                 $(this).next('div').slideUp(200);
//                 $(depth_2_down).children('a').removeClass('selected2');
//             }
//             return false;
//         });

//         var navopen = $('.m_nav_btn_box .nav_btn');
//         // var navclose = $('.m_nav_btn_box .on');
//         var navclose = $('.nav_btn.on.close');
//         ToggleNav = function(){
//            $('.mo_gnb_wrap').toggleClass('on');
//            $('.header').toggleClass('on');
//            $(nav_bg).toggleClass('on');        
//            $(navopen).toggleClass('on');
//            $(depth_2).hide();
//            $(depth_1).children('a').removeClass('selected1');
//            $(depth_2_down).children('a').removeClass('selected2');
//            $('html').toggleClass('htmloverflow');
//         }
//         $(navopen).on('click',function(){ 
//         	ToggleNav();
//         });
//         $(navclose).on('click',function(){ 
//         ToggleNav();          
//         })
//         $(nav_bg).on('click',function(){ 
//         ToggleNav();          
//         })
//     }

// };

     
var tabFun = {
	init: function(){
		this.tab01();
		this.tab02();
	}
	,tab01: function(){
		var tabBtn = $('.tab-wrap .tab li > a');
		var tab1st = $('.tab-wrap .tab li').eq(0).find('a');
		var conAll = $('.tab-wrap .tab-content');
		var con1st = $('.tab-wrap .tab-content').eq(0);
		$(tab1st).addClass('on');
		$(conAll).hide();
		$(con1st).show();
		$(tabBtn).click(function () {
			$(conAll).hide();
			tabHref = $(this).attr('href');
			$(tabHref).show();
			$(tabBtn).removeClass('on');
			$(this).addClass('on');
			return false;
		});
	} 
	,tab02:function(){
		$('.tab').each(function(index){
			var tab = $('.tab').children('li');
			var list_length = $(this).children('li').length;
			$(this).addClass('tab'+list_length);

		});
	}   
};
var SlickSlider = {
  init: function() {
      this.slick_main();          
      this.slick_sub();          
  }
  ,slick_main: function() {
  	$('.main_visual .slick').slick({ 
  		infinite        : true,
  		fade            : true,
  		autoplay        : true,
      autoplaySpeed :  4000,
      speed: 800,
  		pauseOnHover    : false,
  		slidesToScroll  : 1,
  		arrows           : true,
  		focusOnSelect   : false,//true,
  		pauseOnDotsHover: false,
      prevArrow : '<i class="sa_box sa_l xi-angle-left-thin"></i>',
      nextArrow : '<i class="sa_box sa_r xi-angle-right-thin"></i>',
  		// dots:true,
  		// dotsClass : 'border_dots',
  	});
    $('.lightbox_slick .slick').slick({ 
      arrows:true,
      infinite        : true,
      autoplay        : false,//true,
      slidesToShow  : 4,
	  slidesToScroll: 4,
      // centerMode: true,
      // centerPadding: 0,
      speed: 1000,
      pauseOnHover    : false,
      pauseOnDotsHover: false,
      dots: false,
      prevArrow : '<i class="sa_l"><img src="../images/arrow/cir_l.png"></i>',
      nextArrow : '<i class="sa_r"><img src="../images/arrow/cir_r.png"></i>',
    });

    $('.lightbox-review_slick .slick').slick({ 
      arrows:true,
      infinite        : true,
      autoplay        : false,
      slidesToShow  : 5,
      rows: 2,
      slidesPerRow: 1,
      speed: 1000,
      pauseOnHover    : false,
      pauseOnDotsHover: false,
      dots: false,
      prevArrow : '<i class="sa_l"><img src="../images/arrow/cirw_l.png"></i>',
      nextArrow : '<i class="sa_r"><img src="../images/arrow/cirw_r.png"></i>',
      responsive: [{
        breakpoint: 1600,
        settings: {
          slidesToShow: 4,
        }
      }]
    });

  	$('.celeb_cir .slick').slick({ 
      arrows:false,
  		infinite        : true,
  		autoplay        : true,
  		slidesToShow  : 4,
		slidesToScroll: 4,
        speed: 1000,
		autoplaySpeed: 6000,
        pauseOnHover    : false,
  		pauseOnDotsHover: false,
  		dots:true,
  	});
  }
  ,slick_sub: function(){
    $('.store_img_slick .slick').slick({    
      autoplay: false,
      autoplaySpeed: 5000,
      fade: true,
      dots: true,
      pauseOnHover    : false,
      focusOnSelect   : true,
      pauseOnDotsHover: false,
      arrows: true,
      prevArrow : '<i class="sa_l op_l"><img src="../images/arrow/cirw_l2.png"></i>',
      nextArrow : '<i class="sa_r op_r"><img src="../images/arrow/cirw_r2.png"></i>',
    });
    $('.parcel_list .slick').slick({      
      infinite        : true,
      autoplay        : true,
      slidesToShow  : 4,
      arrows: true,
      dots: false,
      prevArrow : '<i class="sa_l"><img src="../images/arrow/cirw_l.png"></i>',
      nextArrow : '<i class="sa_r"><img src="../images/arrow/cirw_r.png"></i>',
    });
    $('.mall_img_slick').slick({      
      infinite        : true,
      autoplay        : true,
      fade: true,
      slidesToShow  : 1,
      arrows: false,
      dots: false,
    });
    
    
    // $('.store_list-slick').slick({    
    //   autoplay: false,
    //   autoplaySpeed: 5000,
    //   fade: true,
    //   pauseOnHover    : false,
    //   focusOnSelect   : true,
    //   pauseOnDotsHover: false,
    //   arrows: true,
    //   prevArrow : '<i class="sa_l xi-angle-left-thin"></i>',
    //   nextArrow : '<i class="sa_r xi-angle-right-thin"></i>',
    //   asNavFor: '.store_list-slick_nav'
    // });
    // $('.store_list-slick_nav').slick({       
    //   autoplaySpeed: 5000,
    //   autoplay: true,
    //   slidesToShow: 6,
    //   pauseOnHover    : false,
    //   focusOnSelect   : true,
    //   pauseOnDotsHover: false,    
    //   arrows: false,
    //   asNavFor: '.store_list-slick'
    // });
  }
};


var mainScroll = {
    init: function() {
        this.Scroll_01();
    },
    Scroll_01: function() {            
        $('.scroll-con-y').mCustomScrollbar({
            axis:'y',
            advanced:{autoExpandHorizontalScroll:true}
        });        
    }
};



var btnFun = {
  init: function(){
    this.quickjs();
    // this.familyjs();
    // this.searchjs();
    // this.navdesc();
    // this.newsletter();
  }
  ,quickjs: function(){
    $('.quick_menu .nav_btn').click(function(){
      if($(this).hasClass('on')){
        $(this).removeClass('on');
        $(this).find('p').text('퀵메뉴');
        $('.quick_menu').removeClass('open');
        $('#ch-plugin').removeClass('open');
		  var expire = new Date();
		  expire.setDate(expire.getDate() + 1);        
		  cookies = "quick_menu=ok; path=/ ; expires="+expire.toGMTString()+";";
		  document.cookie = cookies; 
      }
      else{
        $(this).addClass('on');
        $(this).find('p').text('닫기');
        $('.quick_menu').addClass('open');
        $('#ch-plugin').addClass('open');
		  var expire = new Date();
		  expire.setDate(expire.getDate() + 1);        
		  cookies = "quick_menu=no; path=/ ; expires="+expire.toGMTString()+";";
		  document.cookie = cookies;
      }
    })
  }
  ,familyjs: function() {
    $('.family-area .tit').find('a').click(function(){
      $(this).toggleClass('on');
      if($(this).hasClass('on')){
        $('.family-area .con').stop().fadeIn('fast');
      }else{
        $('.family-area .con').stop().fadeOut('fast');
      }
    });
  }
  ,searchjs: function() {
    $('.search_open').click(function(){
      $(this).toggleClass('on');
      if($(this).hasClass('on')){        
        $('.head_right').addClass('search_on');
        $('.search_box').stop().fadeIn('fast');

      }else{
        $('.head_right').removeClass('search_on');
        $('.search_box').stop().fadeOut('fast');
      }
    });
  }
  ,navdesc: function(){
    var tabBtn = $('.full_nav .sec_nav li a')
    $('.sec_desc li').eq(0).addClass('on');
    $(tabBtn).on('mouseover',function(){
      tabHref = $(this).attr('class');
     // console.log(tabHref);
      $('.sec_desc li').removeClass('on');
      $('#'+tabHref).addClass('on');
    });
  }
  ,newsletter: function() {

    if ($(window).width() < 640){
      $(window).ready(function () {
        $('.news_btn').addClass('on');
      });
    }
    $('.news_btn').find('a').click(function(){
      $('.news_btn').toggleClass('on');
      if($('.news_btn').hasClass('on')){
        $('.news_con').addClass('active')//.stop().fadeIn('fast');
      }else{
        $('.news_con').removeClass('active')//.stop().fadeOut('fast');
      }
    });
  }
}



var qnaFun = {
  init: function() {
    this.q();
  },
  q: function() {
    var qna = $('.qna'),
      header = qna.find('.qna-header'),
      header_a = qna.find('.qna-header a'),
      body = qna.find('.qna-body'),
      faq_chk = '';
    body.hide();
    header.on('click', function(event) {
      event.preventDefault();
      header.removeClass('select');
      header_a.removeClass('select'); //오른쪽 화살표 없애기
      body.slideUp(200);
      if (faq_chk != $(this).text()) {
        faq_chk = $(this).text();
        $(this).addClass('select');
        $(this).children('a').addClass('select'); //오른쪽 화살표 생기기
        $(this).next('.qna-body').slideDown(200);
      } else {
        faq_chk = '';
      }
    });
  }
};

(function(){
  'use strict';
  $('.popup_link').magnificPopup({
    type: 'ajax',
    removalDelay: 300,
    mainClass: 'mfp-fade'
  });
})();
  function closePopup() {
    $.magnificPopup.close();
  }

$(document).ready(function(){	
	wow.init(); 
	wowrap.init(); 
  navFun.init(); 
// navMobile.init(); 
	tabFun.init(); 
  SlickSlider.init(); 
  mainScroll.init(); 
  subFun.init(); 
  // menuTab.init(); 
  qnaFun.init(); 
  btnFun.init();

  if($(window).width()>1024){
    $(".start_pop").draggable({
      handle: ".modal-header"
    });
  }
  function file_upload(){
    var tmp = $(this).val();
    $(this).siblings('p').text(tmp);
  };
  $('.file_box input').change(file_upload);
    



});

function head(){
  if ($(this).scrollTop() > 100) { //752 서브비주얼사이즈
    $('#header').addClass('fix');
  }else{
    $('#header').removeClass('fix');
  } 
}

$(window).scroll(function () { head();});
$(window).ready(function () { head();});

  var lastScrollTop = 0;
$(window).scroll(function(event){
  var st = $(this).scrollTop();
  if (st < lastScrollTop){
    $('#header').addClass('up');
  } else {
    $('#header').removeClass('up');
  }
  lastScrollTop = st;
});


// $(window).on('scroll', function(){
//   var currentPercentage = ($(window).scrollTop() / ($(document).outerHeight() - $(window).height())) * 100;
//   $('.progress_bar .now').height(currentPercentage+'%');
// });


/*
2019-02-15 banghg

//SMOOTHSCROLL PLUGIN-------------------------------------------------------------------  
if (navigator.appVersion.indexOf("Win")!=-1) {
	// SmoothScroll for websites v1.2.1
	// Licensed under the terms of the MIT license.
	// People involved
	//  - Balazs Galambosi (maintainer)  
	//  - Michael Herf     (Pulse Algorithm)
!function(){function e(){var e=!1;e&&c("keydown",o),g.keyboardSupport&&!e&&u("keydown",o)}function t(){if(document.body){var t=document.body,r=document.documentElement,a=window.innerHeight,o=t.scrollHeight;if(x=document.compatMode.indexOf("CSS")>=0?r:t,w=t,e(),S=!0,top!=self)y=!0;else if(o>a&&(t.offsetHeight<=a||r.offsetHeight<=a)&&(r.style.height="auto",x.offsetHeight<=a)){var n=document.createElement("div");n.style.clear="both",t.appendChild(n)}g.fixedBackground||b||(t.style.backgroundAttachment="scroll",r.style.backgroundAttachment="scroll")}}function r(e,t,r,a){if(a||(a=1e3),d(t,r),1!=g.accelerationMax){var o=+new Date,n=o-T;if(n<g.accelerationDelta){var i=(1+30/n)/2;i>1&&(i=Math.min(i,g.accelerationMax),t*=i,r*=i)}T=+new Date}if(M.push({x:t,y:r,lastX:0>t?.99:-.99,lastY:0>r?.99:-.99,start:+new Date}),!C){var l=e===document.body,u=function(){for(var o=+new Date,n=0,i=0,c=0;c<M.length;c++){var s=M[c],d=o-s.start,f=d>=g.animationTime,p=f?1:d/g.animationTime;g.pulseAlgorithm&&(p=h(p));var m=s.x*p-s.lastX>>0,w=s.y*p-s.lastY>>0;n+=m,i+=w,s.lastX+=m,s.lastY+=w,f&&(M.splice(c,1),c--)}l?window.scrollBy(n,i):(n&&(e.scrollLeft+=n),i&&(e.scrollTop+=i)),t||r||(M=[]),M.length?E(u,e,a/g.frameRate+1):C=!1};E(u,e,0),C=!0}}function a(e){S||t();var a=e.target,o=l(a);if(!o||e.defaultPrevented||s(w,"embed")||s(a,"embed")&&/\.pdf/i.test(a.src))return!0;var n=e.wheelDeltaX||0,i=e.wheelDeltaY||0;return n||i||(i=e.wheelDelta||0),!g.touchpadSupport&&f(i)?!0:(Math.abs(n)>1.2&&(n*=g.stepSize/120),Math.abs(i)>1.2&&(i*=g.stepSize/120),r(o,-n,-i),void e.preventDefault())}function o(e){var t=e.target,a=e.ctrlKey||e.altKey||e.metaKey||e.shiftKey&&e.keyCode!==H.spacebar;if(/input|textarea|select|embed/i.test(t.nodeName)||t.isContentEditable||e.defaultPrevented||a)return!0;if(s(t,"button")&&e.keyCode===H.spacebar)return!0;var o,n=0,i=0,u=l(w),c=u.clientHeight;switch(u==document.body&&(c=window.innerHeight),e.keyCode){case H.up:i=-g.arrowScroll;break;case H.down:i=g.arrowScroll;break;case H.spacebar:o=e.shiftKey?1:-1,i=-o*c*.9;break;case H.pageup:i=.9*-c;break;case H.pagedown:i=.9*c;break;case H.home:i=-u.scrollTop;break;case H.end:var d=u.scrollHeight-u.scrollTop-c;i=d>0?d+10:0;break;case H.left:n=-g.arrowScroll;break;case H.right:n=g.arrowScroll;break;default:return!0}r(u,n,i),e.preventDefault()}function n(e){w=e.target}function i(e,t){for(var r=e.length;r--;)z[N(e[r])]=t;return t}function l(e){var t=[],r=x.scrollHeight;do{var a=z[N(e)];if(a)return i(t,a);if(t.push(e),r===e.scrollHeight){if(!y||x.clientHeight+10<r)return i(t,document.body)}else if(e.clientHeight+10<e.scrollHeight&&(overflow=getComputedStyle(e,"").getPropertyValue("overflow-y"),"scroll"===overflow||"auto"===overflow))return i(t,e)}while(e=e.parentNode)}function u(e,t,r){window.addEventListener(e,t,r||!1)}function c(e,t,r){window.removeEventListener(e,t,r||!1)}function s(e,t){return(e.nodeName||"").toLowerCase()===t.toLowerCase()}function d(e,t){e=e>0?1:-1,t=t>0?1:-1,(k.x!==e||k.y!==t)&&(k.x=e,k.y=t,M=[],T=0)}function f(e){if(e){e=Math.abs(e),D.push(e),D.shift(),clearTimeout(A);var t=D[0]==D[1]&&D[1]==D[2],r=p(D[0],120)&&p(D[1],120)&&p(D[2],120);return!(t||r)}}function p(e,t){return Math.floor(e/t)==e/t}function m(e){var t,r,a;return e*=g.pulseScale,1>e?t=e-(1-Math.exp(-e)):(r=Math.exp(-1),e-=1,a=1-Math.exp(-e),t=r+a*(1-r)),t*g.pulseNormalize}function h(e){return e>=1?1:0>=e?0:(1==g.pulseNormalize&&(g.pulseNormalize/=m(1)),m(e))}var w,v={frameRate:150,animationTime:500,stepSize:150,pulseAlgorithm:!0,pulseScale:6,pulseNormalize:1,accelerationDelta:20,accelerationMax:1,keyboardSupport:!0,arrowScroll:50,touchpadSupport:!0,fixedBackground:!0,excluded:""},g=v,b=!1,y=!1,k={x:0,y:0},S=!1,x=document.documentElement,D=[120,120,120],H={left:37,up:38,right:39,down:40,spacebar:32,pageup:33,pagedown:34,end:35,home:36},g=v,M=[],C=!1,T=+new Date,z={};setInterval(function(){z={}},1e4);var A,N=function(){var e=0;return function(t){return t.uniqueID||(t.uniqueID=e++)}}(),E=function(){return window.requestAnimationFrame||window.webkitRequestAnimationFrame||function(e,t,r){window.setTimeout(e,r||1e3/60)}}(),K=/chrome/i.test(window.navigator.userAgent),L="onmousewheel"in document;L&&K&&(u("mousedown",n),u("mousewheel",a),u("load",t))}();
};
//SMOOTHSCROLL END-------------------------------------------------
*/

var magnificPop = {
  init: function() {
    this.pop_03(); //ajax 팝업 픽스
  },
  pop_03: function() {
    $('.popup_link_store').magnificPopup({
      type: 'ajax',
      closeOnBgClick: false,
      callbacks: {
        ajaxContentAdded: function() {
			$('.store_img_slick .slick').slick({    
			  autoplay: false,
			  autoplaySpeed: 5000,
			  fade: true,
			  dots: true,
			  pauseOnHover    : false,
			  focusOnSelect   : true,
			  pauseOnDotsHover: false,
			  arrows: true,
			  prevArrow : '<i class="sa_l op_l"><img src="../images/arrow/cirw_l.png"></i>',
			  nextArrow : '<i class="sa_r op_r"><img src="../images/arrow/cirw_r.png"></i>',
			});
        },
        open: function() {
        },
        close: function() {
        }
      }
    }, 500);
  },
};
$(document).ready(function() {
  magnificPop.init();
});