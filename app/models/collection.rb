class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_items, dependent: :destroy

  # Tagging with Gutentag
  Gutentag::ActiveRecord.call self

  # Cover image
  has_one_attached :cover_image

  # Validations
  validates :title, presence: true
  validates :slug, uniqueness: true, allow_nil: true

  # Scopes
  scope :recent, -> { order(created_at: :desc) }

  # Callbacks
  before_save :generate_slug, if: -> { slug.blank? }

  private

  def generate_slug
    self.slug = title.parameterize if title.present?
  end
end
