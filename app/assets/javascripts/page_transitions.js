var PageTransitions = (function() {

  var $main = $('#pt-main'),
      $pages = $main.children('div.pt-page'),
      curPageIndex = 0
      $curPage = $pages.eq(curPageIndex).addClass('pt-page-current'); // set the initial page
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

    $('.pt-touch-button').click(function(e) { // handle next-previous
      var source = $(e.target);
      direction = source.data('direction'); // grab the direction
      nextPage(direction); // kick off the paging
    });
  }

  function nextPage(direction) {
    if(isAnimating) { return false; }
    // isAnimating = true;
    
    // Handle paging
    if(direction === 'next') {
      if(++curPageIndex === pagesCount) curPageIndex = 0;
    } else if(direction === 'prior') {
      if(--curPageIndex < 0) curPageIndex = pagesCount - 1;
    }
    var $upcomingPage = $pages.eq(curPageIndex);
    $upcomingPage.addClass('pt-page-current');

    // Handle animations
    outClass = '', inClass = '';
    switch(direction) {
      case 'next':
        outClass = 'pt-page-moveToLeft';
        inClass = 'pt-page-moveFromRight';
        break;
      case 'prior':
        outClass = 'pt-page-moveToRight';
        inClass = 'pt-page-moveFromLeft';
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
      page.removeClass('pt-page-current');
    } else {
      page.addClass('pt-page-current');
      $curPage = page; // reset the curPage
    }
  }

  init();

  return { init : init };

})();