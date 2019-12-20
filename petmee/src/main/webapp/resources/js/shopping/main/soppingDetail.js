
/**
* --------------------------------
* FUNCTION JS
* --------------------------------
*/
/*-----------------------  product su chek----------------- */
			var sell_price;
			var amount;
			var subA;
			var subB;
			var inputNumber = document.getElementById('#proinput');
			var big;
			var smallImgs;
			var bigImg;
			var smallImgThumb;
			
			function init () {
				
				big = document.getElementById('bigImg');
				smallImgs= document.getElementById('smallImgs');
				bigImg = big.getElementsByTagName('img')[0];
				smallImgThumb = smallImgs.getElementsByTagName('img');
				for(var i = 0; i<smallImgThumb.length; i++){
					smallImgThumb[i].onmouseover = function(){
						bigImg.src=this.src;
					}
				}
				
				sell_price = document.form.sell_price.value;
				amount = document.form.amount.value;
				sum.value = inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				document.form.sum.value = sell_price;
				document.form.sum1.value = sell_price;
				change();
			
			}
			
			function add () {
				hm = document.form.amount;
				sum = document.form.sum;
				hm.value ++ ;
				hm1 = document.form.subA;
				sum1 = document.form.sum1;
				hm1.value ++ ;
				hm2 = document.form.subB;
				hm2.value ++ ;
				sum.value = (parseInt(hm1.value) * sell_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				sum1.value = parseInt(hm1.value) * sell_price;
				
			}
			
			function del () {
				hm = document.form.amount;
				sum = document.form.sum;
				hm1 = document.form.subA;
				sum1 = document.form.sum1;
				hm2 = document.form.subB;
					if (hm.value > 1) {
						hm.value -- ;
						sum.value = parseInt(hm.value) * sell_price;
					}
					if (hm1.value > 1) {
						hm1.value -- ;
						sum1.value = parseInt(hm1.value) * sell_price;
					}
					if (hm2.value > 1) {
						hm2.value -- ;
					}
					sum.value = (parseInt(hm1.value) * sell_price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			function change () {
				hm = document.form.amount;
				sum = document.form.sum;
				hm1 = document.form.subA;
				sum1 = document.form.sum1;
				hm2 = document.form.subB;
				sum2 = document.form.sum2;
			
					if (hm.value < 0) {
						hm.value = 0;
					}
					if (hm1.vaue < 0) {
						hm1.value = 0;
					}
					if (hm2.vaue < 0) {
						hm2.value = 0;
					}
				sum.value = inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				sum1.value = parseInt(hm1.value) * sell_price;
				sum2.value = parseInt(hm1.value) * sell_price;
			}  
/*-----------------------  product su chek end----------------- */
			
/*-------------------------proudct price check----------------- */			

			
/*-------------------------proudct price check end----------------- */			

var fn = (function() {
    return {
		
		//말줄임 처리
		ellipsis: function(obj) {
			$(obj).each(function() {
				var obj = $(this),
					tempTxt = obj.text(),
					tempTxtArr = tempTxt.split(''),
					tempTxtLen = tempTxt.length,
					ellipsisTxt = '',
					ellipsisTxtLen;

				obj.empty();
				obj.append('<div></div>');

				for (var i = 0; i <= tempTxtLen - 1; i++) {
					if (obj.height() >= obj.children().height()) {
						ellipsisTxt += tempTxtArr[i];
						obj.children().text(ellipsisTxt);
					}
				}

				if (obj.height() < obj.children().height()) {
					ellipsisTxtLen = ellipsisTxt.length;
					ellipsisTxt = ellipsisTxt.substr(0, ellipsisTxtLen - 5);
					ellipsisTxt += '...';
				}

				obj.empty();
				obj.text(ellipsisTxt);
			});
		},

		//selectbox
		selectboxDropdowns : function(){
			$('select').each(function(i, select){
				if (!$(this).next().hasClass('dropdown')){
					$(this).after('<div class="dropdown ' + ($(this).attr('class') || '') + '" tabindex="0"><span class="current"></span><div class="list"><ul></ul></div></div>');
					var dropdown = $(this).next();
					var options = $(select).find('option');
					var selected = $(this).find('option:selected');
					var disabled = $(this).find('option:disabled');
					if ( selected.attr("data-color") ){
						dropdown.find('.current').html('<img src="' + selected.attr("data-color") + '" alt="">' + selected.text());
					}else{
						dropdown.find('.current').html(selected.data('display-text') || selected.text());
					}
					options.each(function(j, o){
						var display = $(o).data('display-text') || '';
						if ( $(o).attr("data-color") ){
							dropdown.find('ul').append('<li class="option ' + ($(o).is(':selected') ? 'selected' :'')  + ($(o).is(':disabled') ? 'disabled' :'') + '" data-value="' + $(o).val() + '" data-display-text="' + display + '"><img src="' + $(o).attr("data-color") + '" alt="">' + $(o).text() + '</li>');
						}else{
							dropdown.find('ul').append('<li class="option ' + ($(o).is(':selected') ? 'selected' :'')  + ($(o).is(':disabled') ? 'disabled' :'') + '" data-value="' + $(o).val() + '" data-display-text="' + display + '">' + $(o).text() + '</li>');
						}
					});
				}
			});
		},
    }
})();

/**
* --------------------------------
* MonamiMall JS
* --------------------------------
* header tab menu
*/

$(document).ready(function(){
	
	//path
	var path1 = $("body").attr("class");
	var path2 = $("#wrap").attr("class");
	var path3 = $("#contents").attr("class");

	//header allmenu click
	var allmenuhei = $("#header .allmenu .inner").height();
	var allmenuouterhei = $("#header .allmenu .inner").outerHeight();
	var allmenugap = $("#header .allmenu .inner").outerHeight() - $("#header .allmenu .inner").height();
	$("#header .btn-allmenu").on("click", function(e){
		e.preventDefault();
		var $this = $(this);
		if ( $this.hasClass("active") ){
			setTimeout(function(){
				$this.addClass("out").removeClass("active");
			}, 300);
			$("#header .allmenu").removeClass("active");
			$("#header .allmenu .cont").attr({'style':''});
		}else{
			setTimeout(function(){
				$this.removeClass("out").addClass("active");
			}, 300);
			$("#header .allmenu").addClass("active");
			allmenuhei = $("#header .allmenu .inner").height();
			allmenuouterhei = $("#header .allmenu .inner").outerHeight();
			allmenugap = $("#header .allmenu .inner").outerHeight() - $("#header .allmenu .inner").height();
			allMenuResize();
			if($("#header .allmenu .cont").height()<=10){
				$("#header .allmenu .cont").attr({'style':''});
				setTimeout(function(){
					allmenuhei = $("#header .allmenu .inner").height();
					allmenuouterhei = $("#header .allmenu .inner").outerHeight();
					allmenugap = $("#header .allmenu .inner").outerHeight() - $("#header .allmenu .inner").height();
					allMenuResize();
				},300);
			}
		}
	});



	//header nav over
	var headerst = 0;
	var headerover = false;

	$(window).scroll(function(event){
		headerScroll();
	});
	setTimeout(function(){
		headerScroll();
	}, 0);
	function headerScroll(){
		headerst = $(this).scrollTop();
		if ( headerst < 100 ){
			if ( path2 == "main" && headerst < 100 && headerover == false ){
				$("#header").removeClass("active");
			}
		}else{
			$("#header").addClass("active");
		}
		$("#header").fadeIn(200);
		$('#header').css({'transition':'0s'});
	}
	
	

	//sub
	if ( path2 == "sub" ){
		//location
		setTimeout(function(){
			$(".location > ul > li .dropdown .list").each(function(){
				$(this).width($(this).find("ul").width());
			});
		}, 500);
		//상품상세
		if ( path3 == "goods detail" ){
			
			//pic, tabs, bottombuybtn 고정
			$(window).scroll(function(event){
				detailProinfoScroll();
				detailTabsScroll();
				detailbuybtnScroll();
			});
			var proinfoTop;
			var tabsTop;
			var buybtnTop;
			if($('.pdetail .tabs').length){
				setTimeout(function(){
					proinfoTop = $(".goods.detail .product .proinfo").outerHeight()-$(".goods.detail .product .propic").outerHeight();
					tabsTop = $(".goods.detail .pdetail .tabs").offset().top - $("#header").outerHeight();
					buybtnTop = $(".goods.detail .product .proinfo .btn-area").offset().top + $(".goods.detail .product .proinfo .btn-area").outerHeight() - $("#header").outerHeight();
					detailProinfoScroll();
					detailTabsScroll();
					detailbuybtnScroll();
				}, 100);
			}
			//pic scroll
			function detailProinfoScroll(){
				var st = $(this).scrollTop();
				if ( st < proinfoTop ){
					$(".goods.detail .product .propic").css({"position":"fixed", "top":"150px"});
					if($(window).width()<1280){
						$(".goods.detail .product .propic").css({'margin-left':-$(window).scrollLeft() + 'px'});
					}else{
						$(".goods.detail .product .propic").css({'margin-left':0});
					}
				}else{
					$(".goods.detail .product .propic").css({"position":"absolute", "top":+(proinfoTop+parseInt($(".goods.detail .product").css('padding-top')))+"px"});
					$(".goods.detail .product .propic").css({"margin-left":0});
				}
			}
			//tabs scroll
			function detailTabsScroll(){
				var st = $(this).scrollTop();
				$(".goods.detail .pdetail .tabs ul li").eq(0).addClass("active");

				if ( $(".goods.detail .pdetail > div").hasClass("review") ){
					var reviewTop = $(".goods.detail .pdetail .review").offset().top - $("#header").outerHeight() - $(".goods.detail .pdetail .tabs").outerHeight() - parseInt($(".goods.detail .pdetail .review").css('margin-top'));
					var reviewBottom = reviewTop + $(".goods.detail .pdetail .review").outerHeight() + $("#header").outerHeight() + $(".goods.detail .pdetail .tabs").outerHeight();
					if ( reviewTop <= st && reviewBottom > st ){
						$(".goods.detail .pdetail .tabs ul li").removeClass("active");
						$(".goods.detail .pdetail .tabs ul li.m-review").addClass("active");
					}
				}
				if ( $(".goods.detail .pdetail > div").hasClass("storypick") ){
					var storypickTop = $(".goods.detail .pdetail .storypick").offset().top - $("#header").outerHeight() - $(".goods.detail .pdetail .tabs").outerHeight() - parseInt($(".goods.detail .pdetail .storypick").css('margin-top'));
					var storypickBottom = storypickTop + $(".goods.detail .pdetail .storypick").outerHeight() + $("#header").outerHeight() + $(".goods.detail .pdetail .tabs").outerHeight();
					if ( storypickTop <= st && storypickBottom > st ){
						$(".goods.detail .pdetail .tabs ul li").removeClass("active");
						$(".goods.detail .pdetail .tabs ul li.m-storypick").addClass("active");
					}
					if ( returninfoBottom <= st ){
						$(".goods.detail .pdetail .tabs ul li").removeClass("active");
					}
				}
				if ( $(".goods.detail .pdetail > div").hasClass("detailinfo") ){
					var detailinfoTop = $(".goods.detail .pdetail .detailinfo").offset().top - $("#header").outerHeight() - $(".goods.detail .pdetail .tabs").outerHeight() - parseInt($(".goods.detail .pdetail .detailinfo").css('margin-top'));
					var detailinfoBottom = detailinfoTop + $(".goods.detail .pdetail .detailinfo").outerHeight() + $("#header").outerHeight() + $(".goods.detail .pdetail .tabs").outerHeight();
					if ( detailinfoTop <= st && detailinfoBottom > st ){
						$(".goods.detail .pdetail .tabs ul li").removeClass("active");
						$(".goods.detail .pdetail .tabs ul li.m-detailinfo").addClass("active");
					}
				}
				if ( $(".goods.detail .pdetail > div").hasClass("returninfo") ){
					var returninfoTop = $(".goods.detail .pdetail .returninfo").offset().top - $("#header").outerHeight() - $(".goods.detail .pdetail .tabs").outerHeight() - parseInt($(".goods.detail .pdetail .returninfo").css('margin-top'));
					var returninfoBottom = returninfoTop + $(".goods.detail .pdetail .returninfo").outerHeight() + $("#header").outerHeight() + $(".goods.detail .pdetail .tabs").outerHeight();
					if ( returninfoTop <= st && returninfoBottom > st ){
						$(".goods.detail .pdetail .tabs ul li").removeClass("active");
						$(".goods.detail .pdetail .tabs ul li.m-returninfo").addClass("active");
					}
				}
				if ( tabsTop < st ){
					if($('body').hasClass('ezwel-mode')){
						$(".goods.detail .pdetail .tabs").css({"position":"fixed", "top":"0px", "left":"50%", "transform":"translateX(-50%)"});
					}else{
						$(".goods.detail .pdetail .tabs").css({"position":"fixed", "top":+($("#header").outerHeight())+"px", "left":"50%", "transform":"translateX(-50%)"});
					}
				}else{
					$(".goods.detail .pdetail .tabs").css({"position":"absolute", "top":"0", "left":"0", "transform":"translateX(0)"});
				}
			}
			//tabs click
			$(".goods.detail .pdetail .tabs ul li").click(function(){
				var classname = $(this).attr("class").replace("active", "").replace("m-", "").trim();
				var tp = $(".goods.detail .pdetail ."+classname).offset().top - $("#header").outerHeight() - $(".goods.detail .pdetail .tabs").outerHeight();
				var tp2 = $(".goods.detail .pdetail ."+classname).offset().top - $(".goods.detail .pdetail .tabs").outerHeight();
				if($('body').hasClass('ezwel-mode')){
					$("html, body").animate({"scrollTop":+(tp2)+"px"}, 400);
				}else{
					$("html, body").animate({"scrollTop":+(tp-40)+"px"}, 400);
				}
			});
			function detailbuybtnScroll(){
				var st = $(this).scrollTop();
				if ( buybtnTop <= st ){
					$(".goods.detail .bottombuybtn").stop().animate({"bottom":"0"}, 200);
				}else{
					$(".goods.detail .bottombuybtn").stop().animate({"bottom":+(-$(".goods.detail .bottombuybtn").height()-$(".goods.detail .bottombuybtn .bbuybtn .btn-area").height())+"px"}, 200);
				}
			}
		}
	}
});

