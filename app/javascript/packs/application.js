import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initSweetalert } from '../plugins/init_sweetalert';
import { loadDynamicBannerText } from '../components/banner';
import { dynamicRating } from "../plugins/starsInReviewForm";
import { showFormReview } from '../components/form_review_booking';
import { selectSpecie } from '../components/form_specie_selection';
import { clickTags } from '../components/form_specie_clickable_tag'
import { initMapbox } from '../plugins/init_mapbox';
import "../plugins/flatpickr"

selectSpecie();
clickTags();
initMapbox();
showFormReview();
dynamicRating();
loadDynamicBannerText();
initSweetalert('#sweet-alert-demo');
