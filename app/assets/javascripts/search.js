function initMap(lat, lng, results) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 6
    };

    var map = new google.maps.Map(document.getElementById('map'), mapOptions);

    var index = 0;
    var array = results;
    array.forEach(myFunction);
    function myFunction(item, index)
      {
        new google.maps.Marker({
    position: {lat: item.lat, lng: item.lng},
    map: map,
    title: item.name
});
}
}
