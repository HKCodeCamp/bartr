$('.item-list-page').live('pageshow', function(e){
  console.log(e.target);
  itemLoad($(e.target).find('.item-list'));
});


function itemLoad(elm) {
  if (!currentGeoLocation) {
	 // Queue load until position fix is achieved
	 $(window).on('positionUpdate', function(e){
		console.log('deferred itemLoad');
		itemLoad(elm);
	 });
	 return true;
  }
  $.getJSON('dummy-product-search.json', {
	 lon: currentGeoLocation.coords.longitude,
	 lat: currentGeoLocation.coords.latitude,
	 accuracy: currentGeoLocation.coords.accuracy
  }, function(d) {
	 var cont = $('<ul />');
	 $.each(d, function(i, item) {
		cont.append(itemRender(item));
	 });
	 elm.html(cont);
	 elm.trigger('items-loaded');
  });
}

function itemRender(d) {
  return $('<li id="item-'+d.id+'"><img src="'+d.img+'"></li>').click(function(e){
	 $.mobile.changePage('/items/' + d.id); // <--- Update to point to the correct item page
  });
  return e;
}