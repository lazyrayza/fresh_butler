import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
