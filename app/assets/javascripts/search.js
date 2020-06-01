function initMap(lat, lng) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 6
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    var marker = new google.maps.Marker({
        position: {lat: 39.74, lng: -104.99},
        map: map,
        title: "Cool Helmet"
    });
    var marker2 = new google.maps.Marker({
        position: {lat: 39.19, lng: -106.82},
        map: map,
        title: "Purple Helmet"
    });
    marker.addListener('click', function() {
      window.open("/gear_items/3", '_blank');
    });
    marker2.addListener('click', function() {
      window.open("/gear_items/9", '_blank');
    });
}
