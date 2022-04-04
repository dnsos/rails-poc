import { Controller } from "@hotwired/stimulus";
import { getMaptilerStyle } from "../utils/map_utils";
import "maplibre-gl";

export default class extends Controller {
  static values = {
    "maptiler-key": String,
  };

  connect() {
    if (!this.hasMaptilerKeyValue) return;

    const latitude = Number(this.element.dataset.latitude);
    const longitude = Number(this.element.dataset.longitude);

    this.map = new maplibregl.Map({
      container: "facility-map",
      style: getMaptilerStyle(this.maptilerKeyValue),
      center: [longitude, latitude],
      zoom: 16,
    });

    new maplibregl.Marker({
      color: "#65A30D",
    })
      .setLngLat([longitude, latitude])
      .addTo(this.map);
  }
}
