import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="article-preview"
export default class extends Controller {
  static targets = [
    "item",
    "preview",
    "image",
    "title",
    "description",
    "metadata",
    "link",
  ];

  connect() {
    // Select first article by default
    const firstItem = this.itemTargets[0];
    if (firstItem) {
      this.selectItem(firstItem);
    }
  }

  select(event) {
    const item = event.currentTarget;
    this.selectItem(item);
  }

  selectItem(item) {
    // Remove active state from all items
    this.itemTargets.forEach((i) => {
      i.classList.remove("bg-gray-200", "border-l-4", "border-l-gray-900");
      i.classList.add("bg-white");
    });

    // Add active state to selected item
    item.classList.remove("bg-white");
    item.classList.add("bg-gray-200", "border-l-4", "border-l-gray-900");

    // Update preview content
    const title = item.dataset.articleTitle;
    const image = item.dataset.articleImage;
    const description = item.dataset.articleDescription;
    const date = item.dataset.articleDate;
    const author = item.dataset.articleAuthor;
    const tag = item.dataset.articleTag;
    const url = item.dataset.articleUrl;

    // Update preview elements
    if (this.hasTitleTarget) {
      this.titleTarget.textContent = title;
    }

    if (this.hasImageTarget && image) {
      this.imageTarget.src = image;
      this.imageTarget.classList.remove("hidden");
    } else if (this.hasImageTarget) {
      this.imageTarget.classList.add("hidden");
    }

    if (this.hasDescriptionTarget) {
      this.descriptionTarget.textContent =
        description || "No description available.";
    }

    if (this.hasMetadataTarget) {
      this.metadataTarget.innerHTML = `
        <div class="flex items-center gap-1">
          <i class="ri-calendar-line"></i>
          <span>${date}</span>
        </div>
        <div class="flex items-center gap-1">
          <i class="ri-user-line"></i>
          <span>${author}</span>
        </div>
        ${
          tag
            ? `
        <div class="flex items-center gap-1">
          <i class="ri-price-tag-3-line"></i>
          <span>${tag}</span>
        </div>
        `
            : ""
        }
      `;
    }

    if (this.hasLinkTarget && url) {
      this.linkTarget.href = url;
    }
  }
}
