$ ->
  wordCloud()

  google.maps.event.addDomListener window, 'load', showMap

  $(document).on 'shown.bs.tab', (e) ->
    if $(e.target).html() is 'home'
      wordCloud()
    else if $(e.target).html() is 'info'
      center = window.map.getCenter()
      google.maps.event.trigger window.map, 'resize'
      window.map.setCenter center
      window.marker.setAnimation google.maps.Animation.DROP

wordCloud = ->
  $('#word-cloud').html ''
  $('#word-cloud').jQCloud window.word_list,
    delayedMode: true
    removeOverflowing: false

window.map
window.marker

showMap = ->
  home = new google.maps.LatLng 52.123002, 5.094841

  mapOptions =
    zoom: 13
    center: home

  window.map = new google.maps.Map document.getElementById('map-canvas'), mapOptions

  infowindow = new google.maps.InfoWindow
    content: "Haïtidreef 3E<br>3563 HC&nbsp;&nbsp;Utrecht"

  window.marker = new google.maps.Marker
    position: home
    map: map
    title: 'home'

  google.maps.event.addListener window.marker, 'click', ->
    infowindow.open map, window.marker