import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { selectSpecie } from '../components/form_specie_selection';

selectSpecie();


import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
