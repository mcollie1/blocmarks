class UrlPolicy < ApplicationPolicy
  def update?
    user.present? || user.role?(:admin) || user.role?(:moderator)
  end

  def destroy?
    update?
  end
end