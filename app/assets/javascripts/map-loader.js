$(document).on("pageinit", function(){

  $(".item-map-page").on('pageshow', function(){
    //console.log(this);
    var map_init = function(position){  
      var myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
              
      var mapOptions = {
              center: myLatlng,
              zoom: 16,
              mapTypeId: google.maps.MapTypeId.ROADMAP
            };
      console.log(mapOptions)
      var map = new google.maps.Map($("#map-canvas")[0], mapOptions);
      var myMarker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: 'You are here!'
        });

      itemLoad(function(i, item){
        if(!item){ console.log("item fail");return true; }
        var pos =   new google.maps.LatLng (item.latitude, item.longitude);
        if(!pos){ console.log("pos failed"); return true; }
        console.log(pos);
        var marker = new google.maps.Marker({
            position: pos,
            map: map,
            title: item.title
        });
      }, function(){}) 
    }
    if(currentGeoLocation){
      console.log("We already on position")
      map_init(currentGeoLocation);
    }else{
      $(window).on('positionUpdate', function(e){  map_init(currentGeoLocation) });
    }

  })
})