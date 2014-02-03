$ ->
  word_list = [
    # basic
    { text: 'Ruby', weight: 10 }
    # js
    { text: 'Javascript', weight: 3 }
    { text: 'Coffeescript', weight: 6 }
    # html
    { text: 'HTML5', weight: 3 }
    { text: 'HAML', weight: 6 }
    { text: 'Slim', weight: 2 }
    { text: 'ERB', weight: 1 }
    # css
    { text: 'CSS3', weight: 3 }
    { text: 'SCSS', weight: 6 }
    { text: 'Sass', weight: 3 }
    { text: 'LESS', weight: 1 }
    # sql
    { text: 'SQL', weight: 3 }
    # databases
    { text: 'MySQL', weight: 2 }
    { text: 'PostgreSQL', weight: 6 }
    { text: 'Redis', weight: 4 }
    # frameworks
    { text: 'Rails', weight: 9 }
    { text: 'jQuery', weight: 6 }
    { text: 'Bootstrap', weight: 6 }
    # tools
    { text: 'Capistrano', weight: 3 }
    { text: 'RSpec', weight: 6 }
    { text: 'Git', weight: 6 }
    { text: 'RVM', weight: 3 }
    { text: 'Sublime Text', weight: 1 }
    { text: 'OS X', weight: 2 }
    # servers
    { text: 'Nginx', weight: 4 }
    { text: 'Apache', weight: 3 }
    { text: 'Unicorn', weight: 4 }
    { text: 'Phusion Passenger', weight: 1 }
    # services
    { text: 'Heroku', weight: 5 }
    { text: 'GitHub', weight: 5 }
    { text: 'Amazon S3', weight: 3 }
    { text: 'Amazon EC2', weight: 3 }
    # methods
    { text: 'Test Driven Development', weight: 4 }
    { text: 'Scrum', weight: 5 }
  ]

  $('#word-cloud').jQCloud word_list,
    delayedMode: true
    removeOverflowing: false

  google.maps.event.addDomListener window, 'load', showMap

  $(document).on 'shown.bs.tab', ->
    center = window.map.getCenter()
    google.maps.event.trigger window.map, 'resize'
    window.map.setCenter center

window.map

showMap = ->
  home = new google.maps.LatLng 52.123002, 5.094841

  mapOptions =
    zoom: 13
    center: home

  window.map = new google.maps.Map document.getElementById('map-canvas'), mapOptions

  infowindow = new google.maps.InfoWindow
    content: "Haïtidreef 3E<br>3563 HC&nbsp;&nbsp;Utrecht"

  marker = new google.maps.Marker
    position: home
    map: map
    animation: google.maps.Animation.DROP
    title: 'home'

  google.maps.event.addListener marker, 'click', ->
    infowindow.open map, marker