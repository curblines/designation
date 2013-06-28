var PageTransitions = (function() {

  var $main = $('#cl-main'),
      $pages = $main.children('div.cl-page'),
      curPageIndex = 0
      $curPage = $pages.eq(curPageIndex).addClass('cl-page-current'); // set the initial page
      animcursor = 1,
      pagesCount = $pages.length,
      isAnimating = false,
      animEndEventNames = {
        'WebkitAnimation' : 'webkitAnimationEnd',
        'OAnimation' : 'oAnimationEnd',
        'msAnimation' : 'MSAnimationEnd',
        'animation' : 'animationend'
      },
      animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ], // animation end event name
      support = Modernizr.cssanimations; // support css animations
  
  function init() {
    $pages.each(function() {
      var $page = $(this);
      $page.data('originalClassList', $page.attr('class'));
    });

    // $( '#dl-menu' ).dlmenu( {
    //   animationClasses : { in : 'dl-animate-in-2', out : 'dl-animate-out-2' },
    //   onLinkClick : function( el, ev ) {
    //     ev.preventDefault();
    //     nextPage( el.data( 'animation' ) );
    //   }
    // } );

    $('.cl-touch-button').click(function(e) { // handle next-previous
      var source = $(e.target);
      direction = source.data('direction') || source.parent().data('direction'); // grab the direction
      nextPage(direction); // kick off the paging
    });
  }

  function nextPage(direction) {
    if(isAnimating) { return false; }
    isAnimating = true;
    
    // Handle paging
    if(direction === 'next') {
      if(++curPageIndex === pagesCount) curPageIndex = 0;
    } else if(direction === 'prev') {
      if(--curPageIndex < 0) curPageIndex = pagesCount - 1;
    }
    var $upcomingPage = $pages.eq(curPageIndex);
    $upcomingPage.addClass('cl-page-current');

    // Handle animations
    outClass = '', inClass = '';
    switch(direction) {
      case 'next':
        outClass = 'cl-page-moveToLeft';
        inClass = 'cl-page-moveFromRight';
        break;
      case 'prev':
        outClass = 'cl-page-moveToRight';
        inClass = 'cl-page-moveFromLeft';
        break;
    }

    $curPage.addClass(outClass).on(animEndEventName, function() {
      $(this).off(animEndEventName);
      onEndAnimation($(this), 'outpage');
    });

    $upcomingPage.addClass(inClass).on(animEndEventName, function() {
      $(this).off(animEndEventName);
      onEndAnimation($(this), 'inpage');
    });

    if(!support) {
      console.log('*********', "No Support :(");
    }

  }

  function onEndAnimation(page, pageType) {
    isAnimating = false;
    page.attr('class', page.data('originalClassList')); // reset the original classes
    if(pageType === 'outpage') {
      page.removeClass('cl-page-current');
    } else {
      page.addClass('cl-page-current');
      $curPage = page; // reset the curPage
    }
    $(window).scrollTop(0); // make sure we're at the top
  }

  init();

  return { init : init };

})();