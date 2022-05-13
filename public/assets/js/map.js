


const country = 'france';
let address;
let postal_code;
let gps = [];

fetch('http://localhost:8000/api/products')
    .then(response => response.json())
    .then(json => {
            address = json.address.split(' ').join('+');
            const url = `https://api-adresse.data.gouv.fr/search/?q=${address}&postcode=${json.postal_code}`
            console.log(url);

            fetch(url)
                .then(response => response.json())
                .then(function(json){
                    return L.marker([json.features[0].geometry.coordinates[1], json.features[0].geometry.coordinates[0]]).addTo(map);
                })
    });

var map = L.map('map').setView([50.535521, 2.912183], 13);
var marker = L.marker([50.535521, 2.912183]).addTo(map);

L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoibWlrZTAxMDEiLCJhIjoiY2wzM2NiYmc3MHN3YzNscXY2NWxsNDV1cyJ9.-_xSdCkNp31z0gAy0RXDAQ'
}).addTo(map);
