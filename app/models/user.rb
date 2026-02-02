class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Follow system - custom implementation
  has_many :follows_as_follower, class_name: "Follow", foreign_key: :follower_id, dependent: :destroy
  has_many :follows_as_followable, class_name: "Follow", as: :followable, dependent: :destroy
  has_many :following_users, through: :follows_as_follower, source: :followable, source_type: "User"
  has_many :followers, through: :follows_as_followable, source: :follower

  # Avatar attachment
  has_one_attached :avatar

  # Associations
  has_many :articles, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :approved_articles, class_name: "Article", foreign_key: "approved_by_id"

  # Validations
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9_]+\z/ }
  validates :email, presence: true, uniqueness: true

  # Methods for following
  def follow(user)
    follows_as_follower.find_or_create_by(followable: user)
  end

  def unfollow(user)
    follows_as_follower.where(followable: user).destroy_all
  end

  def following?(user)
    following_users.include?(user)
  end
end
