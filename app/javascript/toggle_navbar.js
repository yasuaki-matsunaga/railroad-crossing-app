document.addEventListener("turbo:load", () => {
  const toggler = document.getElementById("navbar-toggler");
  const collapseEl = document.getElementById("navbarNav");

  if (toggler && collapseEl) {
    const collapseInstance = bootstrap.Collapse.getOrCreateInstance(collapseEl, { toggle: false });

    toggler.addEventListener("click", (e) => {
      e.preventDefault();
      collapseInstance.toggle();
    });
  }
});