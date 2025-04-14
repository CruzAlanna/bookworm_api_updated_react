class Meeting < ApplicationRecord
  validates :date, presence: true
  validates :time, presence: true
  validates :genre, presence: true
  validates :selected_book, presence: true
end
