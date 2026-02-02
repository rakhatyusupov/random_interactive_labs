class Article < ApplicationRecord
  belongs_to :user
  belongs_to :approved_by, class_name: "User", optional: true

  # Rich text content
  has_rich_text :body

  # Cover image
  has_one_attached :cover_image

  # Tagging with Gutentag
  Gutentag::ActiveRecord.call self

  # Status enum: draft, submitted, published
  enum :status, { draft: 0, submitted: 1, published: 2 }, default: :draft

  # Validations
  validates :title, presence: true
  validates :slug, uniqueness: true, allow_nil: true

  # Scopes
  scope :published, -> { where(status: :published).where.not(published_at: nil) }
  scope :recent, -> { order(created_at: :desc) }

  # Callbacks
  before_save :generate_slug, if: -> { slug.blank? }

  private

  def generate_slug
    self.slug = title.parameterize if title.present?
  end
end
