class Schedule < ApplicationRecord
  validates :title, length: {maximum: 20}, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :details, length: {maximum: 500}
end
