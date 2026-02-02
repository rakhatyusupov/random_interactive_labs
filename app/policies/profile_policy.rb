class ProfilePolicy < ApplicationPolicy
  def show?
    true
  end

  def follow?
    user.present? && user != record
  end

  def unfollow?
    follow?
  end
end
