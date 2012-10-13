$('[data-role="page"]').live('pageshow', function(e) {
  $('[data-role=header],[data-role=footer]').fixedtoolbar({ tapToggle:false });
  $('img.lazy').lazyload();
});