function initMap(lat, lng) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 6
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
}

function addMarkers(results) {
  for (var i = 0; i < results.length; i++) {
    var coords = results.attributes.coordinates;
    var latLng = new google.maps.LatLng(coords["latitude"],coords["longitude"]);
    var marker = new google.maps.Marker({
      position: latLng,
      map: map
    });
  }
}
