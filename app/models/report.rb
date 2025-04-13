class Report < ApplicationRecord
  validates :issue, presence: true
end
