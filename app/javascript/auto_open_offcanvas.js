import { Offcanvas } from "bootstrap";

document.addEventListener("turbo:load", () => {
  setTimeout(() => {
    const el = document.getElementById("offcanvasScrolling");
    if (el) {
      const instance = Offcanvas.getOrCreateInstance(el);
      instance.show();
    }
  }, 100);
});
