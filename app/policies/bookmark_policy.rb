class BookmarkPolicy < ApplicationPolicy
  
  def index?
    true
  end

  def update?
    user.present? && user.role?(:admin) 
  end

  def destroy?
    update?
  end
end