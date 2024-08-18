class CallPolicy < ApplicationPolicy
  def index?
    user.admin? || user.engineer? || user.technician?
  end

  def show?
    user.admin? || user.engineer? || record.client == user
  end

  def create?
    user.admin? || user.client?
  end

  def update?
    user.admin? || (user.engineer? && record.engineer == user) || (user.technician? && record.technician == user)
  end

  def destroy?
    user.admin?
  end
end
