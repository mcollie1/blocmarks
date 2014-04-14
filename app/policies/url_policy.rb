class UrlPolicy < ApplicationPolicy
  def update?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  end

  def destroy?
    update?
  end
end