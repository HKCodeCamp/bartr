$(document).on("pageinit", function(){

  $(".item-map-page").on('pageshow', function(){
    //console.log(this);
    var map_init = function(position){  
      var myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
              
      var mapOptions = {
              center: myLatlng,
              zoom: 5,
              mapTypeId: google.maps.MapTypeId.ROADMAP
            };
      console.log(mapOptions)
      var map = new google.maps.Map($("#map-canvas")[0], mapOptions);
      var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: 'You are here!'
        });
    }
    if(currentGeoLocation){
      console.log("We already on position")
      map_init(currentGeoLocation);
    }else{
      $(window).on('positionUpdate', function(e){  map_init(currentGeoLocation) });
    }

  })
})