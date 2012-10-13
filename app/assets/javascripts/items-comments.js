$('[data-role="page"]').live('pageshow', function(e){
  var page = $(this);
  page.find(".comment_form form").submit(function(e){
	 var form = $(this);
	 $.post(form.attr('action'), form.serializeArray(), function(r) {
		page.find(".comments").load('/items/' + form.parent().attr('data-item-id') + ' .comments');
		form.each(function(){this.reset()}); // Annoying
	 });
	 return false; // Prevent the actual submit from ever happening.
  });
});

