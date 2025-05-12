import { Collapse } from "bootstrap"

document.addEventListener("turbo:load", () => {
  const navbarElement = document.getElementById("navbarNav")
  const togglerButton = document.getElementById("navbar-toggler")

  if (togglerButton && navbarElement) {
    togglerButton.addEventListener("click", () => {
      const instance = Collapse.getOrCreateInstance(navbarElement)
      instance.toggle()
    })
  }
})