class Schedule < ApplicationRecord
  validates :title, length: {maximum: 20}, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validate :start_end_check
  validates :details, length: {maximum: 500}

  def start_end_check
    if self.end.blank? || self.start.blank?
      return false
    end
    if self.start > self.end
      errors.add(:end, "は開始日以降の日付を選択してください")
    end
  end
end
