class ArticlePolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user&.admin?
        scope.all
      else
        scope.published
      end
    end
  end

  def index?
    true
  end

  def show?
    record.published? || record.user == user || user&.admin?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (record.user == user || user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && (record.user == user || user.admin?)
  end

  def submit?
    user.present? && record.user == user && record.draft?
  end

  def approve?
    user&.admin?
  end

  def publish?
    user&.admin?
  end

  def unpublish?
    user&.admin?
  end
end
