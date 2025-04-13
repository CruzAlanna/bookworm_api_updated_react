class MeetingPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
  
  attr_reader :user, :meeting

  def initialize(user, meeting)
    @user = user
    @meeting = meeting
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.librarian? || user.admin?
  end

  def update?
    user.librarian? || user.admin?
  end

  def destroy?
    user.librarian? || user.admin?
  end
end
