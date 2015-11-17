/*=============================================================
    Authour URL: www.designbootstrap.com
    
    http://www.designbootstrap.com/

    License: MIT

    http://opensource.org/licenses/MIT

    100% Free To use For Personal And Commercial Use.

    IN EXCHANGE JUST TELL PEOPLE ABOUT THIS WEBSITE
   
========================================================  */


$(document).ready(function () {

    /*====================================
          SUBSCRIPTION   SCRIPTS 
    ======================================*/


   $("#postcontent").submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "subscribe.php",
            data: $("#postcontent").serialize(),
             success: function (response) {
			  $('[name="email"]').val('');
               // alert(response); // FOR ACTUAL RESPONSE
			   alert('Thanks for  subscribing Us');
            }
        });
        e.preventDefault();
    });
    // SCROLL SCRIPTS 
    $('.scroll-me a').bind('click', function (event) { //just pass scroll-me class and start scrolling
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1000, 'easeInOutQuad');
        event.preventDefault();
    });
    /*====================================
 POPUP IMAGE SCRIPTS
 ======================================*/
    $('.fancybox-media').fancybox({
        openEffect: 'elastic',
        closeEffect: 'elastic',
        helpers: {
            title: {
                type: 'inside'
            }
        }
    });


    /*====================================
    FILTER FUNCTIONALITY SCRIPTS
    ======================================*/
    $(window).load(function () {
        var $container = $('#work-div');
        $container.isotope({
            filter: '*',
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            }
        });
        $('.caegories a').click(function () {
            $('.caegories .active').removeClass('active');
            $(this).addClass('active');
            var selector = $(this).attr('data-filter');
            $container.isotope({
                filter: selector,
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false
                }
            });
            return false;
        });

    });

   });
