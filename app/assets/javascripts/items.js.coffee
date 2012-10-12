$('[data-role="page"]').live 'pageshow', (e) ->
  $('#new_item').submit ->
    if currentGeoLocation && currentGeoLocation.coords
      $(e.target).find('#item_latitude').val(currentGeoLocation.coords.latitude)
      $(e.target).find('#item_longitude').val(currentGeoLocation.coords.longitude)
      console.log("location: ", currentGeoLocation.coords.latitude, currentGeoLocation.coords.longitude)
    else
      console.log("no user location")
    return true;