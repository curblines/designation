$(document).ready(function () {
  // ***************************************
  // DESIGNATION HOME
  // ***************************************
  if($('#landmark').length) {
    $.fn.landmark = function() { // portfolio selector / carrousel
      $('.cl-opacity-guard').waypoint(function(direction) { // set the waypoint
        if(direction==='up') $('.cl-header').fadeIn(); // show contact start
        if(direction==='down') $('.cl-header').fadeOut(); // show contact start
      }, {offset: 225}); // make sure it only appears after you've scrolled down thepage
    };
    $('#landmark').landmark(); // boot up the portfolio dot
  }
});