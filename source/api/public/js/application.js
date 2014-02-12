$(document).ready(function() {
  $('button').on('click', function() {
  	var mapOptions = {
          center: new google.maps.LatLng(Math.random()*100,Math.random()*100),
          zoom: 7
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
  })
});
