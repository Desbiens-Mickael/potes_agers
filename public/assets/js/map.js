var map = L.map('map').setView([50.5350572, 2.9505476], 13);

// var myIcon = L.icon({
//     iconUrl: '/assets/images/icone-map.png',
//     iconSize: [15, 50],
//     iconAnchor: [10, 50],
//     popupAnchor: [-3, -76],
//     shadowUrl: 'my-icon-shadow.png',
//     shadowSize: [68, 95],
//     shadowAnchor: [22, 94]
// });

// var marker = L.marker([51.5, -0.09], {icon: myIcon}).addTo(map);

var marker = L.marker([48.5442937, 7.49059]).addTo(map);

function clik(e) {
    alert('yo');
}

marker.on('click', clik);
marker.off('click', clik);

// var circle = L.circle([51.508, -0.11], {
//     color: 'red',
//     fillColor: '#f03',
//     fillOpacity: 0.5,
//     radius: 500
// }).addTo(map);

// var polygon = L.polygon([
//     [51.509, -0.08],
//     [51.503, -0.06],
//     [51.51, -0.047]
// ]).addTo(map);



L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoibWlrZTAxMDEiLCJhIjoiY2wzM2NiYmc3MHN3YzNscXY2NWxsNDV1cyJ9.-_xSdCkNp31z0gAy0RXDAQ'
}).addTo(map);


// marker.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
// circle.bindPopup("I am a circle.");
// polygon.bindPopup("I am a polygon.");

// var popup = L.popup()
//     .setLatLng([51.513, -0.09])
//     .setContent("I am a standalone popup.")
//     .openOn(map);


fetch('https://nominatim.openstreetmap.org/search?format=json&q=rue+du+General+de+Gaulle+france+59251')
    .then(response => response.json())
    .then(json => console.log(json[0].lat, json[0].lon))

