class CollectionPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
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

  def add_item?
    update?
  end

  def remove_item?
    update?
  end
end
