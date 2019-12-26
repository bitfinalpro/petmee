/*! Magnific Popup - v1.1.0 - 2016-02-20
* http://dimsemenov.com/plugins/magnific-popup/
* Copyright (c) 2016 Dmitry Semenov; */
;(function (factory) { 
if (typeof define === 'function' && define.amd) { 
 // AMD. Register as an anonymous module. 
 define(['jquery'], factory); 
 } else if (typeof exports === 'object') { 
 // Node/CommonJS 
 factory(require('jquery')); 
 } else { 
 // Browser globals 
 factory(window.jQuery || window.Zepto); 
 } 
 }(function($) { 

/*>>core*/
/**
 * 
 * Magnific Popup Core JS file
 * 
 */


/**
 * Private static constants
 */
var CLOSE_EVENT = 'Close',
	BEFORE_CLOSE_EVENT = 'BeforeClose',
	AFTER_CLOSE_EVENT = 'AfterClose',
	BEFORE_APPEND_EVENT = 'BeforeAppend',
	MARKUP_PARSE_EVENT = 'MarkupParse',
	OPEN_EVENT = 'Open',
	CHANGE_EVENT = 'Change',
	NS = 'mdp',
	EVENT_NS = '.' + NS,
	READY_CLASS = 'mdp-ready',
	REMOVING_CLASS = 'mdp-removing',
	PREVENT_CLOSE_CLASS = 'mdp-prevent-close';


/**
 * Private vars 
 */
/*jshint -W079 */
var mdp, // As we have only one instance of MagnificPopup object, we define it locally to not to use 'this'
	MagnificPopup = function(){},
	_isJQ = !!(window.jQuery),
	_prevStatus,
	_window = $(window),
	_document,
	_prevContentType,
	_wrapClasses,
	_currPopupType;


/**
 * Private functions
 */
var _mdpOn = function(name, f) {
		mdp.ev.on(NS + name + EVENT_NS, f);
	},
	_getEl = function(className, appendTo, html, raw) {
		var el = document.createElement('div');
		el.className = 'mdp-'+className;
		if(html) {
			el.innerHTML = html;
		}
		if(!raw) {
			el = $(el);
			if(appendTo) {
				el.appendTo(appendTo);
			}
		} else if(appendTo) {
			appendTo.appendChild(el);
		}
		return el;
	},
	_mdpTrigger = function(e, data) {
		mdp.ev.triggerHandler(NS + e, data);

		if(mdp.st.callbacks) {
			// converts "mdpEventName" to "eventName" callback and triggers it if it's present
			e = e.charAt(0).toLowerCase() + e.slice(1);
			if(mdp.st.callbacks[e]) {
				mdp.st.callbacks[e].apply(mdp, $.isArray(data) ? data : [data]);
			}
		}
	},
	_getCloseBtn = function(type) {
		if(type !== _currPopupType || !mdp.currTemplate.closeBtn) {
			mdp.currTemplate.closeBtn = $( mdp.st.closeMarkup.replace('%title%', mdp.st.tClose ) );
			_currPopupType = type;
		}
		return mdp.currTemplate.closeBtn;
	},
	// Initialize Magnific Popup only when called at least once
	_checkInstance = function() {
		if(!$.magnificPopup.instance) {
			/*jshint -W020 */
			mdp = new MagnificPopup();
			mdp.init();
			$.magnificPopup.instance = mdp;
		}
	},
	// CSS transition detection, http://stackoverflow.com/questions/7264899/detect-css-transitions-using-javascript-and-without-modernizr
	supportsTransitions = function() {
		var s = document.createElement('p').style, // 's' for style. better to create an element if body yet to exist
			v = ['ms','O','Moz','Webkit']; // 'v' for vendor

		if( s['transition'] !== undefined ) {
			return true; 
		}
			
		while( v.length ) {
			if( v.pop() + 'Transition' in s ) {
				return true;
			}
		}
				
		return false;
	};



/**
 * Public functions
 */
MagnificPopup.prototype = {

	constructor: MagnificPopup,

	/**
	 * Initializes Magnific Popup plugin. 
	 * This function is triggered only once when $.fn.magnificPopup or $.magnificPopup is executed
	 */
	init: function() {
		var appVersion = navigator.appVersion;
		mdp.isLowIE = mdp.isIE8 = document.all && !document.addEventListener;
		mdp.isAndroid = (/android/gi).test(appVersion);
		mdp.isIOS = (/iphone|ipad|ipod/gi).test(appVersion);
		mdp.supportsTransition = supportsTransitions();

		// We disable fixed positioned lightbox on devices that don't handle it nicely.
		// If you know a better way of detecting this - let me know.
		mdp.probablyMobile = (mdp.isAndroid || mdp.isIOS || /(Opera Mini)|Kindle|webOS|BlackBerry|(Opera Mobi)|(Windows Phone)|IEMobile/i.test(navigator.userAgent) );
		_document = $(document);

		mdp.popupsCache = {};
	},

	/**
	 * Opens popup
	 * @param  data [description]
	 */
	open: function(data) {

		var i;

		if(data.isObj === false) { 
			// convert jQuery collection to array to avoid conflicts later
			mdp.items = data.items.toArray();

			mdp.index = 0;
			var items = data.items,
				item;
			for(i = 0; i < items.length; i++) {
				item = items[i];
				if(item.parsed) {
					item = item.el[0];
				}
				if(item === data.el[0]) {
					mdp.index = i;
					break;
				}
			}
		} else {
			mdp.items = $.isArray(data.items) ? data.items : [data.items];
			mdp.index = data.index || 0;
		}

		// if popup is already opened - we just update the content
		if(mdp.isOpen) {
			mdp.updateItemHTML();
			return;
		}
		
		mdp.types = []; 
		_wrapClasses = '';
		if(data.mainEl && data.mainEl.length) {
			mdp.ev = data.mainEl.eq(0);
		} else {
			mdp.ev = _document;
		}

		if(data.key) {
			if(!mdp.popupsCache[data.key]) {
				mdp.popupsCache[data.key] = {};
			}
			mdp.currTemplate = mdp.popupsCache[data.key];
		} else {
			mdp.currTemplate = {};
		}



		mdp.st = $.extend(true, {}, $.magnificPopup.defaults, data ); 
		mdp.fixedContentPos = mdp.st.fixedContentPos === 'auto' ? !mdp.probablyMobile : mdp.st.fixedContentPos;

		if(mdp.st.modal) {
			mdp.st.closeOnContentClick = false;
			mdp.st.closeOnBgClick = false;
			mdp.st.showCloseBtn = false;
			mdp.st.enableEscapeKey = false;
		}
		

		// Building markup
		// main containers are created only once
		if(!mdp.bgOverlay) {

			// Dark overlay
			mdp.bgOverlay = _getEl('bg').on('click'+EVENT_NS, function() {
				mdp.close();
			});

			mdp.wrap = _getEl('wrap').attr('tabindex', -1).on('click'+EVENT_NS, function(e) {
				if(mdp._checkIfClose(e.target)) {
					mdp.close();
				}
			});

			mdp.container = _getEl('container', mdp.wrap);
		}

		mdp.contentContainer = _getEl('content');
		if(mdp.st.preloader) {
			mdp.preloader = _getEl('preloader', mdp.container, mdp.st.tLoading);
		}


		// Initializing modules
		var modules = $.magnificPopup.modules;
		for(i = 0; i < modules.length; i++) {
			var n = modules[i];
			n = n.charAt(0).toUpperCase() + n.slice(1);
			mdp['init'+n].call(mdp);
		}
		_mdpTrigger('BeforeOpen');


		if(mdp.st.showCloseBtn) {
			// Close button
			if(!mdp.st.closeBtnInside) {
				mdp.wrap.append( _getCloseBtn() );
			} else {
				_mdpOn(MARKUP_PARSE_EVENT, function(e, template, values, item) {
					values.close_replaceWith = _getCloseBtn(item.type);
				});
				_wrapClasses += ' mdp-close-btn-in';
			}
		}

		if(mdp.st.alignTop) {
			_wrapClasses += ' mdp-align-top';
		}

	

		if(mdp.fixedContentPos) {
			mdp.wrap.css({
				overflow: mdp.st.overflowY,
				overflowX: 'hidden',
				overflowY: mdp.st.overflowY
			});
		} else {
			mdp.wrap.css({ 
				top: _window.scrollTop(),
				position: 'absolute'
			});
		}
		if( mdp.st.fixedBgPos === false || (mdp.st.fixedBgPos === 'auto' && !mdp.fixedContentPos) ) {
			mdp.bgOverlay.css({
				height: _document.height(),
				position: 'absolute'
			});
		}

		

		if(mdp.st.enableEscapeKey) {
			// Close on ESC key
			_document.on('keyup' + EVENT_NS, function(e) {
				if(e.keyCode === 27) {
					mdp.close();
				}
			});
		}

		_window.on('resize' + EVENT_NS, function() {
			mdp.updateSize();
		});


		if(!mdp.st.closeOnContentClick) {
			_wrapClasses += ' mdp-auto-cursor';
		}
		
		if(_wrapClasses)
			mdp.wrap.addClass(_wrapClasses);


		// this triggers recalculation of layout, so we get it once to not to trigger twice
		var windowHeight = mdp.wH = _window.height();

		
		var windowStyles = {};

		if( mdp.fixedContentPos ) {
            if(mdp._hasScrollBar(windowHeight)){
                var s = mdp._getScrollbarSize();
                if(s) {
                    windowStyles.marginRight = s;
                }
            }
        }

		if(mdp.fixedContentPos) {
			if(!mdp.isIE7) {
				windowStyles.overflow = 'hidden';
			} else {
				// ie7 double-scroll bug
				$('body, html').css('overflow', 'hidden');
			}
		}

		
		
		var classesToadd = mdp.st.mainClass;
		if(mdp.isIE7) {
			classesToadd += ' mdp-ie7';
		}
		if(classesToadd) {
			mdp._addClassTomdp( classesToadd );
		}

		// add content
		mdp.updateItemHTML();

		_mdpTrigger('BuildControls');

		// remove scrollbar, add margin e.t.c
		$('html').css(windowStyles);
		
		// add everything to DOM
		mdp.bgOverlay.add(mdp.wrap).prependTo( mdp.st.prependTo || $(document.body) );

		// Save last focused element
		mdp._lastFocusedEl = document.activeElement;
		
		// Wait for next cycle to allow CSS transition
		setTimeout(function() {
			
			if(mdp.content) {
				mdp._addClassTomdp(READY_CLASS);
				mdp._setFocus();
			} else {
				// if content is not defined (not loaded e.t.c) we add class only for BG
				mdp.bgOverlay.addClass(READY_CLASS);
			}
			
			// Trap the focus in popup
			_document.on('focusin' + EVENT_NS, mdp._onFocusIn);

		}, 16);

		mdp.isOpen = true;
		mdp.updateSize(windowHeight);
		_mdpTrigger(OPEN_EVENT);

		return data;
	},

	/**
	 * Closes the popup
	 */
	close: function() {
		if(!mdp.isOpen) return;
		_mdpTrigger(BEFORE_CLOSE_EVENT);

		mdp.isOpen = false;
		// for CSS3 animation
		if(mdp.st.removalDelay && !mdp.isLowIE && mdp.supportsTransition )  {
			mdp._addClassTomdp(REMOVING_CLASS);
			setTimeout(function() {
				mdp._close();
			}, mdp.st.removalDelay);
		} else {
			mdp._close();
		}
	},

	/**
	 * Helper for close() function
	 */
	_close: function() {
		_mdpTrigger(CLOSE_EVENT);

		var classesToRemove = REMOVING_CLASS + ' ' + READY_CLASS + ' ';

		mdp.bgOverlay.detach();
		mdp.wrap.detach();
		mdp.container.empty();

		if(mdp.st.mainClass) {
			classesToRemove += mdp.st.mainClass + ' ';
		}

		mdp._removeClassFrommdp(classesToRemove);

		if(mdp.fixedContentPos) {
			var windowStyles = {marginRight: ''};
			if(mdp.isIE7) {
				$('body, html').css('overflow', '');
			} else {
				windowStyles.overflow = '';
			}
			$('html').css(windowStyles);
		}
		
		_document.off('keyup' + EVENT_NS + ' focusin' + EVENT_NS);
		mdp.ev.off(EVENT_NS);

		// clean up DOM elements that aren't removed
		mdp.wrap.attr('class', 'mdp-wrap').removeAttr('style');
		mdp.bgOverlay.attr('class', 'mdp-bg');
		mdp.container.attr('class', 'mdp-container');

		// remove close button from target element
		if(mdp.st.showCloseBtn &&
		(!mdp.st.closeBtnInside || mdp.currTemplate[mdp.currItem.type] === true)) {
			if(mdp.currTemplate.closeBtn)
				mdp.currTemplate.closeBtn.detach();
		}


		if(mdp.st.autoFocusLast && mdp._lastFocusedEl) {
			$(mdp._lastFocusedEl).focus(); // put tab focus back
		}
		mdp.currItem = null;	
		mdp.content = null;
		mdp.currTemplate = null;
		mdp.prevHeight = 0;

		_mdpTrigger(AFTER_CLOSE_EVENT);
	},
	
	updateSize: function(winHeight) {

		if(mdp.isIOS) {
			// fixes iOS nav bars https://github.com/dimsemenov/Magnific-Popup/issues/2
			var zoomLevel = document.documentElement.clientWidth / window.innerWidth;
			var height = window.innerHeight * zoomLevel;
			mdp.wrap.css('height', height);
			mdp.wH = height;
		} else {
			mdp.wH = winHeight || _window.height();
		}
		// Fixes #84: popup incorrectly positioned with position:relative on body
		if(!mdp.fixedContentPos) {
			mdp.wrap.css('height', mdp.wH);
		}

		_mdpTrigger('Resize');

	},

	/**
	 * Set content of popup based on current index
	 */
	updateItemHTML: function() {
		var item = mdp.items[mdp.index];

		// Detach and perform modifications
		mdp.contentContainer.detach();

		if(mdp.content)
			mdp.content.detach();

		if(!item.parsed) {
			item = mdp.parseEl( mdp.index );
		}

		var type = item.type;

		_mdpTrigger('BeforeChange', [mdp.currItem ? mdp.currItem.type : '', type]);
		// BeforeChange event works like so:
		// _mdpOn('BeforeChange', function(e, prevType, newType) { });

		mdp.currItem = item;

		if(!mdp.currTemplate[type]) {
			var markup = mdp.st[type] ? mdp.st[type].markup : false;

			// allows to modify markup
			_mdpTrigger('FirstMarkupParse', markup);

			if(markup) {
				mdp.currTemplate[type] = $(markup);
			} else {
				// if there is no markup found we just define that template is parsed
				mdp.currTemplate[type] = true;
			}
		}

		if(_prevContentType && _prevContentType !== item.type) {
			mdp.container.removeClass('mdp-'+_prevContentType+'-holder');
		}

		var newContent = mdp['get' + type.charAt(0).toUpperCase() + type.slice(1)](item, mdp.currTemplate[type]);
		mdp.appendContent(newContent, type);

		item.preloaded = true;

		_mdpTrigger(CHANGE_EVENT, item);
		_prevContentType = item.type;

		// Append container back after its content changed
		mdp.container.prepend(mdp.contentContainer);

		_mdpTrigger('AfterChange');
	},


	/**
	 * Set HTML content of popup
	 */
	appendContent: function(newContent, type) {
		mdp.content = newContent;

		if(newContent) {
			if(mdp.st.showCloseBtn && mdp.st.closeBtnInside &&
				mdp.currTemplate[type] === true) {
				// if there is no markup, we just append close button element inside
				if(!mdp.content.find('.mdp-close').length) {
					mdp.content.append(_getCloseBtn());
				}
			} else {
				mdp.content = newContent;
			}
		} else {
			mdp.content = '';
		}

		_mdpTrigger(BEFORE_APPEND_EVENT);
		mdp.container.addClass('mdp-'+type+'-holder');

		mdp.contentContainer.append(mdp.content);
	},


	/**
	 * Creates Magnific Popup data object based on given data
	 * @param  {int} index Index of item to parse
	 */
	parseEl: function(index) {
		var item = mdp.items[index],
			type;

		if(item.tagName) {
			item = { el: $(item) };
		} else {
			type = item.type;
			item = { data: item, src: item.src };
		}

		if(item.el) {
			var types = mdp.types;

			// check for 'mdp-TYPE' class
			for(var i = 0; i < types.length; i++) {
				if( item.el.hasClass('mdp-'+types[i]) ) {
					type = types[i];
					break;
				}
			}

			item.src = item.el.attr('data-mdp-src');
			if(!item.src) {
				item.src = item.el.attr('href');
			}
		}

		item.type = type || mdp.st.type || 'inline';
		item.index = index;
		item.parsed = true;
		mdp.items[index] = item;
		_mdpTrigger('ElementParse', item);

		return mdp.items[index];
	},


	/**
	 * Initializes single popup or a group of popups
	 */
	addGroup: function(el, options) {
		var eHandler = function(e) {
			e.mdpEl = this;
			mdp._openClick(e, el, options);
		};

		if(!options) {
			options = {};
		}

		var eName = 'click.magnificPopup';
		options.mainEl = el;

		if(options.items) {
			options.isObj = true;
			el.off(eName).on(eName, eHandler);
		} else {
			options.isObj = false;
			if(options.delegate) {
				el.off(eName).on(eName, options.delegate , eHandler);
			} else {
				options.items = el;
				el.off(eName).on(eName, eHandler);
			}
		}
	},
	_openClick: function(e, el, options) {
		var midClick = options.midClick !== undefined ? options.midClick : $.magnificPopup.defaults.midClick;


		if(!midClick && ( e.which === 2 || e.ctrlKey || e.metaKey || e.altKey || e.shiftKey ) ) {
			return;
		}

		var disableOn = options.disableOn !== undefined ? options.disableOn : $.magnificPopup.defaults.disableOn;

		if(disableOn) {
			if($.isFunction(disableOn)) {
				if( !disableOn.call(mdp) ) {
					return true;
				}
			} else { // else it's number
				if( _window.width() < disableOn ) {
					return true;
				}
			}
		}

		if(e.type) {
			e.preventDefault();

			// This will prevent popup from closing if element is inside and popup is already opened
			if(mdp.isOpen) {
				e.stopPropagation();
			}
		}

		options.el = $(e.mdpEl);
		if(options.delegate) {
			options.items = el.find(options.delegate);
		}
		mdp.open(options);
	},


	/**
	 * Updates text on preloader
	 */
	updateStatus: function(status, text) {

		if(mdp.preloader) {
			if(_prevStatus !== status) {
				mdp.container.removeClass('mdp-s-'+_prevStatus);
			}

			if(!text && status === 'loading') {
				text = mdp.st.tLoading;
			}

			var data = {
				status: status,
				text: text
			};
			// allows to modify status
			_mdpTrigger('UpdateStatus', data);

			status = data.status;
			text = data.text;

			mdp.preloader.html(text);

			mdp.preloader.find('a').on('click', function(e) {
				e.stopImmediatePropagation();
			});

			mdp.container.addClass('mdp-s-'+status);
			_prevStatus = status;
		}
	},


	/*
		"Private" helpers that aren't private at all
	 */
	// Check to close popup or not
	// "target" is an element that was clicked
	_checkIfClose: function(target) {

		if($(target).hasClass(PREVENT_CLOSE_CLASS)) {
			return;
		}

		var closeOnContent = mdp.st.closeOnContentClick;
		var closeOnBg = mdp.st.closeOnBgClick;

		if(closeOnContent && closeOnBg) {
			return true;
		} else {

			// We close the popup if click is on close button or on preloader. Or if there is no content.
			if(!mdp.content || $(target).hasClass('mdp-close') || (mdp.preloader && target === mdp.preloader[0]) ) {
				return true;
			}

			// if click is outside the content
			if(  (target !== mdp.content[0] && !$.contains(mdp.content[0], target))  ) {
				if(closeOnBg) {
					// last check, if the clicked element is in DOM, (in case it's removed onclick)
					if( $.contains(document, target) ) {
						return true;
					}
				}
			} else if(closeOnContent) {
				return true;
			}

		}
		return false;
	},
	_addClassTomdp: function(cName) {
		mdp.bgOverlay.addClass(cName);
		mdp.wrap.addClass(cName);
	},
	_removeClassFrommdp: function(cName) {
		this.bgOverlay.removeClass(cName);
		mdp.wrap.removeClass(cName);
	},
	_hasScrollBar: function(winHeight) {
		return (  (mdp.isIE7 ? _document.height() : document.body.scrollHeight) > (winHeight || _window.height()) );
	},
	_setFocus: function() {
		(mdp.st.focus ? mdp.content.find(mdp.st.focus).eq(0) : mdp.wrap).focus();
	},
	_onFocusIn: function(e) {
		if( e.target !== mdp.wrap[0] && !$.contains(mdp.wrap[0], e.target) ) {
			mdp._setFocus();
			return false;
		}
	},
	_parseMarkup: function(template, values, item) {
		var arr;
		if(item.data) {
			values = $.extend(item.data, values);
		}
		_mdpTrigger(MARKUP_PARSE_EVENT, [template, values, item] );

		$.each(values, function(key, value) {
			if(value === undefined || value === false) {
				return true;
			}
			arr = key.split('_');
			if(arr.length > 1) {
				var el = template.find(EVENT_NS + '-'+arr[0]);

				if(el.length > 0) {
					var attr = arr[1];
					if(attr === 'replaceWith') {
						if(el[0] !== value[0]) {
							el.replaceWith(value);
						}
					} else if(attr === 'img') {
						if(el.is('img')) {
							el.attr('src', value);
						} else {
							el.replaceWith( $('<img>').attr('src', value).attr('class', el.attr('class')) );
						}
					} else {
						el.attr(arr[1], value);
					}
				}

			} else {
				template.find(EVENT_NS + '-'+key).html(value);
			}
		});
	},

	_getScrollbarSize: function() {
		// thx David
		if(mdp.scrollbarSize === undefined) {
			var scrollDiv = document.createElement("div");
			scrollDiv.style.cssText = 'width: 99px; height: 99px; overflow: scroll; position: absolute; top: -9999px;';
			document.body.appendChild(scrollDiv);
			mdp.scrollbarSize = scrollDiv.offsetWidth - scrollDiv.clientWidth;
			document.body.removeChild(scrollDiv);
		}
		return mdp.scrollbarSize;
	}

}; /* MagnificPopup core prototype end */




/**
 * Public static functions
 */
$.magnificPopup = {
	instance: null,
	proto: MagnificPopup.prototype,
	modules: [],

	open: function(options, index) {
		_checkInstance();

		if(!options) {
			options = {};
		} else {
			options = $.extend(true, {}, options);
		}

		options.isObj = true;
		options.index = index || 0;
		return this.instance.open(options);
	},

	close: function() {
		return $.magnificPopup.instance && $.magnificPopup.instance.close();
	},

	registerModule: function(name, module) {
		if(module.options) {
			$.magnificPopup.defaults[name] = module.options;
		}
		$.extend(this.proto, module.proto);
		this.modules.push(name);
	},

	defaults: {

		// Info about options is in docs:
		// http://dimsemenov.com/plugins/magnific-popup/documentation.html#options

		disableOn: 0,

		key: null,

		midClick: false,

		mainClass: '',

		preloader: true,

		focus: '', // CSS selector of input to focus after popup is opened

		closeOnContentClick: false,

		closeOnBgClick: true,

		closeBtnInside: true,

		showCloseBtn: true,

		enableEscapeKey: true,

		modal: false,

		alignTop: false,

		removalDelay: 0,

		prependTo: null,

		fixedContentPos: 'auto',

		fixedBgPos: 'auto',

		overflowY: 'auto',

		closeMarkup: '<button title="%title%" type="button" class="mdp-close">&#215;</button>',

		tClose: 'Close (Esc)',

		tLoading: 'Loading...',

		autoFocusLast: true

	}
};



$.fn.magnificPopup = function(options) {
	_checkInstance();

	var jqEl = $(this);

	// We call some API method of first param is a string
	if (typeof options === "string" ) {

		if(options === 'open') {
			var items,
				itemOpts = _isJQ ? jqEl.data('magnificPopup') : jqEl[0].magnificPopup,
				index = parseInt(arguments[1], 10) || 0;

			if(itemOpts.items) {
				items = itemOpts.items[index];
			} else {
				items = jqEl;
				if(itemOpts.delegate) {
					items = items.find(itemOpts.delegate);
				}
				items = items.eq( index );
			}
			mdp._openClick({mdpEl:items}, jqEl, itemOpts);
		} else {
			if(mdp.isOpen)
				mdp[options].apply(mdp, Array.prototype.slice.call(arguments, 1));
		}

	} else {
		// clone options obj
		options = $.extend(true, {}, options);

		/*
		 * As Zepto doesn't support .data() method for objects
		 * and it works only in normal browsers
		 * we assign "options" object directly to the DOM element. FTW!
		 */
		if(_isJQ) {
			jqEl.data('magnificPopup', options);
		} else {
			jqEl[0].magnificPopup = options;
		}

		mdp.addGroup(jqEl, options);

	}
	return jqEl;
};

/*>>core*/

/*>>inline*/

var INLINE_NS = 'inline',
	_hiddenClass,
	_inlinePlaceholder,
	_lastInlineElement,
	_putInlineElementsBack = function() {
		if(_lastInlineElement) {
			_inlinePlaceholder.after( _lastInlineElement.addClass(_hiddenClass) ).detach();
			_lastInlineElement = null;
		}
	};

$.magnificPopup.registerModule(INLINE_NS, {
	options: {
		hiddenClass: 'hide', // will be appended with `mdp-` prefix
		markup: '',
		tNotFound: 'Content not found'
	},
	proto: {

		initInline: function() {
			mdp.types.push(INLINE_NS);

			_mdpOn(CLOSE_EVENT+'.'+INLINE_NS, function() {
				_putInlineElementsBack();
			});
		},

		getInline: function(item, template) {

			_putInlineElementsBack();

			if(item.src) {
				var inlineSt = mdp.st.inline,
					el = $(item.src);

				if(el.length) {

					// If target element has parent - we replace it with placeholder and put it back after popup is closed
					var parent = el[0].parentNode;
					if(parent && parent.tagName) {
						if(!_inlinePlaceholder) {
							_hiddenClass = inlineSt.hiddenClass;
							_inlinePlaceholder = _getEl(_hiddenClass);
							_hiddenClass = 'mdp-'+_hiddenClass;
						}
						// replace target inline element with placeholder
						_lastInlineElement = el.after(_inlinePlaceholder).detach().removeClass(_hiddenClass);
					}

					mdp.updateStatus('ready');
				} else {
					mdp.updateStatus('error', inlineSt.tNotFound);
					el = $('<div>');
				}

				item.inlineElement = el;
				return el;
			}

			mdp.updateStatus('ready');
			mdp._parseMarkup(template, {}, item);
			return template;
		}
	}
});

/*>>inline*/

/*>>ajax*/
var AJAX_NS = 'ajax',
	_ajaxCur,
	_removeAjaxCursor = function() {
		if(_ajaxCur) {
			$(document.body).removeClass(_ajaxCur);
		}
	},
	_destroyAjaxRequest = function() {
		_removeAjaxCursor();
		if(mdp.req) {
			mdp.req.abort();
		}
	};

$.magnificPopup.registerModule(AJAX_NS, {

	options: {
		settings: null,
		cursor: 'mdp-ajax-cur',
		tError: '<a href="%url%">The content</a> could not be loaded.'
	},

	proto: {
		initAjax: function() {
			mdp.types.push(AJAX_NS);
			_ajaxCur = mdp.st.ajax.cursor;

			_mdpOn(CLOSE_EVENT+'.'+AJAX_NS, _destroyAjaxRequest);
			_mdpOn('BeforeChange.' + AJAX_NS, _destroyAjaxRequest);
		},
		getAjax: function(item) {

			if(_ajaxCur) {
				$(document.body).addClass(_ajaxCur);
			}

			mdp.updateStatus('loading');

			var opts = $.extend({
				url: item.src,
				success: function(data, textStatus, jqXHR) {
					var temp = {
						data:data,
						xhr:jqXHR
					};

					_mdpTrigger('ParseAjax', temp);

					mdp.appendContent( $(temp.data), AJAX_NS );

					item.finished = true;

					_removeAjaxCursor();

					mdp._setFocus();

					setTimeout(function() {
						mdp.wrap.addClass(READY_CLASS);
					}, 16);

					mdp.updateStatus('ready');

					_mdpTrigger('AjaxContentAdded');
				},
				error: function() {
					_removeAjaxCursor();
					item.finished = item.loadError = true;
					mdp.updateStatus('error', mdp.st.ajax.tError.replace('%url%', item.src));
				}
			}, mdp.st.ajax.settings);

			mdp.req = $.ajax(opts);

			return '';
		}
	}
});

/*>>ajax*/

/*>>image*/
var _imgInterval,
	_getTitle = function(item) {
		if(item.data && item.data.title !== undefined)
			return item.data.title;

		var src = mdp.st.image.titleSrc;

		if(src) {
			if($.isFunction(src)) {
				return src.call(mdp, item);
			} else if(item.el) {
				return item.el.attr(src) || '';
			}
		}
		return '';
	};

$.magnificPopup.registerModule('image', {

	options: {
		markup: '<div class="mdp-figure">'+
					'<div class="mdp-close"></div>'+
					'<figure>'+
						'<div class="mdp-img"></div>'+
						'<figcaption>'+
							'<div class="mdp-bottom-bar">'+
								'<div class="mdp-title"></div>'+
								'<div class="mdp-counter"></div>'+
							'</div>'+
						'</figcaption>'+
					'</figure>'+
				'</div>',
		cursor: 'mdp-zoom-out-cur',
		titleSrc: 'title',
		verticalFit: true,
		tError: '<a href="%url%">The image</a> could not be loaded.'
	},

	proto: {
		initImage: function() {
			var imgSt = mdp.st.image,
				ns = '.image';

			mdp.types.push('image');

			_mdpOn(OPEN_EVENT+ns, function() {
				if(mdp.currItem.type === 'image' && imgSt.cursor) {
					$(document.body).addClass(imgSt.cursor);
				}
			});

			_mdpOn(CLOSE_EVENT+ns, function() {
				if(imgSt.cursor) {
					$(document.body).removeClass(imgSt.cursor);
				}
				_window.off('resize' + EVENT_NS);
			});

			_mdpOn('Resize'+ns, mdp.resizeImage);
			if(mdp.isLowIE) {
				_mdpOn('AfterChange', mdp.resizeImage);
			}
		},
		resizeImage: function() {
			var item = mdp.currItem;
			if(!item || !item.img) return;

			if(mdp.st.image.verticalFit) {
				var decr = 0;
				// fix box-sizing in ie7/8
				if(mdp.isLowIE) {
					decr = parseInt(item.img.css('padding-top'), 10) + parseInt(item.img.css('padding-bottom'),10);
				}
				item.img.css('max-height', mdp.wH-decr);
			}
		},
		_onImageHasSize: function(item) {
			if(item.img) {

				item.hasSize = true;

				if(_imgInterval) {
					clearInterval(_imgInterval);
				}

				item.isCheckingImgSize = false;

				_mdpTrigger('ImageHasSize', item);

				if(item.imgHidden) {
					if(mdp.content)
						mdp.content.removeClass('mdp-loading');

					item.imgHidden = false;
				}

			}
		},

		/**
		 * Function that loops until the image has size to display elements that rely on it asap
		 */
		findImageSize: function(item) {

			var counter = 0,
				img = item.img[0],
				mdpSetInterval = function(delay) {

					if(_imgInterval) {
						clearInterval(_imgInterval);
					}
					// decelerating interval that checks for size of an image
					_imgInterval = setInterval(function() {
						if(img.naturalWidth > 0) {
							mdp._onImageHasSize(item);
							return;
						}

						if(counter > 200) {
							clearInterval(_imgInterval);
						}

						counter++;
						if(counter === 3) {
							mdpSetInterval(10);
						} else if(counter === 40) {
							mdpSetInterval(50);
						} else if(counter === 100) {
							mdpSetInterval(500);
						}
					}, delay);
				};

			mdpSetInterval(1);
		},

		getImage: function(item, template) {

			var guard = 0,

				// image load complete handler
				onLoadComplete = function() {
					if(item) {
						if (item.img[0].complete) {
							item.img.off('.mdploader');

							if(item === mdp.currItem){
								mdp._onImageHasSize(item);

								mdp.updateStatus('ready');
							}

							item.hasSize = true;
							item.loaded = true;

							_mdpTrigger('ImageLoadComplete');

						}
						else {
							// if image complete check fails 200 times (20 sec), we assume that there was an error.
							guard++;
							if(guard < 200) {
								setTimeout(onLoadComplete,100);
							} else {
								onLoadError();
							}
						}
					}
				},

				// image error handler
				onLoadError = function() {
					if(item) {
						item.img.off('.mdploader');
						if(item === mdp.currItem){
							mdp._onImageHasSize(item);
							mdp.updateStatus('error', imgSt.tError.replace('%url%', item.src) );
						}

						item.hasSize = true;
						item.loaded = true;
						item.loadError = true;
					}
				},
				imgSt = mdp.st.image;


			var el = template.find('.mdp-img');
			if(el.length) {
				var img = document.createElement('img');
				img.className = 'mdp-img';
				if(item.el && item.el.find('img').length) {
					img.alt = item.el.find('img').attr('alt');
				}
				item.img = $(img).on('load.mdploader', onLoadComplete).on('error.mdploader', onLoadError);
				img.src = item.src;

				// without clone() "error" event is not firing when IMG is replaced by new IMG
				// TODO: find a way to avoid such cloning
				if(el.is('img')) {
					item.img = item.img.clone();
				}

				img = item.img[0];
				if(img.naturalWidth > 0) {
					item.hasSize = true;
				} else if(!img.width) {
					item.hasSize = false;
				}
			}

			mdp._parseMarkup(template, {
				title: _getTitle(item),
				img_replaceWith: item.img
			}, item);

			mdp.resizeImage();

			if(item.hasSize) {
				if(_imgInterval) clearInterval(_imgInterval);

				if(item.loadError) {
					template.addClass('mdp-loading');
					mdp.updateStatus('error', imgSt.tError.replace('%url%', item.src) );
				} else {
					template.removeClass('mdp-loading');
					mdp.updateStatus('ready');
				}
				return template;
			}

			mdp.updateStatus('loading');
			item.loading = true;

			if(!item.hasSize) {
				item.imgHidden = true;
				template.addClass('mdp-loading');
				mdp.findImageSize(item);
			}

			return template;
		}
	}
});

/*>>image*/

/*>>zoom*/
var hasMozTransform,
	getHasMozTransform = function() {
		if(hasMozTransform === undefined) {
			hasMozTransform = document.createElement('p').style.MozTransform !== undefined;
		}
		return hasMozTransform;
	};

$.magnificPopup.registerModule('zoom', {

	options: {
		enabled: false,
		easing: 'ease-in-out',
		duration: 300,
		opener: function(element) {
			return element.is('img') ? element : element.find('img');
		}
	},

	proto: {

		initZoom: function() {
			var zoomSt = mdp.st.zoom,
				ns = '.zoom',
				image;

			if(!zoomSt.enabled || !mdp.supportsTransition) {
				return;
			}

			var duration = zoomSt.duration,
				getElToAnimate = function(image) {
					var newImg = image.clone().removeAttr('style').removeAttr('class').addClass('mdp-animated-image'),
						transition = 'all '+(zoomSt.duration/1000)+'s ' + zoomSt.easing,
						cssObj = {
							position: 'fixed',
							zIndex: 9999,
							left: 0,
							top: 0,
							'-webkit-backface-visibility': 'hidden'
						},
						t = 'transition';

					cssObj['-webkit-'+t] = cssObj['-moz-'+t] = cssObj['-o-'+t] = cssObj[t] = transition;

					newImg.css(cssObj);
					return newImg;
				},
				showMainContent = function() {
					mdp.content.css('visibility', 'visible');
				},
				openTimeout,
				animatedImg;

			_mdpOn('BuildControls'+ns, function() {
				if(mdp._allowZoom()) {

					clearTimeout(openTimeout);
					mdp.content.css('visibility', 'hidden');

					// Basically, all code below does is clones existing image, puts in on top of the current one and animated it

					image = mdp._getItemToZoom();

					if(!image) {
						showMainContent();
						return;
					}

					animatedImg = getElToAnimate(image);

					animatedImg.css( mdp._getOffset() );

					mdp.wrap.append(animatedImg);

					openTimeout = setTimeout(function() {
						animatedImg.css( mdp._getOffset( true ) );
						openTimeout = setTimeout(function() {

							showMainContent();

							setTimeout(function() {
								animatedImg.remove();
								image = animatedImg = null;
								_mdpTrigger('ZoomAnimationEnded');
							}, 16); // avoid blink when switching images

						}, duration); // this timeout equals animation duration

					}, 16); // by adding this timeout we avoid short glitch at the beginning of animation


					// Lots of timeouts...
				}
			});
			_mdpOn(BEFORE_CLOSE_EVENT+ns, function() {
				if(mdp._allowZoom()) {

					clearTimeout(openTimeout);

					mdp.st.removalDelay = duration;

					if(!image) {
						image = mdp._getItemToZoom();
						if(!image) {
							return;
						}
						animatedImg = getElToAnimate(image);
					}

					animatedImg.css( mdp._getOffset(true) );
					mdp.wrap.append(animatedImg);
					mdp.content.css('visibility', 'hidden');

					setTimeout(function() {
						animatedImg.css( mdp._getOffset() );
					}, 16);
				}

			});

			_mdpOn(CLOSE_EVENT+ns, function() {
				if(mdp._allowZoom()) {
					showMainContent();
					if(animatedImg) {
						animatedImg.remove();
					}
					image = null;
				}
			});
		},

		_allowZoom: function() {
			return mdp.currItem.type === 'image';
		},

		_getItemToZoom: function() {
			if(mdp.currItem.hasSize) {
				return mdp.currItem.img;
			} else {
				return false;
			}
		},

		// Get element postion relative to viewport
		_getOffset: function(isLarge) {
			var el;
			if(isLarge) {
				el = mdp.currItem.img;
			} else {
				el = mdp.st.zoom.opener(mdp.currItem.el || mdp.currItem);
			}

			var offset = el.offset();
			var paddingTop = parseInt(el.css('padding-top'),10);
			var paddingBottom = parseInt(el.css('padding-bottom'),10);
			offset.top -= ( $(window).scrollTop() - paddingTop );


			/*

			Animating left + top + width/height looks glitchy in Firefox, but perfect in Chrome. And vice-versa.

			 */
			var obj = {
				width: el.width(),
				// fix Zepto height+padding issue
				height: (_isJQ ? el.innerHeight() : el[0].offsetHeight) - paddingBottom - paddingTop
			};

			// I hate to do this, but there is no another option
			if( getHasMozTransform() ) {
				obj['-moz-transform'] = obj['transform'] = 'translate(' + offset.left + 'px,' + offset.top + 'px)';
			} else {
				obj.left = offset.left;
				obj.top = offset.top;
			}
			return obj;
		}

	}
});



/*>>zoom*/

/*>>iframe*/

var IFRAME_NS = 'iframe',
	_emptyPage = '//about:blank',

	_fixIframeBugs = function(isShowing) {
		if(mdp.currTemplate[IFRAME_NS]) {
			var el = mdp.currTemplate[IFRAME_NS].find('iframe');
			if(el.length) {
				// reset src after the popup is closed to avoid "video keeps playing after popup is closed" bug
				if(!isShowing) {
					el[0].src = _emptyPage;
				}

				// IE8 black screen bug fix
				if(mdp.isIE8) {
					el.css('display', isShowing ? 'block' : 'none');
				}
			}
		}
	};

$.magnificPopup.registerModule(IFRAME_NS, {

	options: {
		markup: '<div class="mdp-iframe-scaler">'+
					'<div class="mdp-close"></div>'+
					'<iframe class="mdp-iframe" src="//about:blank" frameborder="0" allowfullscreen></iframe>'+
				'</div>',

		srcAction: 'iframe_src',

		// we don't care and support only one default type of URL by default
		patterns: {
			youtube: {
				index: 'youtube.com',
				id: 'v=',
				src: '//www.youtube.com/embed/%id%?autoplay=1'
			},
			vimeo: {
				index: 'vimeo.com/',
				id: '/',
				src: '//player.vimeo.com/video/%id%?autoplay=1'
			},
			gmaps: {
				index: '//maps.google.',
				src: '%id%&output=embed'
			}
		}
	},

	proto: {
		initIframe: function() {
			mdp.types.push(IFRAME_NS);

			_mdpOn('BeforeChange', function(e, prevType, newType) {
				if(prevType !== newType) {
					if(prevType === IFRAME_NS) {
						_fixIframeBugs(); // iframe if removed
					} else if(newType === IFRAME_NS) {
						_fixIframeBugs(true); // iframe is showing
					}
				}// else {
					// iframe source is switched, don't do anything
				//}
			});

			_mdpOn(CLOSE_EVENT + '.' + IFRAME_NS, function() {
				_fixIframeBugs();
			});
		},

		getIframe: function(item, template) {
			var embedSrc = item.src;
			var iframeSt = mdp.st.iframe;

			$.each(iframeSt.patterns, function() {
				if(embedSrc.indexOf( this.index ) > -1) {
					if(this.id) {
						if(typeof this.id === 'string') {
							embedSrc = embedSrc.substr(embedSrc.lastIndexOf(this.id)+this.id.length, embedSrc.length);
						} else {
							embedSrc = this.id.call( this, embedSrc );
						}
					}
					embedSrc = this.src.replace('%id%', embedSrc );
					return false; // break;
				}
			});

			var dataObj = {};
			if(iframeSt.srcAction) {
				dataObj[iframeSt.srcAction] = embedSrc;
			}
			mdp._parseMarkup(template, dataObj, item);

			mdp.updateStatus('ready');

			return template;
		}
	}
});



/*>>iframe*/

/*>>gallery*/
/**
 * Get looped index depending on number of slides
 */
var _getLoopedId = function(index) {
		var numSlides = mdp.items.length;
		if(index > numSlides - 1) {
			return index - numSlides;
		} else  if(index < 0) {
			return numSlides + index;
		}
		return index;
	},
	_replaceCurrTotal = function(text, curr, total) {
		return text.replace(/%curr%/gi, curr + 1).replace(/%total%/gi, total);
	};

$.magnificPopup.registerModule('gallery', {

	options: {
		enabled: false,
		arrowMarkup: '<button title="%title%" type="button" class="mdp-arrow mdp-arrow-%dir%"></button>',
		preload: [0,2],
		navigateByImgClick: true,
		arrows: true,

		tPrev: 'Previous (Left arrow key)',
		tNext: 'Next (Right arrow key)',
		tCounter: '%curr% of %total%'
	},

	proto: {
		initGallery: function() {

			var gSt = mdp.st.gallery,
				ns = '.mdp-gallery';

			mdp.direction = true; // true - next, false - prev

			if(!gSt || !gSt.enabled ) return false;

			_wrapClasses += ' mdp-gallery';

			_mdpOn(OPEN_EVENT+ns, function() {

				if(gSt.navigateByImgClick) {
					mdp.wrap.on('click'+ns, '.mdp-img', function() {
						if(mdp.items.length > 1) {
							mdp.next();
							return false;
						}
					});
				}

				_document.on('keydown'+ns, function(e) {
					if (e.keyCode === 37) {
						mdp.prev();
					} else if (e.keyCode === 39) {
						mdp.next();
					}
				});
			});

			_mdpOn('UpdateStatus'+ns, function(e, data) {
				if(data.text) {
					data.text = _replaceCurrTotal(data.text, mdp.currItem.index, mdp.items.length);
				}
			});

			_mdpOn(MARKUP_PARSE_EVENT+ns, function(e, element, values, item) {
				var l = mdp.items.length;
				values.counter = l > 1 ? _replaceCurrTotal(gSt.tCounter, item.index, l) : '';
			});

			_mdpOn('BuildControls' + ns, function() {
				if(mdp.items.length > 1 && gSt.arrows && !mdp.arrowLeft) {
					var markup = gSt.arrowMarkup,
						arrowLeft = mdp.arrowLeft = $( markup.replace(/%title%/gi, gSt.tPrev).replace(/%dir%/gi, 'left') ).addClass(PREVENT_CLOSE_CLASS),
						arrowRight = mdp.arrowRight = $( markup.replace(/%title%/gi, gSt.tNext).replace(/%dir%/gi, 'right') ).addClass(PREVENT_CLOSE_CLASS);

					arrowLeft.click(function() {
						mdp.prev();
					});
					arrowRight.click(function() {
						mdp.next();
					});

					mdp.container.append(arrowLeft.add(arrowRight));
				}
			});

			_mdpOn(CHANGE_EVENT+ns, function() {
				if(mdp._preloadTimeout) clearTimeout(mdp._preloadTimeout);

				mdp._preloadTimeout = setTimeout(function() {
					mdp.preloadNearbyImages();
					mdp._preloadTimeout = null;
				}, 16);
			});


			_mdpOn(CLOSE_EVENT+ns, function() {
				_document.off(ns);
				mdp.wrap.off('click'+ns);
				mdp.arrowRight = mdp.arrowLeft = null;
			});

		},
		next: function() {
			mdp.direction = true;
			mdp.index = _getLoopedId(mdp.index + 1);
			mdp.updateItemHTML();
		},
		prev: function() {
			mdp.direction = false;
			mdp.index = _getLoopedId(mdp.index - 1);
			mdp.updateItemHTML();
		},
		goTo: function(newIndex) {
			mdp.direction = (newIndex >= mdp.index);
			mdp.index = newIndex;
			mdp.updateItemHTML();
		},
		preloadNearbyImages: function() {
			var p = mdp.st.gallery.preload,
				preloadBefore = Math.min(p[0], mdp.items.length),
				preloadAfter = Math.min(p[1], mdp.items.length),
				i;

			for(i = 1; i <= (mdp.direction ? preloadAfter : preloadBefore); i++) {
				mdp._preloadItem(mdp.index+i);
			}
			for(i = 1; i <= (mdp.direction ? preloadBefore : preloadAfter); i++) {
				mdp._preloadItem(mdp.index-i);
			}
		},
		_preloadItem: function(index) {
			index = _getLoopedId(index);

			if(mdp.items[index].preloaded) {
				return;
			}

			var item = mdp.items[index];
			if(!item.parsed) {
				item = mdp.parseEl( index );
			}

			_mdpTrigger('LazyLoad', item);

			if(item.type === 'image') {
				item.img = $('<img class="mdp-img" />').on('load.mdploader', function() {
					item.hasSize = true;
				}).on('error.mdploader', function() {
					item.hasSize = true;
					item.loadError = true;
					_mdpTrigger('LazyLoadError', item);
				}).attr('src', item.src);
			}


			item.preloaded = true;
		}
	}
});

/*>>gallery*/

/*>>retina*/

var RETINA_NS = 'retina';

$.magnificPopup.registerModule(RETINA_NS, {
	options: {
		replaceSrc: function(item) {
			return item.src.replace(/\.\w+$/, function(m) { return '@2x' + m; });
		},
		ratio: 1 // Function or number.  Set to 1 to disable.
	},
	proto: {
		initRetina: function() {
			if(window.devicePixelRatio > 1) {

				var st = mdp.st.retina,
					ratio = st.ratio;

				ratio = !isNaN(ratio) ? ratio : ratio();

				if(ratio > 1) {
					_mdpOn('ImageHasSize' + '.' + RETINA_NS, function(e, item) {
						item.img.css({
							'max-width': item.img[0].naturalWidth / ratio,
							'width': '100%'
						});
					});
					_mdpOn('ElementParse' + '.' + RETINA_NS, function(e, item) {
						item.src = st.replaceSrc(item, ratio);
					});
				}
			}

		}
	}
});

/*>>retina*/
 _checkInstance(); }));