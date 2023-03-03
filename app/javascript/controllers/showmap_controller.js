import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    console.log(this.markerValue);

    this.map = new mapboxgl.Map({
      container: this.element,
      // can change the style of the map here
      style: "mapbox://styles/aamin25/clespo0q2000701oaspin2wzk"
      // old style "mapbox://styles/mapbox/streets-v9"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
      const popup = new mapboxgl.Popup().setHTML(this.markerValue.info_window_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = this.markerValue.marker_html
      new mapboxgl.Marker()
        .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
        .setPopup(popup) // Add this
        .addTo(this.map)
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markerValue.lng, this.markerValue.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 900 })
  }
}
