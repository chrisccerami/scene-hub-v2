# initialize the map on the 'map' div
# with the given map ID, center, and zoom
$ ->
  L.mapbox.accessToken = 'pk.eyJ1IjoicGV6Y29yZTM0MyIsImEiOiJvb09uczhzIn0.wULXogG1xrKqmnMmm637kA';
  map = L.mapbox.map('band-map', 'pezcore343.kp1805li')
  map.setView([38.599700, -98.085938], 4)
  # find id of band the map is for
  bandID = $('#band-map').attr("data-band-id")
  # get JSON object
  # on success, parse it and
  # hand it over to MapBox for mapping
  $.ajax
    dataType: 'text'
    url: bandID + '.json'
    success: (data) ->
      geojson = $.parseJSON(data)
      map.featureLayer.setGeoJSON(geojson)
