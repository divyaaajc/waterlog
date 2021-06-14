import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/edmundparsons/ckpwebkhw5gms17me7pz91apg'
  });
};

const addMarkersToMap = (map, markers) => {
 markers.forEach((marker) => {
  const popup = new mapboxgl.Popup().setHTML(marker.info_window);

  // Create a HTML element for your custom marker
  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url(https://cdn1.iconfinder.com/data/icons/user-interface-16x16-vol-1/16/drop-512.png)`;
  element.style.backgroundSize = 'contain';
  element.style.width = '30px';
  element.style.height = '30px';

  // Pass the element as an argument to the new marker
  new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .addTo(map);
});
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 6, duration: 500 });
};

const initMapbox = () => {
  setTimeout(() => {
    const mapElement = document.getElementById('map');
    if (mapElement) {
      const map = buildMap(mapElement);
      const markers = JSON.parse(mapElement.dataset.markers);
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);    }
  }, 200);
};

export { initMapbox };