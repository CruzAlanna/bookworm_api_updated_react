class ReportPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin? || user.librarian?
        scope.all
      else
        scope.where(resolved: true)
      end
    end
  end

  attr_reader :user, :report

  def initialize(user, report)
    @user = user
    @report = report
  end

  def index?
    true
  end

  def show?
    user.librarian? || user.admin?
  end

  def create?
    true
  end

  def destroy?
    user.admin?
  end

  def resolve?
    user.librarian? || user.admin?
  end
end
