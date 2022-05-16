let map = L.map('map').setView([50.535521, 2.912183], 13);
const userMap = document.getElementById('map');
const country = 'france';

let userAddress = userMap.dataset.address;
let userPostal = userMap.dataset.postal;

let address = userAddress.split(' ').join('+');

fetch(`https://api-adresse.data.gouv.fr/search/?q=${address}&postcode=${userPostal}`)
    .then(response => response.json())
    .then(function(json){
        return L.marker([json.features[0].geometry.coordinates[1], json.features[0].geometry.coordinates[0]]).addTo(map);
});

let marker = L.marker([50.535521, 2.912183]).addTo(map);

L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoibWlrZTAxMDEiLCJhIjoiY2wzM2NiYmc3MHN3YzNscXY2NWxsNDV1cyJ9.-_xSdCkNp31z0gAy0RXDAQ'
}).addTo(map);
