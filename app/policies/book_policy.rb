class BookPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
   
  attr_reader :user, :book

  def initialize(user, book)
    @user = user
    @book = book
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
    user_book = UserBook.find(book.user_id)
    user_book.user_id == user.id || user.admin?
  end

  def destroy?
    user_book = book.user_books.find_by(user_id: user.id)
    user_book.user_id == user.id || user.admin?
  end
end

