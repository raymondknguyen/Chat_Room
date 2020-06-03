function initMap(lat, lng, results) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 6
    };

    var map = new google.maps.Map(document.getElementById('map'), mapOptions);

    var array = results;

    var marker, i;

    for (i = 0; i < array.length; i++) {
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(array[i].lat, array[i].lng),
        map: map,
        name: array[i].name
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          window.open(`${array[i].url}`, '_blank');
        }
      })(marker, i));
    }
}
