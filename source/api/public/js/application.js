$(document).ready(function() {

  trendingPlaces = new TrendingPlaces

  map = new google.maps.Map(document.getElementById("map-canvas"),
        {center: new google.maps.LatLng(37.7833, -122.4167), zoom: 12});

  google.maps.event.addDomListener(window, 'load', map);

  eventListeners();

})

function geoCoder(location){
  geocoder = new google.maps.Geocoder();
  geocoder.geocode({'address': location}, function(results, status){
    if (status == google.maps.GeocoderStatus.OK){
      coords = results[0].geometry.location
      fetchTrending([coords.d, coords.e]);
      map.setCenter(results[0].geometry.location);
    }
    else
    {
      alert("Couldn't find that location, sorry!")
    }
  })
}


function eventListeners(){
  $('#search button').click(function(){
    geoCoder($('input').val());
    $('#search').hide();
    $('.search-again').show()
  });

  $('#search-button').click(function() {
    geoCoder($('#search-input').val())
  });
}

function fetchTrending(coords){
  $.get('/trending', {coords: coords}, function(data){
    createObjects(data.results);
  })
}

function TrendingPlace(name) {
  this.name = name,
  this.latLng = "",
  this.address = ""
}

function createObjects(data){
  for (placeName in data){
    var new_place = new TrendingPlace(placeName);
    var placeObj = data[placeName]
    for (key in placeObj){
      new_place[key] = placeObj[key];
    }
    trendingPlaces[placeName] = new_place;
  }
  trendingPlaces.createMarkers();
}


function TrendingPlaces(){
}


TrendingPlaces.prototype.createMarkers = function(){
  for (place in this){
    latLng = new google.maps.LatLng(this[place].lat, this[place].lng)
    var new_marker = new google.maps.Marker({
      title: place,
      position: latLng,
      animation: google.maps.Animation.DROP,
      map: map
    });
  }
}

