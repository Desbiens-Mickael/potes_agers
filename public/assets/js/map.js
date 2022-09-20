let map = L.map('map').setView([50.535521, 2.912183], 13);
const userMap = document.getElementById('map');
const country = 'france';

const ip = userMap.dataset.ip;
let userAddress = userMap.dataset.address;
let userPostal = userMap.dataset.postal;

let address = userAddress.split(' ').join('+');

// la position du donneur
fetch(`https://api-adresse.data.gouv.fr/search/?q=${address}&postcode=${userPostal}`)
    .then(response => response.json())
    .then(function(json){
        return L.marker([json.features[0].geometry.coordinates[1], json.features[0].geometry.coordinates[0]],
                {alt: 'pointeur carte'})
                .addTo(map)
                .bindPopup('Le donneur')
                .bindTooltip(userAddress);
});

// la position de l'utilisateur
fetch(`https://ipgeolocation.abstractapi.com/v1/?api_key=4f2a45153db746f5b4b4668ed54e9f30&ip_address=${ip}`)
.then(response => response.json())
.then(function(json) {
    return L.marker([json.latitude, json.longitude], {alt: 'pointeur carte'})
                .addTo(map)
                .bindPopup('Vous êtes ici').openPopup()
                .bindTooltip('Vous êtes ici');
});

//génération de la carte
L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoibWlrZTAxMDEiLCJhIjoiY2wzM2NiYmc3MHN3YzNscXY2NWxsNDV1cyJ9.-_xSdCkNp31z0gAy0RXDAQ'
}).addTo(map);
