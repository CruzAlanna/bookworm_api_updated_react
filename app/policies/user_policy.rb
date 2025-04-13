class UserPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
 
  attr_reader :user, :target_user

  def initialize(user, target_user)
    @user = user
    @target_user
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    @target_user == user.id
  end

  def destroy?
    @target_user == user.id || user.admin?
  end
end
