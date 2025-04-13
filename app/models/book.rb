class Book < ApplicationRecord
  has_many :user_books, dependent: :destroy #this was the solution for the server erroring out, the issue was that when one was getting deleted, it couldn't find the other id to delete as well.
  has_many :users, through: :user_books

  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :description, presence: true
  validates :pages, numericality: { greater_than_or_equal_to: 1 }
end

