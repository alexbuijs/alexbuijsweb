$ ->
  wordCloud()

  google.maps.event.addDomListener window, 'load', showMap

  $(document).on 'shown.bs.tab', (e) ->
    switch $(e.target).html()
      when 'home' then wordCloud()
      when 'info' then resetMap()

  $('#carousel').swiperight ->
    $(this).carousel 'prev'
  $('#carousel').swipeleft ->
    $(this).carousel 'next'

wordCloud = ->
  $('#word-cloud').html('').css('width', '').jQCloud word_list,
    delayedMode: true
    removeOverflowing: false

window.map
window.marker
window.home

showMap = ->
  window.map    = new google.maps.Map document.getElementById('map-canvas')
  window.home   = new google.maps.LatLng 52.123002, 5.094841
  window.marker = new google.maps.Marker
    position: home
    map: map
    title: 'home'

  infowindow = new google.maps.InfoWindow
    content: 'Haïtidreef 3E<br>3563 HC&nbsp;&nbsp;Utrecht'

  google.maps.event.addListener marker, 'click', ->
    infowindow.open map, marker

resetMap = ->
  google.maps.event.trigger map, 'resize'
  map.setCenter home
  map.setZoom 13
  marker.setAnimation google.maps.Animation.DROP