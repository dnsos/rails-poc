import { Controller } from "@hotwired/stimulus";
import "maplibre-gl";

/**
 * Map object to be populated on `connect`
 * @type {object}
 */
let map;

export default class extends Controller {
  static targets = ["facility"];

  connect() {
    map = new maplibregl.Map({
      container: "map",
      style: `https://api.maptiler.com/maps/streets/style.json?key=`,
      center: [13.404954, 52.520008],
      zoom: 12,
    });

    map.addControl(new maplibregl.NavigationControl());

    this.facilityTargets.forEach((facility) => {
      const popup = new maplibregl.Popup({ offset: 25 }).setHTML(
        `
        <h2 class="font-bold text-lg text-lime-600">${facility.textContent}</h2>
        `
      );

      new maplibregl.Marker({
        color: "#65A30D",
      })
        .setLngLat([facility.dataset.longitude, facility.dataset.latitude])
        .setPopup(popup)
        .addTo(map);
    });
  }

  /**
   * Flies to the location specified on the currenTarget's data- attributes
   * @param {object} event - Stimulus action event object: https://stimulus.hotwired.dev/reference/actions#event-objects
   */
  flyTo(event) {
    map.flyTo({
      center: [
        event.currentTarget.dataset.longitude,
        event.currentTarget.dataset.latitude,
      ],
      zoom: 15,
      essential: true,
    });
  }
}
