var watchPositionId;
$('[data-role="page"]').live('pageshow', function(e) {
  if (!watchPositionId) {
	 watchPositionId = navigator.geolocation.watchPosition(function(p){$(window).trigger('positionUpdate', p);});
  }
});

var currentGeoLocation = false;
$(window).on('positionUpdate', function(e, pos) {
  currentGeoLocation = pos;
});
