$('[data-role="page"]').live 'pageshow', (e) ->
  $('#new_item').submit ->
    if currentGeoLocation && currentGeoLocation.coords
      $(e.target).find('#item_latitude').val(currentGeoLocation.coords.latitude)
      $(e.target).find('#item_longitude').val(currentGeoLocation.coords.longitude)
      console.log("location: ", currentGeoLocation.coords.latitude, currentGeoLocation.coords.longitude)
    else
      console.log("no user location")
    return true;

  $('#interest').click ->
    $(this).addClass('ui-disabled')
    
    url = $(this).data('url')

    success = (data, textStatus, jqXHR) ->
      $('#interest').addClass('hidden').removeClass('ui-disabled')
      $('#uninterest').removeClass('hidden')

    error = (jqXHR, textStatus, errorThrown) ->
      $('#interest').removeClass('ui-disabled')

    $.ajax
      type: 'POST',
      url: url,
      success: success,
      error: error,
      dataType: 'json'
  
    return false
  
  $('#uninterest').click ->
    $(this).addClass('ui-disabled')
    url = $(this).data('url')

    success = (data, textStatus, jqXHR) ->
      $('#uninterest').addClass('hidden').removeClass('ui-disabled')
      $('#interest').removeClass('hidden')
    
    error = (jqXHR, textStatus, errorThrown) ->
      $('#uninterest').removeClass('ui-disabled')
    
    $.ajax
      type: 'POST',
      url: url,
      success: success,
      error: error,
      dataType: 'json'

    return false