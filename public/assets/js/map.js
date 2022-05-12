var map = L.map('map').setView([48.2772089, 6.9556556], 13);

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

var marker = L.marker([48.2772089, 6.9556556]).addTo(map);


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






// marker.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
// circle.bindPopup("I am a circle.");
// polygon.bindPopup("I am a polygon.");

// var popup = L.popup()
//     .setLatLng([51.513, -0.09])
//     .setContent("I am a standalone popup.")
//     .openOn(map);

const country = 'france';
let address;
let postal_code;
let gps = [];

fetch('http://localhost:8000/api/products')
    .then(response => response.json())
    .then(json => {
        for (let i = 0; i < json.length; i++) {
            address = json[i].address;
            postal_code = json[i].postal_code;

            fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${address} ${postal_code} ${country}`)
                .then(response => response.json())
                .then(json =>
                     gps.push([json[0].lat, json[0].lon])
                     )
        }
    })

console.log(gps);


L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoibWlrZTAxMDEiLCJhIjoiY2wzM2NiYmc3MHN3YzNscXY2NWxsNDV1cyJ9.-_xSdCkNp31z0gAy0RXDAQ'
}).addTo(map);
