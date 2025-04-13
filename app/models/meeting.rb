class Meeting < ApplicationRecord
  validates :date, presence: true
  validates :time, presence: true
end
