# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@popperjs/core", to: "https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/esm/index.js", preload: true
pin "bootstrap",        to: "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.esm.js", preload: true
pin "stimulus-autocomplete" # @3.1.0
pin "active_select_box"
