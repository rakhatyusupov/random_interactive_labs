class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: :follower_id
  belongs_to :followable, polymorphic: true

  validates :follower_id, uniqueness: { scope: [:followable_type, :followable_id] }
end
