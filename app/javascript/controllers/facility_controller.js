import { Controller } from "@hotwired/stimulus";
import "maplibre-gl";

export default class extends Controller {
  connect() {
    const latitude = Number(this.element.dataset.latitude);
    const longitude = Number(this.element.dataset.longitude);

    this.map = new maplibregl.Map({
      container: "facility-map",
      style: `https://api.maptiler.com/maps/streets/style.json?key=`, // TODO: hide the key!
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
