$('[data-role="page"]').live('pageshow', function(e) {
  $('img.lazy').lazyload();
});