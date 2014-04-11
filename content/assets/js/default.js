$(document).ready (function () {
  $("table:not([class])").addClass("table table-striped table-hover");
});


$(document).ready(function() {
  /* off-canvas sidebar toggle */
  $('[data-toggle=offcanvas]').click(function() {
  	$(this).toggleClass('visible-xs text-center');
    $(this).find('i').toggleClass('glyphicon-arrow-right glyphicon-arrow-left');
    $('.row-offcanvas').toggleClass('active');
    $('#lg-menu').toggleClass('hidden-xs').toggleClass('visible-xs');
    $('#xs-menu').toggleClass('visible-xs').toggleClass('hidden-xs');
    $('#btnShow').toggle();
  });
});

// back to top button
$(document).ready(function() {
  var offset = 220;
  var duration = 500;
  jQuery(window).scroll(function() {
    if (jQuery(this).scrollTop() > offset) {
      jQuery('.back-to-top').fadeIn(duration);
    } else {
      jQuery('.back-to-top').fadeOut(duration);
    }
  });

  jQuery('.back-to-top').click(function(event) {
    event.preventDefault();
    jQuery('html, body').animate({scrollTop: 0}, duration);
    return false;
  })
});

// for bootstrap timeline, see
// http://bootsnipp.com/snippets/featured/timeline-21-with-images-and-responsive
$(document).ready(function(){
  var my_posts = $("[rel=tooltip]");

  var size = $(window).width();
  for(i = 0; i < my_posts.length; i++){
	the_post = $(my_posts[i]);

	if(the_post.hasClass('invert') && size >=767 ){
	  // the_post.tooltip({placement: 'left'});
	  the_post.css("cursor","pointer");
	}
    else {
	  // the_post.tooltip({placement: 'right'});
	  the_post.css("cursor","pointer");
	}
  }
});


$(document).ready(function() {
  var img = $('#compass');
  if (img.length > 0) {
    var offset = img.offset();

    function mouse(evt) {
      var center_x = (offset.left) + (img.width() / 2);
      var center_y = (offset.top) + (img.height() / 2);
      var mouse_x = evt.pageX;
      var mouse_y = 1;

      var radians = Math.atan2(center_x - mouse_x, center_y - mouse_y);
      var degree = ((radians * (180 / Math.PI) * -1));

      img.css('-moz-transform', 'rotate(' + degree + 'deg)');
      img.css('-webkit-transform', 'rotate(' + degree + 'deg)');
      img.css('-o-transform', 'rotate(' + degree + 'deg)');
      img.css('-ms-transform', 'rotate(' + degree + 'deg)');
    }
    $(document).mousemove(mouse);
  }
});
