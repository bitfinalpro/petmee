  $( document ).ready( function() {
          var jbOffset = $( '.jbMenu' ).offset();
          var logo = $('.logo');
          $( window ).scroll( function() {
            if ( $( document ).scrollTop() > jbOffset.top ) {
              $( '.jbMenu' ).addClass( 'jbFixed' ).css('height','75px');
              $( '.logo' ).css('position','absolute').css('left','0%');
              $( '.drop01' ).css('height','58px');
              $( 'nav ul li a' ).css('padding','10px 40px');
            }
            else {
              $( '.jbMenu' ).removeClass( 'jbFixed' );
              $( '.jbMenu' ).removeAttr('style');
              $( '.logo' ).removeAttr('style');
              $( '.drop01' ).removeAttr('style');
              $( 'nav ul li a' ).removeAttr('style');
            }
          });
        } );