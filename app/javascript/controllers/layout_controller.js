import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="layout"
export default class extends Controller {
  static targets = ["container"];
  static values = {
    mode: { type: String, default: "grid" }
  }

  connect() {
    this.updateLayout()
  }

  toggleGrid() {
    this.modeValue = "grid"
    this.updateLayout()
  }

  toggleList() {
    this.modeValue = "list"
    this.updateLayout()
  }

  updateLayout() {
    const container = this.containerTarget
    const items = container.querySelectorAll('[data-grid-item]')
    
    if (this.modeValue === "grid") {
      // Grid layout - 8 columns
      container.classList.remove('flex', 'flex-col', 'gap-4')
      container.classList.add('grid', 'grid-cols-8', 'gap-4')
      
      items.forEach(item => {
        item.classList.remove('col-span-8')
        const span = item.dataset.span || '1'
        item.classList.add(`col-span-${span}`)
        
        // Show card style
        const imageContainer = item.querySelector('div:first-child')
        if (imageContainer) {
          const image = imageContainer.querySelector('img, div.bg-gray-300')
          if (image) {
            image.classList.remove('h-48')
            image.classList.add('h-64')
          }
        }
      })
      
      // Update button states
      this.updateButtonStates('grid')
    } else {
      // List layout
      container.classList.remove('grid', 'grid-cols-8')
      container.classList.add('flex', 'flex-col', 'gap-4')
      
      items.forEach(item => {
        // Remove all span classes
        for (let i = 1; i <= 8; i++) {
          item.classList.remove(`col-span-${i}`)
        }
        item.classList.add('col-span-8')
        
        // List style
        const imageContainer = item.querySelector('div:first-child')
        if (imageContainer) {
          const image = imageContainer.querySelector('img, div.bg-gray-300')
          if (image) {
            image.classList.remove('h-64')
            image.classList.add('h-48')
          }
        }
      })
      
      // Update button states
      this.updateButtonStates('list')
    }
  }

  updateButtonStates(activeMode) {
    const gridBtn = document.querySelector('[data-layout-btn="grid"]')
    const listBtn = document.querySelector('[data-layout-btn="list"]')
    
    if (gridBtn && listBtn) {
      if (activeMode === 'grid') {
        gridBtn.classList.add('bg-gray-900', 'text-white')
        gridBtn.classList.remove('bg-gray-100', 'text-gray-800')
        listBtn.classList.remove('bg-gray-900', 'text-white')
        listBtn.classList.add('bg-gray-100', 'text-gray-800')
      } else {
        listBtn.classList.add('bg-gray-900', 'text-white')
        listBtn.classList.remove('bg-gray-100', 'text-gray-800')
        gridBtn.classList.remove('bg-gray-900', 'text-white')
        gridBtn.classList.add('bg-gray-100', 'text-gray-800')
      }
    }
  }
}

  connect() {
    this.updateLayout();
  }

  toggleGrid() {
    this.modeValue = "grid";
    this.updateLayout();
  }

  toggleList() {
    this.modeValue = "list";
    this.updateLayout();
  }

  updateLayout() {
    const container = this.containerTarget;
    const cards = container.querySelectorAll("[data-case-card]");

    if (this.modeValue === "grid") {
      // Grid layout
      container.classList.remove("flex", "flex-col", "gap-4");
      container.classList.add(
        "grid",
        "grid-cols-1",
        "md:grid-cols-2",
        "lg:grid-cols-3",
        "gap-4",
      );

      cards.forEach((card) => {
        card.classList.remove("flex", "flex-col", "md:flex-row");

        // Update image container
        const imageContainer = card.querySelector("div:first-child");
        if (imageContainer) {
          imageContainer.classList.remove("md:w-1/3", "flex-shrink-0");
          imageContainer.classList.add("w-full");
        }

        // Update image
        const image = card.querySelector("img, div.bg-gray-300");
        if (image) {
          image.classList.remove("h-48", "md:h-full");
          image.classList.add("h-64");
        }

        // Update content container
        const contentContainer = card.querySelector("div.p-4");
        if (contentContainer) {
          contentContainer.classList.remove("flex-1");
        }

        // Hide description in grid mode
        const description = card.querySelector(".line-clamp-3");
        if (description) {
          description.classList.add("hidden");
        }
      });

      // Update button states
      this.updateButtonStates("grid");
    } else {
      // List layout
      container.classList.remove(
        "grid",
        "grid-cols-1",
        "md:grid-cols-2",
        "lg:grid-cols-3",
      );
      container.classList.add("flex", "flex-col", "gap-4");

      cards.forEach((card) => {
        card.classList.add("flex", "flex-col", "md:flex-row");

        // Update image container
        const imageContainer = card.querySelector("div:first-child");
        if (imageContainer) {
          imageContainer.classList.add("md:w-1/3", "flex-shrink-0");
          imageContainer.classList.remove("w-full");
        }

        // Update image
        const image = card.querySelector("img, div.bg-gray-300");
        if (image) {
          image.classList.add("h-48", "md:h-full");
          image.classList.remove("h-64");
        }

        // Update content container
        const contentContainer = card.querySelector("div.p-4");
        if (contentContainer) {
          contentContainer.classList.add("flex-1");
        }

        // Show description in list mode
        const description = card.querySelector(".line-clamp-3");
        if (description) {
          description.classList.remove("hidden");
        }
      });

      // Update button states
      this.updateButtonStates("list");
    }
  }

  updateButtonStates(activeMode) {
    const gridBtn = document.querySelector('[data-layout-btn="grid"]');
    const listBtn = document.querySelector('[data-layout-btn="list"]');

    if (gridBtn && listBtn) {
      if (activeMode === "grid") {
        gridBtn.classList.add("bg-gray-900", "text-white");
        gridBtn.classList.remove("bg-gray-100", "text-gray-800");
        listBtn.classList.remove("bg-gray-900", "text-white");
        listBtn.classList.add("bg-gray-100", "text-gray-800");
      } else {
        listBtn.classList.add("bg-gray-900", "text-white");
        listBtn.classList.remove("bg-gray-100", "text-gray-800");
        gridBtn.classList.remove("bg-gray-900", "text-white");
        gridBtn.classList.add("bg-gray-100", "text-gray-800");
      }
    }
  }
}
