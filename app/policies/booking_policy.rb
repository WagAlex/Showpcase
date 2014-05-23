class BookingPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def create?
    !user.nil?
  end

  def show?
    record.user || record.shop.user || user.admin
  end

  def update?
    show?
  end

  def destroy?
    user.admin || record.user
  end
end
