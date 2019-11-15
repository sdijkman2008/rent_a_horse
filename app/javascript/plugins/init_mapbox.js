// BEGIN Code copied from https://gist.github.com/Eschults/d82b1d481eac8639dbf5f70b895f11b0
// import mapboxgl from 'mapbox-gl';
import mapboxgl from 'mapbox-gl/dist/mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    showZoom: true, // doesn't work
    style: 'mapbox://styles/klauw21/ck2xgrqks1ph31cqvxxvnar19' // THIS STYLE DOESN'T LOAD. WHY?
  });
};

// Default markers DO work. CUSTOM MARKERS DON'T WORK - because of Webpacker??
const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow)
    const element = document.createElement('div');   // Create a HTML element for your custom marker
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';

    new mapboxgl.Marker() // Pass the element as an argument to the new marker
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

// Fit to map works. Don't seed though; add a few horses manually.
const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers); // I guess something goes wrong here
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };

// // Searching on your map
// // [...]
// if (mapElement) {
//   // [...]
//   map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
// }
