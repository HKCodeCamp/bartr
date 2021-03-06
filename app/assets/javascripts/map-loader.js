var currentMarkerWindow = null;
$(document).on("pageinit", function(){

  $(".item-map-page").on('pageshow', function(){
    //console.log(this);
    var map_init = function(position){  
      var myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
              
      var mapOptions = {
              center: myLatlng,
              zoom: 17,
              mapTypeId: google.maps.MapTypeId.ROADMAP
            };
      console.log(mapOptions)
      if($("body").width() > 0 && $("body").height() > 0 ){
        $("#map-canvas").width($("body").width()).height($("body").height());
      }
      var map = new google.maps.Map($("#map-canvas")[0], mapOptions);
      var myMarker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            icon: 'http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png',
            title: 'You are here!'
        });

      itemLoad(function(i, item){
        if(!item){ console.log("item fail");return true; }
        var pos =   new google.maps.LatLng (item.latitude, item.longitude);
        if(!pos){ console.log("pos failed"); return true; }
        console.log(pos, item);
        var covers = (item.photos.length>0) ? item.photos[0]: {};
        var thumb = covers.thumb ? covers.thumb : "http://placekitten.com/160/160";
        var content = "<div class='item-infowindow-content'>"
                      +"<div class='item-info-text'>"
                      + "<h1><a href='/items/"+item.id+"/'>"+item.title+"</a></h1>"
                      + "<p class='item-desc'>"+item.desc+"</p>"
                      + "<p class='item-price'>Price: $"+item.price+"</p>"
                      +"</div>"
                      + "<img class='item-thumb' src='"+thumb+"'>"
                      + "</div>";
        var marker = new google.maps.Marker({
            position: pos,
            map: map,
            animation: google.maps.Animation.DROP,
            title: item.title
        });
        var infowindow = new google.maps.InfoWindow({
            content: content
        });
        google.maps.event.addListener(marker, 'click', function() {
          if(!!window.currentMarkerWindow){ currentMarkerWindow.close(); }
          window.currentMarkerWindow = infowindow;
          infowindow.open(map,marker);
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