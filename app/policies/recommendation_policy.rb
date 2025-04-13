class RecommendationPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
  
  attr_reader :user, :recommendation

  def initialize(user, recommendation)
    @user = user
    @recommendation = recommendation
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    recommendation.user_id == user.id
  end

  def destroy?
    recommendation.user_id == user.id || user.librarian? || user.admin?
  end
end
