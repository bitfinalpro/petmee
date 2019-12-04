var $jq = jQuery.noConflict();  
$jq( document ).ready( function() {
          var jbOffset = $jq( '.jbMenu' ).offset();
          var logo = $jq('.logo');
          $jq( window ).scroll( function() {
            if ( $jq( document ).scrollTop() > jbOffset.top ) {
              $jq( '.jbMenu' ).addClass( 'jbFixed' ).css('height','75px');
              $jq( '.logo' ).css('position','absolute').css('left','0%');
              $jq( '.drop01' ).css('height','58px');
              $jq( 'nav ul li a' ).css('padding','10px 40px');
            }
            else {
              $jq( '.jbMenu' ).removeClass( 'jbFixed' );
              $jq( '.jbMenu' ).removeAttr('style');
              $jq( '.logo' ).removeAttr('style');
              $jq( '.drop01' ).removeAttr('style');
              $jq( 'nav ul li a' ).removeAttr('style');
            }
          });
});