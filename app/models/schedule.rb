class Schedule < ApplicationRecord
  validates :title, length: {maximum: 20}, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validate :start_end_check
  validates :details, length: {maximum: 500}

  def start_end_check
    errors.add(:end, "は開始日以降の日付を選択してください") unless
    self.start <= self.end
  end
end
