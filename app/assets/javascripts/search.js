function initMap(lat, lng, results) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 6
    };
    var array = results;
    console.log(array);
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);


}
