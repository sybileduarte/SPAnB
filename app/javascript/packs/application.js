import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { selectSpecie } from '../components/form_specie_selection';

import { clickTags } from '../components/form_specie_clickable_tag'

import { initMapbox } from '../plugins/init_mapbox';
import "../plugins/flatpickr"

selectSpecie();

clickTags();

initMapbox();

