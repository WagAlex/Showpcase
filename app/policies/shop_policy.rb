class ShopPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    !user.nil?
  end

  def new?
    create?
  end

  def update?
    user == record.user || user.admin
  end

  def edit?
    update?
  end

  def destroy?
    if user
      user.admin? || user == record.user
    else
      false
    end
  end
end
