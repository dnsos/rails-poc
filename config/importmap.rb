# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'

pin_all_from 'app/javascript/utils', under: 'utils'

pin 'maplibre-gl',
    to: 'https://unpkg.com/maplibre-gl@1.15.2/dist/maplibre-gl.js'
