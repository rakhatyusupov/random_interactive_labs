class CollectionItem < ApplicationRecord
  belongs_to :collection

  # File attachments (for documents, images)
  has_one_attached :file

  # Item types: text, link, image, document, file
  ITEM_TYPES = %w[text link image document file].freeze

  # Validations
  validates :item_type, presence: true, inclusion: { in: ITEM_TYPES }
  validates :title, presence: true
  validates :url, presence: true, if: -> { item_type == 'link' }
  validates :content, presence: true, if: -> { item_type == 'text' }

  # Scopes
  scope :ordered, -> { order(position: :asc, created_at: :desc) }
  scope :by_type, ->(type) { where(item_type: type) }
end
