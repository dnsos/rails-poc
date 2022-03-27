import { Controller } from "@hotwired/stimulus";
import { DEFAULT_CENTER, getMaptilerStyle } from "./utils/map_utils.js";
import "maplibre-gl";

/**
 * Array of markers with the attributes id and marker (which holds the Maplibre marker object)
 */
let markers;

export default class extends Controller {
  static targets = ["facility"];
  static values = {
    "maptiler-key": String,
  };

  initialize() {
    if (!this.hasMaptilerKeyValue) return;

    this.map = new maplibregl.Map({
      container: "map",
      style: getMaptilerStyle(this.maptilerKeyValue),
      center: DEFAULT_CENTER,
      zoom: 12,
    });

    this.map.addControl(new maplibregl.NavigationControl());

    this.fitToBoundingBox();

    markers = this.facilityTargets.map((facility) => {
      const popup = new maplibregl.Popup({ offset: 25 }).setHTML(
        `
        <h2 class="font-bold text-lg text-lime-600">${facility.textContent}</h2>
        `
      );

      return {
        id: facility.dataset.facilityId,
        marker: new maplibregl.Marker({
          color: "#65A30D",
        })
          .setLngLat([facility.dataset.longitude, facility.dataset.latitude])
          .setPopup(popup)
          .addTo(this.map),
      };
    });

    // Whenever a Turbo frame loads we want to adjust the visible map part to all markers:
    document.documentElement.addEventListener("turbo:frame-load", (_event) => {
      this.fitToBoundingBox();
    });
  }

  /**
   * Fired whenever a new facilityTarget is connected to the DOM
   */
  facilityTargetConnected(target) {
    if (markers.map((marker) => marker.id).includes(target.dataset.facilityId))
      return;

    const popup = new maplibregl.Popup({ offset: 25 }).setHTML(
      `
        <h2 class="font-bold text-lg text-lime-600">${target.textContent}</h2>
        `
    );

    const newMarker = {
      id: target.dataset.facilityId,
      marker: new maplibregl.Marker({
        color: "#65A30D",
      })
        .setLngLat([target.dataset.longitude, target.dataset.latitude])
        .setPopup(popup)
        .addTo(this.map),
    };
    markers.push(newMarker);
  }

  /**
   * Fired whenever a facilityTarget is disconnected from the DOM
   */
  facilityTargetDisconnected(target) {
    const markerToRemove = markers.find((marker) => {
      return marker.id === target.dataset.facilityId;
    });

    const indexToRemove = markers.indexOf(markerToRemove);

    markerToRemove.marker.remove();

    if (indexToRemove > -1) {
      markers.splice(indexToRemove, 1); // 2nd parameter means remove one item only
    }
  }

  /**
   * Flies to the location specified on the currenTarget's data- attributes
   * @param {object} event - Stimulus action event object: https://stimulus.hotwired.dev/reference/actions#event-objects
   */
  flyTo(event) {
    this.map.flyTo({
      center: [
        event.currentTarget.dataset.longitude,
        event.currentTarget.dataset.latitude,
      ],
      zoom: 15,
      essential: true,
    });
  }

  /**
   * Brings into view all currently active facilityTargets
   */
  fitToBoundingBox() {
    const MAX_LATITUDE = Math.max(
      ...this.facilityTargets.map((facility) =>
        Number(facility.dataset.latitude)
      )
    );

    const MIN_LATITUDE = Math.min(
      ...this.facilityTargets.map((facility) =>
        Number(facility.dataset.latitude)
      )
    );

    const MAX_LONGITUDE = Math.max(
      ...this.facilityTargets.map((facility) =>
        Number(facility.dataset.longitude)
      )
    );

    const MIN_LONGITUDE = Math.min(
      ...this.facilityTargets.map((facility) =>
        Number(facility.dataset.longitude)
      )
    );

    this.map.fitBounds(
      [
        [MIN_LONGITUDE, MAX_LATITUDE], // southwestern corner of the bounds
        [MAX_LONGITUDE, MIN_LATITUDE], // northeastern corner of the bounds
      ],
      {
        padding: { top: 20, bottom: 20, left: 20, right: 20 },
      }
    );
  }
}
