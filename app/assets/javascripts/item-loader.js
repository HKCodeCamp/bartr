function itemLoad(item_cb, done_cb) {
  if (!currentGeoLocation) {
	 // Queue load until position fix is achieved
	 setTimeout(function(){
		itemLoad(item_cb, done_cb);
	 },300);
	 return true;
  }

  $.getJSON('/items/nearby.json', {
	 lon: currentGeoLocation.coords.longitude,
	 lat: currentGeoLocation.coords.latitude,
	 accuracy: currentGeoLocation.coords.accuracy,
	 start: 1,
	 count: 50
  }, function(d) {
	 $.each(d, function(i, item) {
		item_cb(i, item);
	 });

	 if (done_cb) done_cb();
  });
}

function itemRender(i, d) {

  var e = $('<div class="item" />').attr('id', 'item-'+d.id);
  e.click(function(e){
	 $.mobile.changePage('/items/' + d.id, { transition: 'slide' });
  });

  e.css({'background-image': ''});
  var image = $('<img src="/assets/placeholder-1x1.png" class="lazy">').attr('data-original', 'http://placekitten.com/300/300');
  
  if (d.image_url) {
	 image.attr('data-original', d.image_url);
  }
  
  e.append(image);

  return e;
}

$('.item-list-page').live('pageshow', function(e){
  console.log(e.target);
  var e = $(e.target).find('.item-list');

  var cont = $('<div class="item-container"></div>');  
  itemLoad(
	 function(i, item){
		cont.append(itemRender(i,item));
	 }, 
	 function(){
		e.html(cont);
		e.find('img.lazy').lazyload();
	 });
});