import { Controller } from "@hotwired/stimulus";
import { DEFAULT_CENTER, getMaptilerStyle } from "./utils/map_utils.js";
import "maplibre-gl";

export default class extends Controller {
  static targets = ["latitude", "longitude"];
  static values = {
    "maptiler-key": String,
  };

  connect() {
    if (!this.hasMaptilerKeyValue) return;

    this.map = new maplibregl.Map({
      container: "facility_form",
      style: getMaptilerStyle(this.maptilerKeyValue),
      center: DEFAULT_CENTER,
      zoom: 15,
    });

    this.map.addControl(new maplibregl.NavigationControl());

    this.map.addControl(
      new maplibregl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true,
        },
        trackUserLocation: true,
      })
    );

    const hasInitialGeolocation =
      !!this.latitudeTarget.value > 0 && !!this.longitudeTarget.value > 0;

    let initialMarker = null;

    if (hasInitialGeolocation) {
      console.log(this.longitudeTarget.value);
      this.map.flyTo({
        center: [
          Number(this.longitudeTarget.value),
          Number(this.latitudeTarget.value),
        ],
      });

      initialMarker = new maplibregl.Marker({
        color: "#65A30D",
      })
        .setLngLat([
          Number(this.longitudeTarget.value),
          Number(this.latitudeTarget.value),
        ])
        .addTo(this.map);
    }

    // initialize a marker variable for use in the on click method
    let marker = hasInitialGeolocation ? initialMarker : null;

    this.map.on("click", (event) => {
      const { lng, lat } = event.lngLat;

      if (!marker) {
        // If there is no marker yet (i.e. after the first click), we assign a real marker to the variable "marker" and add it to the map:
        marker = new maplibregl.Marker({
          color: "#65A30D",
        })
          .setLngLat([lng, lat])
          .addTo(this.map);
      } else {
        // After the first click the "marker" variable is not empty anymore, and is therefore only update by latitude and longitude:
        marker.setLngLat([lng, lat]);
      }

      const longitudeDisplay = document.getElementById("facility_longitude");
      longitudeDisplay.value = lng;
      const latitudeDisplay = document.getElementById("facility_latitude");
      latitudeDisplay.value = lat;
    });
  }
}
