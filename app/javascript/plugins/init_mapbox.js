import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/edmundparsons/ckpwebkhw5gms17me7pz91apg', zoom: 1.5
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

const highlightCountries = (map, countries) => {
  map.on('load', function() {
    map.addLayer(
      {
        id: 'country-boundaries',
        source: {
          type: 'vector',
          url: 'mapbox://mapbox.country-boundaries-v1',
        },
        'source-layer': 'country_boundaries',
        type: 'fill',
        paint: {
          'fill-color': '#eabb5d',
          'fill-opacity': 0.4,
        },
      },
      'country-label'
    );
  
    let filteredCountries = ["in", "iso_3166_1_alpha_3"]
    filteredCountries.push(countries)
  
    map.setFilter('country-boundaries', filteredCountries.flat());
  });
}

const initMapbox = () => {
  setTimeout(() => {
    const mapElement = document.getElementById('map');
    if (mapElement) {
      const map = buildMap(mapElement);
      if (mapElement.dataset.markers) {
        const markers = JSON.parse(mapElement.dataset.markers);
        addMarkersToMap(map, markers);
        fitMapToMarkers(map, markers);
      }
      if (mapElement.dataset.countries) {
        const countries = JSON.parse(mapElement.dataset.countries);
        highlightCountries(map, countries);
      }
    }
  }, 200);
};

export { initMapbox };